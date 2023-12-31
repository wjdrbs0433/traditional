package com.admin.main;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import com.util.DBConn;
import com.util.DBUtil;

public class MainDAO {
	private Connection conn = DBConn.getConnection();
	
	// 대시보드 그래프
	public List<MainDTO> graph() throws SQLException {
		List<MainDTO> list = new ArrayList<MainDTO>();
		PreparedStatement pstmt = null;
		StringBuilder sb = new StringBuilder();
		LocalDate now = LocalDate.now();
		LocalDate past = LocalDate.of(now.getYear(), now.getMonthValue()-1, 1);

		
		ResultSet rs = null;
		MainDTO dto = null;

		try {
		
				// 일별 조회
				String currentYear = String.valueOf(now.getYear());
				String currentMonth;
				String startMonth;
				String currentDayOfMonth;
				String startDayOfMonth;
				int tmpMonth;
				String pastDate;
				String endDate = now.withDayOfMonth(now.lengthOfMonth()).toString();
				endDate = endDate.substring(endDate.length()-2, endDate.length());
				
				// 오늘이 말일이면 다음달 1월로
				if ( now.getDayOfMonth() == Integer.parseInt(endDate) ) {
//					System.out.println(cal.DAY_OF_MONTH);

					currentMonth = String.valueOf(now.getMonthValue()+1);
					startMonth = String.valueOf(now.getMonthValue());
					currentDayOfMonth = String.valueOf(1);
				} else {
					// 아니면 평소처럼
					startMonth = String.valueOf(now.getMonthValue());	//	11
					currentMonth = String.valueOf(now.getMonthValue());	//	11
					currentDayOfMonth = String.valueOf(now.getDayOfMonth()+1);	//	2
				}
				
				// 오늘이 1~7일이면
				if (now.getDayOfMonth() <= 7) {
					int difference = 7 - now.getDayOfMonth();
					//  startDayOfMonth가 저번달 말일이어야함
					// 	1일 일때	->	 start 가  now.withDayOfMonth(now.lengthOfMonth()-1) -6 -> 
					// 2일 일때 - > start 가 now.withDayOfMonth(now.lengthOfMonth()-1) - 5
					
					// 월 처리
					tmpMonth = Integer.parseInt(startMonth);
					tmpMonth -= 1;
					startMonth = String.valueOf(tmpMonth);
					// 일 처리
					
					
					pastDate = past.withDayOfMonth(past.lengthOfMonth()).toString();
					
					// 2023-10-31

					pastDate = pastDate.substring(pastDate.length()-2, pastDate.length());
					int a = Integer.parseInt(pastDate);
					a -= difference;
					startDayOfMonth = String.valueOf(a) ;
				} else {
					startDayOfMonth = String.valueOf(now.getDayOfMonth()-7);
				}
				
				
				
				
				sb.append("SELECT TO_CHAR(b.dt, 'YYYY-MM-DD') AS mRegDate, NVL(SUM(a.cnt), 0) AS cnt ");
	            sb.append(" FROM (SELECT TO_CHAR(mRegDate, 'YYYY-MM-DD') AS mRegDate, COUNT(*) AS cnt ");
	            sb.append(" FROM member ");
	            sb.append(" WHERE mRegDate BETWEEN TO_DATE(?, 'YYYY-MM-DD') AND TO_DATE(?, 'YYYY-MM-DD') ");
	            sb.append(" GROUP BY mRegDate) a , ");
	            sb.append(" ( SELECT TO_DATE(?, 'YYYY-MM-DD') + LEVEL - 1 AS dt ");
	            sb.append(" FROM dual ");
	            sb.append(" CONNECT BY LEVEL <= (TO_DATE(?, 'YYYY-MM-DD') - TO_DATE(?, 'YYYY-MM-DD') + 1)) b ");
	            sb.append(" WHERE b.dt = a.mRegDate(+) ");
	            sb.append(" GROUP BY b.dt ");
	            sb.append(" ORDER BY b.dt");
	            
	            String start = currentYear + "-" + startMonth + "-" + startDayOfMonth;
				String last = currentYear + "-" + currentMonth + "-" + currentDayOfMonth;

				pstmt = conn.prepareStatement(sb.toString());
				
				
				pstmt.setString(1, start);
				pstmt.setString(2, last);
				pstmt.setString(3, start);
				pstmt.setString(4, last);
				pstmt.setString(5, start);
			
				rs = pstmt.executeQuery();
			
				while( rs.next() ) {
					dto = new MainDTO();
					
					dto.setmRegDate(rs.getString("mRegDate"));
					dto.setCnt(rs.getInt("cnt"));

					list.add(dto);
				
				}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}  finally {
			DBUtil.close(pstmt);
			DBUtil.close(rs);
		}
		
		
		return list;
	}
	
