package com.admin.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.util.DBConn;
import com.util.DBUtil;

public class MemberDAO {
	private Connection conn = DBConn.getConnection();

	// 전체회원 리스트
	public List<MemberDTO> listMember(int offset, int size) {
		List<MemberDTO> list = new ArrayList<MemberDTO>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuilder sb = new StringBuilder();

		try {
			sb.append(" SELECT mNum,mId,mPwd,mName,mRnum,mTel,mPhone,mEmail,field,field2,adminOrNot,TO_CHAR(mRegDate,'YYYY-MM-DD') mRegDate,deleteOrNot ");
			sb.append(" FROM member ");
			sb.append(" WHERE deleteOrNot = 0 ");
			sb.append(" ORDER BY mNum ASC ");
			sb.append(" OFFSET ? ROWS FETCH FIRST ? ROWS ONLY ");

			pstmt = conn.prepareStatement(sb.toString());

			pstmt.setInt(1, offset);
			pstmt.setInt(2, size);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				MemberDTO dto = new MemberDTO();

				dto.setmNum(rs.getLong("mNum"));
				dto.setmId(rs.getString("mId"));
				dto.setmPwd(rs.getString("mPwd"));
				dto.setmName(rs.getString("mName"));
				dto.setmRnum(rs.getString("mRnum"));
				dto.setmTel(rs.getString("mTel"));
				dto.setmPhone(rs.getString("mPhone"));
				dto.setmEmail(rs.getString("mEmail"));
				dto.setField(rs.getString("field"));
				dto.setField2(rs.getString("field2"));
				dto.setAdminOrNot(rs.getInt("adminOrNot"));
				dto.setmRegDate(rs.getString("mRegDate"));
				dto.setDeleteOrNot(rs.getInt("deleteOrNot"));
					
				list.add(dto);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(rs);
			DBUtil.close(pstmt);
		}

		return list;
	}
	
