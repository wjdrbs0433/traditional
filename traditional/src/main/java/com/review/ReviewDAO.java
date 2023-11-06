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
			sb.append(" SELECT reviewboardnum, rb.productcode, reviewcontent, star,  ");
			sb.append(" bestOrNot, od.reviewWriteOrNot, od.orderDetailNum, m.mName, TO_CHAR(regDate, 'YYYY-MM-DD') regDate, p.image, p.productName");
			sb.append(" FROM reviewboard rb");
			sb.append(" JOIN product p ON rb.productcode = p.productcode ");
			sb.append(" JOIN orderDetail od ON od.orderDetailNum = rb.orderDetailNum ");
			sb.append(" JOIN orderPrice op On op.orderNum = od.orderNum ");
			sb.append(" JOIN member m ON m.mNum =op.mNum ");
			sb.append(" ORDER BY rb.reviewboardnum desc ");
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
				dto.setStar(rs.getDouble("star"));
				dto.setBestOrNot(rs.getInt("bestOrNot"));
				dto.setReviewWriteOrNot(rs.getInt("reviewWriteOrNot"));
				dto.setOrderDetailNum(rs.getInt("orderDetailNum"));
				dto.setRegDate(rs.getString("regDate"));
				dto.setImage(rs.getString("image"));
				dto.setProductName(rs.getString("productName"));
				dto.setmName(rs.getString("mName"));

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
	
	// 작성가능한 리뷰 찾기
	public ReviewDTO findByCode(String productCode) {
		ReviewDTO dto = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {
			sql = "SELECT m.mName, od.productCode, p.productName, od.orderDetailNum "
					+ " FROM orderDetail od "
					+ " JOIN orderPrice op on op.orderNum = od.orderNum "
					+ " JOIN member m on m.mNum=op.mNum "
					+ " JOIN product p on p.productCode = od.productCode "
					+ " WHERE od.productCode = ? ";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, productCode);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				dto = new ReviewDTO();
				
				dto.setmName(rs.getString("mName"));
				dto.setProductCode(rs.getString("productCode"));
				dto.setProductName(rs.getString("productName"));
				dto.setOrderDetailNum(rs.getInt("orderDetailNum"));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(rs);
			DBUtil.close(pstmt);
		}

		return dto;
	}
	
	
	// 마이리뷰 리스트
	public List<ReviewDTO> listMyReview(int offset, int size) {
		List<ReviewDTO> list = new ArrayList<ReviewDTO>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuilder sb = new StringBuilder();

		try {
			/*
			sb.append(" SELECT reviewboardnum, rb.productcode, reviewcontent, star, ");
			sb.append(" bestOrNot,reviewWriteOrNot, od.orderDetailNum, TO_CHAR(regDate, 'YYYY-MM-DD') regDate, "
					+ " p.image,  p.productName, m.mNum, TO_CHAR(op.orderDate,'YYYY-MM-DD') orderDate ");
			sb.append(" FROM reviewboard rb");
			sb.append(" JOIN  product p ON rb.productcode = p.productcode ");
			sb.append(" JOIN orderdetail od ON od.orderDetailNum = rb.orderDetailNum ");
			sb.append(" JOIN orderprice op ON od.orderNum = op.orderNum ");
			sb.append(" JOIN member m ON m.mNum = op.mNum ");
			sb.append(" WHERE od.reviewWriteOrNot = 0 ");
*/
			
			sb.append(" SELECT TO_CHAR(op.orderDate,'YYYY-MM-DD') orderDate, p.image, p.productName, od.productCode, od.orderDetailNum, od.orderNum ");
			sb.append(" FROM orderdetail od ");
			sb.append(" JOIN orderprice op ON od.orderNum = op.orderNum ");
			sb.append(" JOIN product p ON od.productcode = p.productcode ");
			sb.append(" WHERE od.reviewWriteOrNot = 0 ");

			sb.append(" ORDER BY op.orderDate desc ");
			sb.append(" OFFSET ? ROWS FETCH FIRST ? ROWS ONLY ");
			pstmt = conn.prepareStatement(sb.toString());
			
			pstmt.setInt(1, offset);
			pstmt.setInt(2, size);

			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				ReviewDTO dto = new ReviewDTO();

				//dto.setReviewBoardNum(rs.getLong("reviewboardnum"));
				dto.setProductCode(rs.getString("productcode"));
				//dto.setReviewContent(rs.getString("reviewcontent"));
				//dto.setStar(rs.getDouble("star"));
				//dto.setReviewWriteOrNot(rs.getInt("reviewWriteOrNot"));
				dto.setOrderDetailNum(rs.getInt("orderDetailNum"));
				//dto.setRegDate(rs.getString("regDate"));
				dto.setImage(rs.getString("image"));
				dto.setProductName(rs.getString("productName"));
				dto.setOrderDate(rs.getString("orderDate"));
				dto.setOrderNum(rs.getInt("orderNum"));
				//dto.setmNum(rs.getInt("mNum"));
				
				
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
	
	
	public void insertReview(ReviewDTO dto) throws SQLException {
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		String sql;

		try {
			sql = "INSERT INTO reviewBoard(reviewBoardNum, productCode, reviewContent, star, regDate, bestOrNot, orderDetailNum) "
					+ " VALUES (reviewBoard_seq.NEXTVAL, ?, ?, ?,SYSDATE, 0,?)";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getProductCode());
			pstmt.setString(2, dto.getReviewContent());
			pstmt.setDouble(3, dto.getStar());
			pstmt.setInt(4,dto.getOrderDetailNum());

			pstmt.executeUpdate();
			
			
			sql = "UPDATE orderdetail SET reviewWriteOrNot = 1 WHERE orderDetailNum=? ";
			
			pstmt2 = conn.prepareStatement(sql);
			pstmt2.setInt(1, dto.getOrderDetailNum());

			pstmt2.executeUpdate();
			

		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		} finally {
			DBUtil.close(pstmt);
			DBUtil.close(pstmt2);
		}
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