	// 회원 관리
	// 전체 회원 수
	public int dataCountMember() {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		int result = 0;
		
		try {
			sql = "SELECT COUNT(*) FROM member WHERE deleteOrNot = 0";
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			if( rs.next() ) {
				result = rs.getInt(1);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(rs);
			DBUtil.close(pstmt);
		}
		
		return result;
	}
	
	// 탈퇴 회원 수
	public int dataCountNotMember() {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		int result = 0;
		
		try {
			sql = "SELECT COUNT(*) FROM member WHERE deleteOrNot = 1";
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			if( rs.next() ) {
				result = rs.getInt(1);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(rs);
			DBUtil.close(pstmt);
		}
		
		return result;
	}
	
	// 관리자 수
	public int dataCountAdmin() {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		int result = 0;
			
		try {
			sql = "SELECT COUNT(*) FROM member WHERE adminOrNot = 1";
			pstmt = conn.prepareStatement(sql);
				
			rs = pstmt.executeQuery();
				
			if( rs.next() ) {
				result = rs.getInt(1);
			}
				
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(rs);
			DBUtil.close(pstmt);
		}
			
		return result;
	}
	
	
	// 상품 관리
	// 판매중 
		public int dataCountSell() {
			int result = 0;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql;
			
			try {
				sql = "SELECT COUNT(*) FROM product WHERE extinctOrNot = 1";
				pstmt = conn.prepareStatement(sql);
				
				rs = pstmt.executeQuery();
				
				if( rs.next() ) {
					result = rs.getInt(1);
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				DBUtil.close(rs);
				DBUtil.close(pstmt);
			}
			
			return result;
		}
	
	// 품절
		public int dataCountSold() {
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql;
			int result = 0;
			
			try {
				sql = "SELECT COUNT(*) FROM product WHERE inventory = 0";
				pstmt = conn.prepareStatement(sql);
				
				rs = pstmt.executeQuery();
				
				if( rs.next() ) {
					result = rs.getInt(1);
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				DBUtil.close(rs);
				DBUtil.close(pstmt);
			}
			
			return result;
		}
		// 단종
		public int dataCountExtinct() {
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql;
			int result = 0;
			
			try {
				sql = "SELECT COUNT(*) FROM product WHERE extinctOrNot = 0";
				pstmt = conn.prepareStatement(sql);
				
				rs = pstmt.executeQuery();
				
				if( rs.next() ) {
					result = rs.getInt(1);
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				DBUtil.close(rs);
				DBUtil.close(pstmt);
			}
			
			return result;
		}
		
		
		// 주문관리
		public int dataCountOk() {
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql;
			int result = 0;
			
			try {
				sql = "SELECT COUNT(*) FROM orderprice WHERE orderStatus = '결제완료'";
				pstmt = conn.prepareStatement(sql);
				
				rs = pstmt.executeQuery();
				
				if( rs.next() ) {
					result = rs.getInt(1);
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				DBUtil.close(rs);
				DBUtil.close(pstmt);
			}
			
			return result;
		}
		
		public int dataCountReady() {
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql;
			int result = 0;
			
			try {
				sql = "SELECT COUNT(*) FROM orderprice WHERE orderStatus = '배송준비중'";
				pstmt = conn.prepareStatement(sql);
				
				rs = pstmt.executeQuery();
				
				if( rs.next() ) {
					result = rs.getInt(1);
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				DBUtil.close(rs);
				DBUtil.close(pstmt);
			}
			
			return result;
		}
		
		public int dataCountComplete() {
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql;
			int result = 0;
			
			try {
				sql = "SELECT COUNT(*) FROM orderprice WHERE orderStatus = '배송완료'";
				pstmt = conn.prepareStatement(sql);
				
				rs = pstmt.executeQuery();
				
				if( rs.next() ) {
					result = rs.getInt(1);
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				DBUtil.close(rs);
				DBUtil.close(pstmt);
			}
			
			return result;
		}
		
		
		// 리뷰 및 문의
		// 금일 리뷰 건수
		public int dataCountReview() {
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql;
			int result = 0;
			
			try {
				sql = "SELECT COUNT(*) FROM reviewboard"
						+ " WHERE TO_CHAR(regDate, 'YYYYMMDD') = TO_CHAR(SYSDATE, 'YYYYMMDD')";
				pstmt = conn.prepareStatement(sql);
				
				rs = pstmt.executeQuery();
				
				if( rs.next() ) {
					result = rs.getInt(1);
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				DBUtil.close(rs);
				DBUtil.close(pstmt);
			}
			
			return result;
		}
		
		// 금일 문의 건수
		public int dataCountQna() {
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql;
			int result = 0;
					
			try {
			sql = "SELECT COUNT(*) FROM qna"
				+ " WHERE TO_CHAR(reg_date, 'YYYYMMDD') = TO_CHAR(SYSDATE, 'YYYYMMDD')";
			pstmt = conn.prepareStatement(sql);
									
			rs = pstmt.executeQuery();
									
			if( rs.next() ) {
				result = rs.getInt(1);
			}
									
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
					DBUtil.close(rs);
					DBUtil.close(pstmt);
			}
								
				return result;
		}
		
		// 답변 대기중
		public int dataCountQnaReady() {
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql;
			int result = 0;
			
			try {
				sql = "SELECT COUNT(*) FROM qna WHERE answerId IS NULL";
				pstmt = conn.prepareStatement(sql);
				
				rs = pstmt.executeQuery();
				
				if( rs.next() ) {
					result = rs.getInt(1);
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				DBUtil.close(rs);
				DBUtil.close(pstmt);
			}
			
			return result;
		}
		
		
		// 사이트 현황
		// 금일 방문자 수
		public int dataCountVisitor() {
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql;
			int result = 0;
					
			try {
			sql = "SELECT count FROM visitor WHERE TO_CHAR(day,'YYYY-MM-DD') = TO_CHAR(SYSDATE, 'YYYY-MM-DD')";
			pstmt = conn.prepareStatement(sql);
									
			rs = pstmt.executeQuery();
									
			if( rs.next() ) {
				result = rs.getInt(1)  ;
			}
									
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
					DBUtil.close(rs);
					DBUtil.close(pstmt);
			}
								
				return result;
		}

		
		
		// 일 주문 건수
		public int dataCountOrder() {
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql;
			int result = 0;
					
			try {
			sql = "SELECT COUNT(*) FROM orderprice"
				+ " WHERE TO_CHAR(orderDate, 'YYYYMMDD') = TO_CHAR(SYSDATE, 'YYYYMMDD')";
			pstmt = conn.prepareStatement(sql);
									
			rs = pstmt.executeQuery();
									
			if( rs.next() ) {
				result = rs.getInt(1);
			}
									
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
					DBUtil.close(rs);
					DBUtil.close(pstmt);
			}
								
				return result;
		}
}
