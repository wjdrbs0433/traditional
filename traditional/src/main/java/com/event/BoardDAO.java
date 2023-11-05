package com.event;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.util.DBConn;
import com.util.DBUtil;

public class BoardDAO {
	private Connection conn = DBConn.getConnection();

	// 데이터 추가
	public void insertBoard(BoardDTO dto) throws SQLException {
		PreparedStatement pstmt = null;
		String sql;

		try {
			sql = "INSERT INTO event(num, category, mid, subject, content, "
					+ " saveFilename, originalFilename, filesize, hitCount, reg_date) "
					+ " VALUES (event_seq.NEXTVAL, ?, ?, ?, ?, ?, ?, ?, 0, SYSDATE)";
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, dto.getCategory());
			pstmt.setString(2, dto.getMid());
			pstmt.setString(3, dto.getSubject());
			pstmt.setString(4, dto.getContent());
			pstmt.setString(5, dto.getSaveFilename());
			pstmt.setString(6, dto.getOriginalFilename());
			pstmt.setLong(7, dto.getFileSize());

			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		} finally {
			DBUtil.close(pstmt);
		}
	}

	// 데이터 개수
	public int dataCount(int category) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {
			sql = "SELECT NVL(COUNT(*), 0) FROM event WHERE category = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, category);

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
	public int dataCount(int category, String schType, String kwd) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {
			sql = "SELECT NVL(COUNT(*), 0) FROM event b "
					+ " JOIN member m ON b.mid = m.mid "
					+ " WHERE category = ? ";
			if (schType.equals("all")) {
				sql += "  AND (INSTR(subject, ?) >= 1 OR INSTR(content, ?) >= 1) ";
			} else if (schType.equals("reg_date")) {
				kwd = kwd.replaceAll("(\\-|\\/|\\.)", "");
				sql += "  AND TO_CHAR(reg_date, 'YYYYMMDD') = ? ";
			} else {
				sql += "  AND INSTR(" + schType + ", ?) >= 1 ";
			}

			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, category);
			pstmt.setString(2, kwd);
			if (schType.equals("all")) {
				pstmt.setString(3, kwd);
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

	// 게시물 리스트
	public List<BoardDTO> listBoard(int category, int offset, int size) {
		List<BoardDTO> list = new ArrayList<BoardDTO>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuilder sb = new StringBuilder();

		try {
			sb.append(" SELECT num, mname, subject, saveFilename, hitCount, ");
			sb.append("       TO_CHAR(reg_date, 'YYYY-MM-DD') reg_date ");
			sb.append(" FROM event b ");
			sb.append(" JOIN member m ON b.mid = m.mid ");
			sb.append(" WHERE category = ? ");
			sb.append(" ORDER BY num DESC ");
			sb.append(" OFFSET ? ROWS FETCH FIRST ? ROWS ONLY ");

			pstmt = conn.prepareStatement(sb.toString());
			
			pstmt.setInt(1, category);
			pstmt.setInt(2, offset);
			pstmt.setInt(3, size);

			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				BoardDTO dto = new BoardDTO();

				dto.setNum(rs.getLong("num"));
				dto.setMname(rs.getString("mname"));
				dto.setSubject(rs.getString("subject"));
				dto.setSaveFilename(rs.getString("saveFilename"));
				dto.setHitCount(rs.getInt("hitCount"));
				dto.setReg_date(rs.getString("reg_date"));

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

	public List<BoardDTO> listBoard(int category, int offset, int size, String schType, String kwd) {
		List<BoardDTO> list = new ArrayList<BoardDTO>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuilder sb = new StringBuilder();

		try {
			sb.append(" SELECT num, mname, subject, saveFilename, hitCount, ");
			sb.append("       TO_CHAR(reg_date, 'YYYY-MM-DD') reg_date ");
			sb.append(" FROM event b ");
			sb.append(" JOIN member m ON b.mid = m.mid ");
			sb.append(" WHERE category = ? ");
			if (schType.equals("all")) {
				sb.append(" AND (INSTR(subject, ?) >= 1 OR INSTR(content, ?) >= 1) ");
			} else if (schType.equals("reg_date")) {
				kwd = kwd.replaceAll("(\\-|\\/|\\.)", "");
				sb.append(" AND TO_CHAR(reg_date, 'YYYYMMDD') = ?) ");
			} else {
				sb.append(" AND INSTR(" + schType + ", ?) >= 1 ");
			}
			sb.append(" ORDER BY num DESC ");
			sb.append(" OFFSET ? ROWS FETCH FIRST ? ROWS ONLY ");

			pstmt = conn.prepareStatement(sb.toString());
			
			pstmt.setInt(1, category);
			if (schType.equals("all")) {
				pstmt.setString(2, kwd);
				pstmt.setString(3, kwd);
				pstmt.setInt(4, offset);
				pstmt.setInt(5, size);
			} else {
				pstmt.setString(2, kwd);
				pstmt.setInt(3, offset);
				pstmt.setInt(4, size);
			}

			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				BoardDTO dto = new BoardDTO();

				dto.setNum(rs.getLong("num"));
				dto.setMname(rs.getString("mname"));
				dto.setSubject(rs.getString("subject"));
				dto.setSaveFilename(rs.getString("saveFilename"));
				dto.setHitCount(rs.getInt("hitCount"));
				dto.setReg_date(rs.getString("reg_date"));

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

	// 조회수 증가하기
	public void updateHitCount(long num) throws SQLException {
		PreparedStatement pstmt = null;
		String sql;

		try {
			sql = "UPDATE event SET hitCount=hitCount+1 WHERE num=?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setLong(1, num);
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		} finally {
			DBUtil.close(pstmt);
		}
	}

	// 해당 게시물 보기
	public BoardDTO findById(long num) {
		BoardDTO dto = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {
			sql = "SELECT b.num, category, b.mid, mname, subject, content, "
					+ " saveFilename, originalFilename, filesize, reg_date, hitCount, "
					+ " NVL(likeCount, 0) likeCount "
					+ " FROM event b "
					+ " JOIN member m ON b.mid=m.mid "
					+ " LEFT OUTER JOIN ("
					+ "      SELECT num, COUNT(*) likeCount FROM eventLike"
					+ "      GROUP BY num"
					+ " ) bc ON b.num = bc.num"
					+ " WHERE b.num = ? ";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setLong(1, num);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				dto = new BoardDTO();
				
				dto.setNum(rs.getLong("num"));
				dto.setCategory(rs.getInt("category"));
				dto.setMid(rs.getString("mid"));
				dto.setMname(rs.getString("mname"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setSaveFilename(rs.getString("saveFilename"));
				dto.setOriginalFilename(rs.getString("originalFilename"));
				dto.setFileSize(rs.getLong("filesize"));
				dto.setHitCount(rs.getInt("hitCount"));
				dto.setReg_date(rs.getString("reg_date"));
				
				dto.setLikeCount(rs.getInt("likeCount"));				
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
	public BoardDTO findByPrev(int category, long num, String schType, String kwd) {
		BoardDTO dto = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuilder sb = new StringBuilder();

		try {
			if (kwd != null && kwd.length() != 0) {
				sb.append(" SELECT num, subject ");
				sb.append(" FROM event b ");
				sb.append(" JOIN member m ON b.mid = m.mid ");
				sb.append(" WHERE category = ? AND num > ? ");
				if (schType.equals("all")) {
					sb.append("   AND ( INSTR(subject, ?) >= 1 OR INSTR(content, ?) >= 1 ) ");
				} else if (schType.equals("reg_date")) {
					kwd = kwd.replaceAll("(\\-|\\/|\\.)", "");
					sb.append("   AND TO_CHAR(reg_date, 'YYYYMMDD') = ? ");
				} else {
					sb.append("   AND INSTR(" + schType + ", ?) >= 1 ");
				}
				sb.append(" ORDER BY num ASC ");
				sb.append(" FETCH FIRST 1 ROWS ONLY ");

				pstmt = conn.prepareStatement(sb.toString());
				
				pstmt.setInt(1, category);
				pstmt.setLong(2, num);
				pstmt.setString(3, kwd);
				if (schType.equals("all")) {
					pstmt.setString(4, kwd);
				}
			} else {
				sb.append(" SELECT num, subject FROM event ");
				sb.append(" WHERE category = ? AND num > ? ");
				sb.append(" ORDER BY num ASC ");
				sb.append(" FETCH FIRST 1 ROWS ONLY ");

				pstmt = conn.prepareStatement(sb.toString());
				
				pstmt.setInt(1, category);
				pstmt.setLong(2, num);
			}

			rs = pstmt.executeQuery();

			if (rs.next()) {
				dto = new BoardDTO();
				
				dto.setNum(rs.getLong("num"));
				dto.setSubject(rs.getString("subject"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
				}
			}

			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
				}
			}
		}

		return dto;
	}

	// 다음글
	public BoardDTO findByNext(int category, long num, String schType, String kwd) {
		BoardDTO dto = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuilder sb = new StringBuilder();

		try {
			if (kwd != null && kwd.length() != 0) {
				sb.append(" SELECT num, subject ");
				sb.append(" FROM event b ");
				sb.append(" JOIN member m ON b.mid = m.mid ");
				sb.append(" WHERE category = ? AND num < ? ");
				if (schType.equals("all")) {
					sb.append("   AND ( INSTR(subject, ?) >= 1 OR INSTR(content, ?) >= 1 ) ");
				} else if (schType.equals("reg_date")) {
					kwd = kwd.replaceAll("(\\-|\\/|\\.)", "");
					sb.append("   AND TO_CHAR(reg_date, 'YYYYMMDD') = ? ");
				} else {
					sb.append("   AND INSTR(" + schType + ", ?) >= 1 ");
				}
				sb.append(" ORDER BY num DESC ");
				sb.append(" FETCH FIRST 1 ROWS ONLY ");

				pstmt = conn.prepareStatement(sb.toString());
				
				pstmt.setInt(1, category);
				pstmt.setLong(2, num);
				pstmt.setString(3, kwd);
				if (schType.equals("all")) {
					pstmt.setString(4, kwd);
				}
			} else {
				sb.append(" SELECT num, subject FROM event ");
				sb.append(" WHERE category = ? AND num < ? ");
				sb.append(" ORDER BY num DESC ");
				sb.append(" FETCH FIRST 1 ROWS ONLY ");

				pstmt = conn.prepareStatement(sb.toString());
				
				pstmt.setInt(1, category);
				pstmt.setLong(2, num);
			}

			rs = pstmt.executeQuery();

			if (rs.next()) {
				dto = new BoardDTO();
				
				dto.setNum(rs.getLong("num"));
				dto.setSubject(rs.getString("subject"));
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
	public void updateBoard(BoardDTO dto) throws SQLException {
		PreparedStatement pstmt = null;
		String sql;

		try {
			sql = "UPDATE event SET subject=?, content=?, "
					+ " saveFilename=?, originalFilename=?, filesize=? WHERE num=? AND mid=?";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getSubject());
			pstmt.setString(2, dto.getContent());
			pstmt.setString(3, dto.getSaveFilename());
			pstmt.setString(4, dto.getOriginalFilename());
			pstmt.setLong(5, dto.getFileSize());
			pstmt.setLong(6, dto.getNum());
			pstmt.setString(7, dto.getMid());
			
			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		} finally {
			DBUtil.close(pstmt);
		}

	}

	// 게시물 삭제
	public void deleteBoard(long num, String mid) throws SQLException {
		PreparedStatement pstmt = null;
		String sql;

		try {
			if (mid.equals("admin")) {
				sql = "DELETE FROM event WHERE num = ?";
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setLong(1, num);
			} else {
				sql = "DELETE FROM event WHERE num = ? AND mid = ?";
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setLong(1, num);
				pstmt.setString(2, mid);
			}
			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		} finally {
			DBUtil.close(pstmt);
		}
	}
	
	// 로그인 유저의 게시글 공감 유무
	public boolean isUserBoardLike(long num, String mid) {
		boolean result = false;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		
		try {
			sql = "SELECT num, mid "
					+ " FROM eventLike "
					+ " WHERE num = ? AND mid = ?";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setLong(1, num);
			pstmt.setString(2, mid);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(rs);
			DBUtil.close(pstmt);
		}
		
		return result;
	}

	// 게시물의 공감 추가
	public void insertBoardLike(long num, String mid) throws SQLException {
		PreparedStatement pstmt = null;
		String sql;
		
		try {
			sql = "INSERT INTO eventLike(num, mid) VALUES (?, ?)";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setLong(1, num);
			pstmt.setString(2, mid);
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		} finally {
			DBUtil.close(pstmt);
		}
		
	}
	
	// 게시글 공감 삭제
	public void deleteBoardLike(long num, String mid) throws SQLException {
		PreparedStatement pstmt = null;
		String sql;
		
		try {
			sql = "DELETE FROM eventLike WHERE num = ? AND mid = ?";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setLong(1, num);
			pstmt.setString(2, mid);
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		} finally {
			DBUtil.close(pstmt);
		}
		
	}
	
	// 게시물의 공감 개수
	public int countBoardLike(long num) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		
		try {
			sql = "SELECT NVL(COUNT(*), 0) FROM eventLike WHERE num=?";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setLong(1, num);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
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
	
	// 게시물의 댓글 및 답글 추가
	public void insertReply(ReplyDTO dto) throws SQLException {
		PreparedStatement pstmt = null;
		String sql;
		
		try {
			sql = "INSERT INTO eventReply(replyNum, num, mid, content, answer, reg_date) "
					+ " VALUES (eventReply_seq.NEXTVAL, ?, ?, ?, ?, SYSDATE)";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setLong(1, dto.getNum());
			pstmt.setString(2, dto.getMid());
			pstmt.setString(3, dto.getContent());
			pstmt.setLong(4, dto.getAnswer());
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		} finally {
			DBUtil.close(pstmt);
		}
		
	}

	// 게시물의 댓글 개수
	public int dataCountReply(long num) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		
		try {
			sql = "SELECT NVL(COUNT(*), 0) "
					+ " FROM eventReply "
					+ " WHERE num = ? AND answer = 0";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setLong(1, num);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
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

	// 게시물 댓글 리스트
	public List<ReplyDTO> listReply(long num, int offset, int size) {
		List<ReplyDTO> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuilder sb = new StringBuilder();
		
		try {
			sb.append(" SELECT r.replyNum, r.mid, mname, num, content, r.reg_date, ");
			sb.append("     NVL(answerCount, 0) answerCount ");
			sb.append(" FROM eventReply r ");
			sb.append(" JOIN member m ON r.mid = m.mid ");
			sb.append(" LEFT OUTER  JOIN ( ");
			sb.append("     SELECT answer, COUNT(*) answerCount ");
			sb.append("     FROM eventReply ");
			sb.append("     WHERE answer != 0 ");
			sb.append("     GROUP BY answer ");
			sb.append(" ) a ON r.replyNum = a.answer ");
			sb.append(" WHERE num = ? AND r.answer = 0 ");
			sb.append(" ORDER BY r.replyNum DESC ");
			sb.append(" OFFSET ? ROWS FETCH FIRST ? ROWS ONLY ");
			
			pstmt = conn.prepareStatement(sb.toString());
			
			pstmt.setLong(1, num);
			pstmt.setInt(2, offset);
			pstmt.setInt(3, size);

			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ReplyDTO dto = new ReplyDTO();
				
				dto.setReplyNum(rs.getLong("replyNum"));
				dto.setNum(rs.getLong("num"));
				dto.setMid(rs.getString("mid"));
				dto.setMname(rs.getString("mname"));
				dto.setContent(rs.getString("content"));
				dto.setReg_date(rs.getString("reg_date"));
				dto.setAnswerCount(rs.getInt("answerCount"));
				
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

	public ReplyDTO readReply(long replyNum) {
		ReplyDTO dto = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		
		try {
			sql = "SELECT replyNum, num, r.mid, mname, content, r.reg_date "
					+ "  FROM eventReply r "
					+ "  JOIN member m ON r.mid = m.mid  "
					+ "  WHERE replyNum = ? ";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setLong(1, replyNum);

			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto = new ReplyDTO();
				
				dto.setReplyNum(rs.getLong("replyNum"));
				dto.setNum(rs.getLong("num"));
				dto.setMid(rs.getString("mid"));
				dto.setMname(rs.getString("mname"));
				dto.setContent(rs.getString("content"));
				dto.setReg_date(rs.getString("reg_date"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(rs);
			DBUtil.close(pstmt);
		}
		
		return dto;
	}
	
	// 게시물의 댓글 삭제
	public void deleteReply(long replyNum, String mid) throws SQLException {
		PreparedStatement pstmt = null;
		String sql;
		
		if(! mid.equals("admin")) {
			ReplyDTO dto = readReply(replyNum);
			if(dto == null || (! mid.equals(dto.getMid()))) {
				return;
			}
		}
		
		try {
			sql = "DELETE FROM eventReply "
					+ "  WHERE replyNum IN  "
					+ "  (SELECT replyNum FROM eventReply START WITH replyNum = ?"
					+ "     CONNECT BY PRIOR replyNum = answer)";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setLong(1, replyNum);
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		} finally {
			DBUtil.close(pstmt);
		}		
		
	}

	// 댓글의 답글 리스트
	public List<ReplyDTO> listReplyAnswer(long answer) {
		List<ReplyDTO> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		
		try {
			sql = " SELECT replyNum, num, r.mid, mname, content, reg_date, answer "
					+ " FROM eventReply r "
					+ " JOIN member m ON r.mid = m.mid "
					+ " WHERE answer = ? "
					+ " ORDER BY replyNum DESC ";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setLong(1, answer);

			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ReplyDTO dto = new ReplyDTO();
				
				dto.setReplyNum(rs.getLong("replyNum"));
				dto.setNum(rs.getLong("num"));
				dto.setMid(rs.getString("mid"));
				dto.setMname(rs.getString("mname"));
				dto.setContent(rs.getString("content"));
				dto.setReg_date(rs.getString("reg_date"));
				dto.setAnswer(rs.getLong("answer"));
				
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
	
	// 댓글의 답글 개수
	public int dataCountReplyAnswer(long answer) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		
		try {
			sql = "SELECT NVL(COUNT(*), 0) FROM eventReply WHERE answer = ?";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setLong(1, answer);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
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
	
}