	// 검색 시 회원리스트
	public List<MemberDTO> listMember(int offset, int size, String schType, String kwd) {
      List<MemberDTO> list = new ArrayList<MemberDTO>();
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      StringBuilder sb = new StringBuilder();

      try {
	    	  if(schType.equals("mAge")){ // 연령대구하기. 서브쿼리 사용
	    		  sb.append(" SELECT mNum,mId,mPwd,mName,mRnum,mTel,mPhone,mEmail,field,field2,adminOrNot, mRegDate, deleteOrNot FROM ( " );
	    		  sb.append(" SELECT mNum,mId,mPwd,mName,mTel,mPhone,mEmail,field,field2,adminOrNot,TO_CHAR(mRegDate,'YYYY-MM-DD') mRegDate, mRnum, deleteOrNot, ");
	    		  sb.append(" trunc((months_between(sysdate,to_date(substr(mRnum,1,6),'rrmmdd'))/12)/10)*10 as ages ");
	    		  sb.append(" FROM member ");
	    		  sb.append(" ) WHERE ages=? AND deleteOrNot=0 ");
	    		  
	    	  } else if (schType.equals("mRegDate")) { // 가입일
	        	  sb.append(" SELECT mNum,mId,mPwd,mName,mRnum,mTel,mPhone,mEmail,field,field2,adminOrNot,TO_CHAR(mRegDate,'YYYY-MM-DD') mRegDate, deleteOrNot ");
	              sb.append(" FROM member ");
	              kwd = kwd.replaceAll("(\\-|\\/|\\.)", "");
	              sb.append(" WHERE TO_CHAR(mRegDate, 'YYYYMMDD') = ? AND deleteOrNot=0 ");
	              
	         
	         } else { // 이름(mName)
	        	  sb.append(" SELECT mNum,mId,mPwd,mName,mRnum,mTel,mPhone,mEmail,field,field2,adminOrNot,TO_CHAR(mRegDate,'YYYY-MM-DD') mRegDate, deleteOrNot ");
	              sb.append(" FROM member ");
	              sb.append(" WHERE INSTR(" + schType + ", ?) >= 1 AND deleteOrNot=0 ");
	         }
	    	  
	         sb.append(" ORDER BY mNum ASC ");
	         sb.append(" OFFSET ? ROWS FETCH FIRST ? ROWS ONLY ");
	
	         pstmt = conn.prepareStatement(sb.toString());
	         
	         if(schType.equals("agreeSms")) {
	        	 pstmt.setInt(1, offset);
		         pstmt.setInt(2, size); 
	         } else {
		         pstmt.setString(1, kwd);
		         pstmt.setInt(2, offset);
		         pstmt.setInt(3, size);
	         }
	
	         rs = pstmt.executeQuery();
    	 
         while (rs.next()) {
            MemberDTO dto = new MemberDTO();

            dto.setmNum(rs.getLong("mNum"));
            dto.setmId(rs.getString("mId"));
            dto.setmPwd(rs.getString("mPwd"));
            dto.setmName(rs.getString("mName"));
            dto.setmRnum(rs.getString("mRnum"));
            dto.setmTel(rs.getString("mTel"));
            dto.setmPhone(rs.getString("mPhone"));
            dto.setmEmail(rs.getString("mEmail"));
            dto.setField(rs.getString("field"));
            dto.setField2(rs.getString("field2"));
            dto.setAdminOrNot(rs.getInt("adminOrNot"));
            dto.setmRegDate(rs.getString("mRegDate"));
            dto.setDeleteOrNot(rs.getInt("deleteOrNot"));
            
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
	
	// 수신여부 체크검색 시 리스트
	public List<MemberDTO> listMember2(int offset, int size,String agreeSms, String agreeEmail) {
		List<MemberDTO> list = new ArrayList<MemberDTO>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuilder sb = new StringBuilder();


		try {
			sb.append(" SELECT mNum,mId,mPwd,mName,mRnum,mTel,mPhone,mEmail,field,field2,adminOrNot,TO_CHAR(mRegDate,'YYYY-MM-DD') mRegDate,deleteOrNot ");
			sb.append(" FROM member WHERE deleteOrNot = 0 ");
			
			if(agreeSms != null && agreeEmail != null ){
	             sb.append(" AND field = 'Y' AND field2 = 'Y'");
			} else if(agreeSms != null) {
	             //sb.append("  WHERE field = 'Y' AND field2 = 'N'");
	             sb.append("  AND field = 'Y'");
			}  else {
				sb.append("  AND field2 = 'Y'");
			}
			
			sb.append(" ORDER BY mNum ASC");
			sb.append(" OFFSET ? ROWS FETCH FIRST ? ROWS ONLY ");

			pstmt = conn.prepareStatement(sb.toString());

			pstmt.setInt(1, offset);
			pstmt.setInt(2, size);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				MemberDTO dto = new MemberDTO();

				dto.setmNum(rs.getLong("mNum"));
				dto.setmId(rs.getString("mId"));
				dto.setmPwd(rs.getString("mPwd"));
				dto.setmName(rs.getString("mName"));
				dto.setmRnum(rs.getString("mRnum"));
				dto.setmTel(rs.getString("mTel"));
				dto.setmPhone(rs.getString("mPhone"));
				dto.setmEmail(rs.getString("mEmail"));
				dto.setField(rs.getString("field"));
				dto.setField2(rs.getString("field2"));
				dto.setAdminOrNot(rs.getInt("adminOrNot"));
				dto.setmRegDate(rs.getString("mRegDate"));
				dto.setDeleteOrNot(rs.getInt("deleteOrNot"));
					
				list.add(dto);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(rs);
			DBUtil.close(pstmt);
		}

		return list;
	}

	// 데이터 개수
	public int dataCount() {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {
			sql = "SELECT NVL(COUNT(*), 0) FROM member WHERE deleteOrNot = 0 ";
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
			sql = "SELECT NVL(COUNT(*), 0) "; 
					
			
			if (schType.equals("mAge")) {
				schType="ages";
				sql += " FROM ( "
						+ " SELECT  mNum,mId,mPwd,mName,mTel,mPhone,mEmail,field,field2,adminOrNot,TO_CHAR(mRegDate,'YYYY-MM-DD') mRegDate, deleteOrNot "
						+ " trunc((months_between(sysdate,to_date(substr(mRnum,1,6),'rrmmdd'))/12)/10)*10 as ages "
						+ " FROM member "
						+ " ) WHERE INSTR(" + schType + ", ?) >= 1 AND deleteOrNot=0 ";
			} else if (schType.equals("mRegDate")) {
				sql += " FROM member ";
				kwd = kwd.replaceAll("(\\-|\\/|\\.)", "");
				sql += "  WHERE TO_CHAR(mRegDate, 'YYYYMMDD') = ?  AND deleteOrNot=0 ";
			} else {
				sql += " FROM member ";
				sql += "  WHERE INSTR(" + schType + ", ?) >= 1  AND deleteOrNot=0 ";
			}

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, kwd);

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
		
	
	// 수신여부 체크에서 데이터 개수
	public int dataCount2(String agreeSms, String agreeEmail) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {
			sql = "SELECT NVL(COUNT(*), 0) FROM member WHERE deleteOrNot = 0 ";
			
			if (agreeSms != null && agreeEmail != null ) {
				sql += " AND field = 'Y' AND field2 = 'Y' "; 			
			} else if(agreeSms!= null) {
				sql += " AND field = 'Y'";
			} else {
				sql += " AND field2 = 'Y'";
			}

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
		System.out.println(result);
		return result;
	}
	

	public MemberDTO findById(long num) {
		MemberDTO dto = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {
			sql = "SELECT mNum,mId,mPwd,mRnum,mName,mTel,mPhone,mEmail,field,field2,adminOrNot,TO_CHAR(mRegDate,'YYYY-MM-DD') mRegDate, deleteOrNot "
					+ " FROM member WHERE deleteOrNot = 0 AND mNum = ?";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setLong(1, num);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				dto = new MemberDTO();

				dto.setmNum(rs.getLong("mNum"));
	            dto.setmId(rs.getString("mId"));
	            dto.setmPwd(rs.getString("mPwd"));
	            dto.setmName(rs.getString("mName"));
	            dto.setmRnum(rs.getString("mRnum"));
	            dto.setmTel(rs.getString("mTel"));
	            dto.setmPhone(rs.getString("mPhone"));
	            dto.setmEmail(rs.getString("mEmail"));
	            dto.setField(rs.getString("field"));
	            dto.setField2(rs.getString("field2"));
	            dto.setAdminOrNot(rs.getInt("adminOrNot"));
	            dto.setmRegDate(rs.getString("mRegDate"));
	            dto.setDeleteOrNot(rs.getInt("deleteOrNot"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(rs);
			DBUtil.close(pstmt);
		}
		return dto;
	}
	
	// 회원삭제하면 회원탈퇴 컬럼을 1로 수정 (실제로 update)
	public void updateMember(Long mNum) throws SQLException {
		PreparedStatement pstmt = null;
		String sql;

		try {
			sql = "UPDATE member SET deleteOrNot=1 "
					+ " WHERE mNum=?";
			pstmt = conn.prepareStatement(sql);
			System.out.println(mNum);
			
			pstmt.setLong(1, mNum);
			
			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		} finally {
			DBUtil.close(pstmt);
		}

	}
	
	public void updateMemberList(long[] nums) throws SQLException{
		PreparedStatement pstmt = null;
		String sql;

		try {
			sql = "UPDATE member SET deleteOrNot = 1 WHERE mNum IN (";
			for (int i = 0; i < nums.length; i++) {
				sql += "?,";
			}
			sql = sql.substring(0, sql.length() - 1) + ")";

			pstmt = conn.prepareStatement(sql);
			
			for (int i = 0; i < nums.length; i++) {
				pstmt.setLong(i + 1, nums[i]);
			}
			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		} finally {
			DBUtil.close(pstmt);
		}

	}	

}