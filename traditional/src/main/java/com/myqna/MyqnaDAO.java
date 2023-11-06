package com.myqna;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.qna.QnaDTO;
import com.util.DBConn;
import com.util.DBUtil;

public class MyqnaDAO {
	private Connection conn = DBConn.getConnection();
	
	// 데이터 개수
	public int dataCount(String userId) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {
			sql = "SELECT NVL(COUNT(*), 0) FROM qna WHERE userId = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);

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
	
	// 게시물 리스트
	public List<QnaDTO> listQuestion(int offset, int size, String userId) {
		List<QnaDTO> list = new ArrayList<QnaDTO>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuilder sb = new StringBuilder();

		try {
			sb.append(" SELECT num, secret, q.userId, title, answerId, content, ");
			sb.append("       TO_CHAR(reg_date, 'YYYY-MM-DD') reg_date ");
			sb.append(" FROM qna q ");
			sb.append(" JOIN member m ON q.userId = m.mid ");
			sb.append(" WHERE q.userId = ? ");
			sb.append(" ORDER BY num DESC ");
			sb.append(" OFFSET ? ROWS FETCH FIRST ? ROWS ONLY ");

			pstmt = conn.prepareStatement(sb.toString());
			
			pstmt.setString(1, userId);
			pstmt.setInt(2, offset);
			pstmt.setInt(3, size);

			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				QnaDTO dto = new QnaDTO();
			
				dto.setNum(rs.getLong("num"));
				dto.setSecret(rs.getInt("secret"));
				dto.setUserId(rs.getString("userId"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setReg_date(rs.getString("reg_date"));
				dto.setAnswerId(rs.getString("answerId"));

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
	
	
		// 게시물 삭제
		public void deleteQuestion(long num, String userId) throws SQLException {
			PreparedStatement pstmt = null;
			String sql;

			try {
				if (userId.equals("admin")) {
					sql = "DELETE FROM qna WHERE num=?";
					pstmt = conn.prepareStatement(sql);
					
					pstmt.setLong(1, num);
					
					pstmt.executeUpdate();
				} else {
					sql = "DELETE FROM qna WHERE num=? AND userId=?";
					
					pstmt = conn.prepareStatement(sql);
					
					pstmt.setLong(1, num);
					pstmt.setString(2, userId);
					
					pstmt.executeUpdate();
				}
			} catch (SQLException e) {
				e.printStackTrace();
				throw e;
			} finally {
				DBUtil.close(pstmt);
			}
		}
}
