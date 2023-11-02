package com.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.util.DBConn;
import com.util.DBUtil;

public class MemberDAO {
	private Connection conn = DBConn.getConnection();
	
	public MemberDTO loginMember(String mid, String mpwd) {
		MemberDTO dto = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		
		try {
			sql = " SELECT mid, mpwd, mname, mnum "
					+ " FROM member "
					+ " WHERE mid = ? AND mpwd = ? ";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, mid);
			pstmt.setString(2, mpwd);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto = new MemberDTO();
				
				dto.setMid(rs.getString("mid"));
				dto.setMpwd(rs.getString("mpwd"));
				dto.setMname(rs.getString("mname"));
				dto.setMnum(rs.getInt("mnum"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(rs);
			DBUtil.close(pstmt);
		}
		
		return dto;
	}
	
	public void insertMember(MemberDTO dto) throws SQLException {
	    PreparedStatement pstmt = null;
	    String sql;
	    
	    try {
	        conn.setAutoCommit(false);
	        
	        sql = "INSERT INTO member (MNUM, MID, MPWD, MNAME, MRNUM, MTEL, MPHONE, MEMAIL, FIELD, FIELD2, ADMINORNOT, mregdate) "
	            + " VALUES (member_seq.nextval, ?, ?, ?, TO_DATE(?,'YYYY-MM-DD'), ?, ?, ?, ?, ?, ?, SYSDATE)";
	        
	        pstmt = conn.prepareStatement(sql);
	        
	        pstmt.setString(1, dto.getMid());
	        pstmt.setString(2, dto.getMpwd());
	        pstmt.setString(3, dto.getMname());
	        pstmt.setString(4, dto.getMrnum());
	        pstmt.setString(5, dto.getMtel());
	        pstmt.setString(6, dto.getMphone());
	        pstmt.setString(7, dto.getMemail());
	        pstmt.setString(8, dto.getField());
	        pstmt.setString(9, dto.getField2());
	        pstmt.setInt(10, dto.getAdminOrNot());
	        
	        pstmt.executeUpdate();
	        
	        pstmt.close();
	        pstmt = null;
	                
	        conn.commit();

	    } catch (SQLException e) {
	        DBUtil.rollback(conn);
	        
	        e.printStackTrace();
	        throw e;
	    } finally {
	        DBUtil.close(pstmt);
	        
	        try {
	            conn.setAutoCommit(true);
	        } catch (SQLException e2) {
	        }
	    }
	}
	
	public MemberDTO findByPwd(String mid, String mname, String memail, String mphone) {
		   MemberDTO dto = null;
		    PreparedStatement pstmt = null;
		    ResultSet rs = null;
		    StringBuilder sb = new StringBuilder();

		    try {
		        sb.append("SELECT mpwd FROM member WHERE mid = ? AND mname = ? AND memail = ? AND mphone = ?");
		        pstmt = conn.prepareStatement(sb.toString());
		        pstmt.setString(1, mid);
		        pstmt.setString(2, mname);
		        pstmt.setString(3, memail);
		        pstmt.setString(4, mphone);

		        rs = pstmt.executeQuery();

		        if (rs.next()) {
		            dto = new MemberDTO();
		            dto.setMpwd(rs.getString("mpwd"));
		        }
		    } catch (SQLException e) {
		        e.printStackTrace();
		    } finally {
		        DBUtil.close(rs);
		        DBUtil.close(pstmt);
		    }

		    return dto;
		}
	
	public MemberDTO findById(String mname, String memail, String mphone) {
		   MemberDTO dto = null;
		    PreparedStatement pstmt = null;
		    ResultSet rs = null;
		    StringBuilder sb = new StringBuilder();

		    try {
		        sb.append("SELECT mid FROM member WHERE mname = ? AND memail = ? AND mphone = ?");
		        pstmt = conn.prepareStatement(sb.toString());

		        pstmt.setString(1, mname);
		        pstmt.setString(2, memail);
		        pstmt.setString(3, mphone);

		        rs = pstmt.executeQuery();

		        if (rs.next()) {
		            dto = new MemberDTO();
		            dto.setMid(rs.getString("mid"));
		        }
		    } catch (SQLException e) {
		        e.printStackTrace();
		    } finally {
		        DBUtil.close(rs);
		        DBUtil.close(pstmt);
		    }

		    return dto;
		}
	
	public MemberDTO mypage(int mnum) {
		MemberDTO dto = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		
		try {
			sql = " SELECT mname, mid, mpwd, memail, mphone, Field, Field2 "
					+ " FROM member "
					+ " WHERE mnum = ? ";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, mnum);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto = new MemberDTO();
				
				dto.setMname(rs.getString("mname"));
				dto.setMid(rs.getString("mid"));
				dto.setMpwd(rs.getString("mpwd"));
				dto.setMemail(rs.getString("memail"));
				dto.setMphone(rs.getString("mphone"));
				dto.setField(rs.getString("field"));
				dto.setField2(rs.getString("field2"));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(rs);
			DBUtil.close(pstmt);
		}
		
		return dto;
	}
	
}
