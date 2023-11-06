package com.review;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.util.DBConn;
import com.util.DBUtil;

public class ReviewDAO {
	private Connection conn = DBConn.getConnection();
	
	// 데이터 개수
	public int dataCount() {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {
			sql = "SELECT NVL(COUNT(*), 0) FROM reviewboard ";
			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				result = rs.getInt(1);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(rs);
			DBUtil.close(pstmt);
		}

		return result;
	}
		
	// 검색에서의 데이터 개수
	public int dataCount(String schType, String kwd) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {
			sql = "SELECT NVL(COUNT(*), 0) "
					+ " FROM reviewboard ";
			if (schType.equals("all")) {
				sql += "  WHERE INSTR(subject, ?) >= 1 OR INSTR(content, ?) >= 1 ";
			} else if (schType.equals("reg_date")) {
				kwd = kwd.replaceAll("(\\-|\\/|\\.)", "");
				sql += "  WHERE TO_CHAR(reg_date, 'YYYYMMDD') = ? ";
			} else {
				sql += "  WHERE INSTR(" + schType + ", ?) >= 1 ";
			}

			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, kwd);
			if (schType.equals("all")) {
				pstmt.setString(2, kwd);
			}

			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				result = rs.getInt(1);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(rs);
			DBUtil.close(pstmt);
		}

		return result;
	}
	
	// 전체리뷰 리스트
	public List<ReviewDTO> listReview(int offset, int size) {
		List<ReviewDTO> list = new ArrayList<ReviewDTO>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuilder sb = new StringBuilder();

		try {
			sb.append(" SELECT reviewboardnum, rb.productcode, reviewcontent, star, hitCount, ");
			sb.append(" bestOrNot,reviewShowOrNot, orderDetailNum, reviewer, TO_CHAR(regDate, 'YYYY-MM-DD') regDate, p.image, p.productName");
			//sb.append("      NVL(replyCount, 0) replyCount ");
			sb.append(" FROM reviewboard rb");
			sb.append(" JOIN  product p ON rb.productcode = p.productcode ");
			//sb.append(" JOIN member1 m ON b.userId = m.userId ");
			//sb.append(" LEFT OUTER JOIN ( ");
			//sb.append("     SELECT num, COUNT(*) replyCount ");
			//sb.append("     FROM bbsReply ");
			//sb.append("     WHERE answer = 0 ");
			//sb.append("     GROUP BY num");
			//sb.append(" ) c ON b.num = c.num");
			sb.append(" ORDER BY reviewboardnum ASC ");
			sb.append(" OFFSET ? ROWS FETCH FIRST ? ROWS ONLY ");

			pstmt = conn.prepareStatement(sb.toString());
			
			pstmt.setInt(1, offset);
			pstmt.setInt(2, size);

			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				ReviewDTO dto = new ReviewDTO();

				dto.setReviewBoardNum(rs.getLong("reviewboardnum"));
				dto.setProductCode(rs.getString("productcode"));
				dto.setReviewContent(rs.getString("reviewcontent"));
				dto.setStar(rs.getInt("star"));
				dto.setHitCount(rs.getInt("hitCount"));
				dto.setBestOrNot(rs.getInt("bestOrNot"));
				dto.setReviewShowOrNot(rs.getInt("reviewShowOrNot"));
				dto.setOrderDetailNum(rs.getInt("orderDetailNum"));
				dto.setReviewer(rs.getString("reviewer"));
				dto.setRegDate(rs.getString("regDate"));
				dto.setImage(rs.getString("image"));
				dto.setProductName(rs.getString("productName"));
				//dto.setReplyCount(rs.getInt("replyCount"));

				list.add(dto);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(rs);
			DBUtil.close(pstmt);
		}

		return list;
	}
	
	
	// 마이리뷰 리스트
	public List<ReviewDTO> listMyReview(int offset, int size) {
		List<ReviewDTO> list = new ArrayList<ReviewDTO>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuilder sb = new StringBuilder();

		try {
			sb.append(" SELECT reviewboardnum, rb.productcode, reviewcontent, star, hitCount, ");
			sb.append(" bestOrNot,reviewShowOrNot, od.orderDetailNum, reviewer, TO_CHAR(regDate, 'YYYY-MM-DD') regDate, "
					+ " p.image,  p.productName, TO_CHAR(op.orderDate,'YYYY-MM-DD') orderDate ");
			//sb.append("      NVL(replyCount, 0) replyCount ");
			sb.append(" FROM reviewboard rb");
			sb.append(" JOIN  product p ON rb.productcode = p.productcode ");
			sb.append(" JOIN orderdetail od ON od.orderDetailNum = rb.orderDetailNum ");
			sb.append(" JOIN orderprice op ON od.orderNum = op.orderNum ");
			
			//sb.append(" JOIN member1 m ON b.userId = m.userId ");
			//sb.append(" LEFT OUTER JOIN ( ");
			//sb.append("     SELECT num, COUNT(*) replyCount ");
			//sb.append("     FROM bbsReply ");
			//sb.append("     WHERE answer = 0 ");
			//sb.append("     GROUP BY num");
			//sb.append(" ) c ON b.num = c.num");
			sb.append(" ORDER BY reviewboardnum ASC ");
			sb.append(" OFFSET ? ROWS FETCH FIRST ? ROWS ONLY ");

			pstmt = conn.prepareStatement(sb.toString());
			
			pstmt.setInt(1, offset);
			pstmt.setInt(2, size);

			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				ReviewDTO dto = new ReviewDTO();

				dto.setReviewBoardNum(rs.getLong("reviewboardnum"));
				dto.setProductCode(rs.getString("productcode"));
				dto.setReviewContent(rs.getString("reviewcontent"));
				dto.setStar(rs.getInt("star"));
				dto.setHitCount(rs.getInt("hitCount"));
				dto.setBestOrNot(rs.getInt("bestOrNot"));
				dto.setReviewShowOrNot(rs.getInt("reviewShowOrNot"));
				dto.setOrderDetailNum(rs.getInt("orderDetailNum"));
				dto.setReviewer(rs.getString("reviewer"));
				dto.setRegDate(rs.getString("regDate"));
				dto.setImage(rs.getString("image"));
				dto.setProductName(rs.getString("productName"));
				dto.setOrderDate(rs.getString("orderDate"));
				//dto.setReplyCount(rs.getInt("replyCount"));
				
				list.add(dto);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(rs);
			DBUtil.close(pstmt);
		}
		return list;
	}
	
	
	 // 전체리뷰 검색 리스트
	 
	public List<ReviewDTO> listReview(int offset, int size, String schType, String kwd) {
		List<ReviewDTO> list = new ArrayList<ReviewDTO>();/*
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuilder sb = new StringBuilder();

		try {
			sb.append(" SELECT b.num, userName, subject, hitCount, ");
			sb.append("      TO_CHAR(reg_date, 'YYYY-MM-DD') reg_date, ");
			sb.append("      NVL(replyCount, 0) replyCount ");
			sb.append(" FROM bbs b ");
			sb.append(" JOIN member1 m ON b.userId = m.userId ");
			sb.append(" LEFT OUTER JOIN ( ");
			sb.append("     SELECT num, COUNT(*) replyCount ");
			sb.append("     FROM bbsReply ");
			sb.append("     WHERE answer=0 ");
			sb.append("     GROUP BY num");
			sb.append(" ) c ON b.num = c.num");
			if (schType.equals("all")) {
				sb.append(" WHERE INSTR(subject, ?) >= 1 OR INSTR(content, ?) >= 1 ");
			} else if (schType.equals("reg_date")) {
				kwd = kwd.replaceAll("(\\-|\\/|\\.)", "");
				sb.append(" WHERE TO_CHAR(reg_date, 'YYYYMMDD') = ?");
			} else {
				sb.append(" WHERE INSTR(" + schType + ", ?) >= 1 ");
			}
			sb.append(" ORDER BY num DESC ");
			sb.append(" OFFSET ? ROWS FETCH FIRST ? ROWS ONLY ");

			pstmt = conn.prepareStatement(sb.toString());
			
			if (schType.equals("all")) {
				pstmt.setString(1, kwd);
				pstmt.setString(2, kwd);
				pstmt.setInt(3, offset);
				pstmt.setInt(4, size);
			} else {
				pstmt.setString(1, kwd);
				pstmt.setInt(2, offset);
				pstmt.setInt(3, size);
			}

			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				ReviewDTO dto = new ReviewDTO();

				dto.setNum(rs.getLong("num"));
				dto.setUserName(rs.getString("userName"));
				dto.setSubject(rs.getString("subject"));
				dto.setHitCount(rs.getInt("hitCount"));
				dto.setReg_date(rs.getString("reg_date"));
				
				dto.setReplyCount(rs.getInt("replyCount"));

					list.add(dto);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				DBUtil.close(rs);
				DBUtil.close(pstmt);
			}
*/
			return list;
		}
	

}
