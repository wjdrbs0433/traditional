package com.qna;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.util.DBConn;
import com.util.DBUtil;

public class QnaDAO {
	private Connection conn = DBConn.getConnection();

	// 데이터 추가
	public void insertQuestion(QnaDTO dto) throws SQLException {
		PreparedStatement pstmt = null;
		String sql;

		
		try {
			sql = "INSERT INTO qna(num, userId, secret, title, content, reg_date) "
					+ " VALUES (qna_seq.NEXTVAL, ?, ?, ?, ?, SYSDATE)";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getUserId());
			pstmt.setInt(2, dto.getSecret());
			pstmt.setString(3, dto.getTitle());
			pstmt.setString(4, dto.getContent());

			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		} finally {
			DBUtil.close(pstmt);
		}
	}

	// 데이터 개수
	public int dataCount() {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {
			sql = "SELECT NVL(COUNT(*), 0) FROM qna";
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
	public int dataCount(String kwd) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {
			sql = "SELECT NVL(COUNT(*), 0) "
					+ " FROM qna "
					+ " WHERE INSTR(title, ?) >= 1 OR INSTR(content, ?) >= 1 OR INSTR(answer, ?) >= 1 ";

			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, kwd);
			pstmt.setString(2, kwd);
			pstmt.setString(3, kwd);

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
	public List<QnaDTO> listQuestion(int offset, int size) {
		List<QnaDTO> list = new ArrayList<QnaDTO>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuilder sb = new StringBuilder();

		try {
			sb.append(" SELECT num, secret, q.userId, title, answerId, ");
			sb.append("       TO_CHAR(reg_date, 'YYYY-MM-DD') reg_date ");
			sb.append(" FROM qna q ");
			sb.append(" JOIN member m ON q.userId = m.mid ");
			sb.append(" ORDER BY num DESC ");
			sb.append(" OFFSET ? ROWS FETCH FIRST ? ROWS ONLY ");

			pstmt = conn.prepareStatement(sb.toString());
			
			pstmt.setInt(1, offset);
			pstmt.setInt(2, size);

			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				QnaDTO dto = new QnaDTO();

				dto.setNum(rs.getLong("num"));
				dto.setSecret(rs.getInt("secret"));
				dto.setUserId(rs.getString("userId"));
				dto.setTitle(rs.getString("title"));
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

	public List<QnaDTO> listQuestion(int offset, int size, String kwd) {
		List<QnaDTO> list = new ArrayList<QnaDTO>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuilder sb = new StringBuilder();

		try {
			sb.append(" SELECT num, secret, q.userId, title, answerId, ");
			sb.append("       TO_CHAR(reg_date, 'YYYY-MM-DD') reg_date ");
			sb.append(" FROM qna q ");
			sb.append(" JOIN member m ON q.userId = m.mid ");
			sb.append(" WHERE INSTR(title, ?) >= 1 OR INSTR(content, ?) >= 1 OR INSTR(answer, ?) >= 1 ");
			sb.append(" ORDER BY num DESC ");
			sb.append(" OFFSET ? ROWS FETCH FIRST ? ROWS ONLY ");

			pstmt = conn.prepareStatement(sb.toString());
			
			pstmt.setString(1, kwd);
			pstmt.setString(2, kwd);
			pstmt.setString(3, kwd);
			pstmt.setInt(4, offset);
			pstmt.setInt(5, size);

			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				QnaDTO dto = new QnaDTO();

				dto.setNum(rs.getLong("num"));
				dto.setSecret(rs.getInt("secret"));
				dto.setUserId(rs.getString("userId"));
				dto.setTitle(rs.getString("title"));
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

	// 해당 게시물 보기
	public QnaDTO findById(long num) {
		QnaDTO dto = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {
			sql = "SELECT num, secret, q.userId, title, content, reg_date, "
					+ " answerId, answerName, answer, answer_date "
					+ " FROM qna q "
					+ " JOIN member m ON q.userId=m.mid "
					+ " WHERE num = ? ";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setLong(1, num);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				dto = new QnaDTO();
				
				dto.setNum(rs.getLong("num"));
				dto.setSecret(rs.getInt("secret"));
				dto.setUserId(rs.getString("userId"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setReg_date(rs.getString("reg_date"));
				dto.setAnswerId(rs.getString("answerId"));
				dto.setAnswerName(rs.getString("answerName"));
				dto.setAnswer(rs.getString("answer"));
				dto.setAnswer_date(rs.getString("answer_date"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(rs);
			DBUtil.close(pstmt);
		}

		return dto;
	}

	// 이전글
	public QnaDTO findByPrev(long num, String kwd) {
		QnaDTO dto = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuilder sb = new StringBuilder();

		try {
			if (kwd != null && kwd.length() != 0) {
				sb.append(" SELECT num, secret, title, userId ");
				sb.append(" FROM qna ");
				sb.append(" WHERE ( num > ? ) ");
				sb.append("     AND ( INSTR(title, ?) >= 1 OR INSTR(content, ?) >= 1 OR INSTR(answer, ?) >= 1) ");
				sb.append(" ORDER BY num ASC ");
				sb.append(" FETCH FIRST 1 ROWS ONLY ");

				pstmt = conn.prepareStatement(sb.toString());
				
				pstmt.setLong(1, num);
				pstmt.setString(2, kwd);
				pstmt.setString(3, kwd);
				pstmt.setString(4, kwd);
			} else {
				sb.append(" SELECT num, secret, title, userId ");
				sb.append(" FROM qna ");
				sb.append(" WHERE num > ? ");
				sb.append(" ORDER BY num ASC ");
				sb.append(" FETCH FIRST 1 ROWS ONLY ");

				pstmt = conn.prepareStatement(sb.toString());
				
				pstmt.setLong(1, num);
			}

			rs = pstmt.executeQuery();

			if (rs.next()) {
				dto = new QnaDTO();
				
				dto.setNum(rs.getLong("num"));
				dto.setSecret(rs.getInt("secret"));
				dto.setUserId(rs.getString("userId"));
				dto.setTitle(rs.getString("title"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(rs);
			DBUtil.close(pstmt);
		}

		return dto;
	}

	// 다음글
	public QnaDTO findByNext(long num, String kwd) {
		QnaDTO dto = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuilder sb = new StringBuilder();

		try {
			if (kwd != null && kwd.length() != 0) {
				sb.append(" SELECT num, secret, title, userId ");
				sb.append(" FROM qna ");
				sb.append(" WHERE ( num < ? ) ");
				sb.append("     AND ( INSTR(title, ?) >= 1 OR INSTR(content, ?) >= 1 OR INSTR(answer, ?) >= 1) ");
				sb.append(" ORDER BY num DESC ");
				sb.append(" FETCH FIRST 1 ROWS ONLY ");

				pstmt = conn.prepareStatement(sb.toString());
				
				pstmt.setLong(1, num);
				pstmt.setString(2, kwd);
				pstmt.setString(3, kwd);
				pstmt.setString(4, kwd);
			} else {
				sb.append(" SELECT num, secret, title, userId ");
				sb.append(" FROM qna ");
				sb.append(" WHERE num < ? ");
				sb.append(" ORDER BY num DESC ");
				sb.append(" FETCH FIRST 1 ROWS ONLY ");

				pstmt = conn.prepareStatement(sb.toString());
				
				pstmt.setLong(1, num);
			}

			rs = pstmt.executeQuery();

			if (rs.next()) {
				dto = new QnaDTO();
				
				dto.setNum(rs.getLong("num"));
				dto.setSecret(rs.getInt("secret"));
				dto.setUserId(rs.getString("userId"));
				dto.setTitle(rs.getString("title"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(rs);
			DBUtil.close(pstmt);
		}

		return dto;
	}

	// 게시물 수정
	public void updateQuestion(QnaDTO dto) throws SQLException {
		PreparedStatement pstmt = null;
		String sql;

		try {
			sql = "UPDATE qna SET title=?, secret=?, content=? WHERE num=? AND userId=?";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getTitle());
			pstmt.setInt(2, dto.getSecret());
			pstmt.setString(3, dto.getContent());
			pstmt.setLong(4, dto.getNum());
			pstmt.setString(5, dto.getUserId());
			
			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		} finally {
			DBUtil.close(pstmt);
		}
	}

	public void updateAnswer(QnaDTO dto) throws SQLException {
		PreparedStatement pstmt = null;
		String sql;

		try {
			sql = "UPDATE qna SET answer=?, answerId=?, ";
			if(dto.getAnswer().length() == 0) {
				sql += " answer_date=NULL ";
			} else {
				sql += " answer_date=SYSDATE ";
			}
			sql += " WHERE num = ?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getAnswer());
			pstmt.setString(2, dto.getAnswerId());
			pstmt.setLong(3, dto.getNum());
			
			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		} finally {
			DBUtil.close(pstmt);
		}

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
