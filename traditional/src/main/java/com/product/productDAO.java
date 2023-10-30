package com.product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.util.DBConn;
import com.util.DBUtil;

public class productDAO {
	private Connection conn = DBConn.getConnection();
	
	// 전체상품 리스트
	public List<productDTO> listproduct() {
		List<productDTO> list = new ArrayList<productDTO>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuilder sb = new StringBuilder();

		try {
			// sb.append(" SELECT b1.productCode, productName, productPrice, b2.star, hashtag ");
			sb.append(" SELECT productCode, productName, productPrice, hashtag ");
			sb.append(" FROM product ");
			// sb.append(" JOIN reviewBoard b2 ON b1.productCode = b2.productCode ");
			// 별점은 리뷰테이블 연결되면(주문상세랑도 연결되있어서 지금당장은 만질수가 x)
			
			pstmt = conn.prepareStatement(sb.toString());

			rs = pstmt.executeQuery();

			while (rs.next()) {
				productDTO dto = new productDTO();

				dto.setProductCode(rs.getString("productCode"));
				dto.setProductName(rs.getString("productName"));
				dto.setProductPrice(rs.getInt("productPrice"));
				// dto.setStar(rs.getInt("star"));
				dto.setHashtag(rs.getString("hashtag"));

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
	
	// 데이터 개수
		public int dataCount() {
			int result = 0;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql;

			try {
				sql = "SELECT NVL(COUNT(*), 0) FROM product";
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
		// 높은 가격순으로 상품 목록을 가져오는 메서드
		public List<productDTO> listProductsByPriceHigh() {
		    List<productDTO> list = new ArrayList<productDTO>();
		    PreparedStatement pstmt = null;
		    ResultSet rs = null;
		    StringBuilder sb = new StringBuilder();

		    try {
		        sb.append("SELECT productCode, productName, productPrice, hashtag ");
		        sb.append("FROM product ");
		        // sb.append("JOIN reviewBoard b2 ON b1.productCode = b2.productCode ");
		        sb.append("ORDER BY productPrice DESC"); // 높은 가격순으로 정렬

		        pstmt = conn.prepareStatement(sb.toString());

		        rs = pstmt.executeQuery();

		        while (rs.next()) {
		            productDTO dto = new productDTO();
		            dto.setProductCode(rs.getString("productCode"));
		            dto.setProductName(rs.getString("productName"));
		            dto.setProductPrice(rs.getInt("productPrice"));
		            dto.setHashtag(rs.getString("hashtag"));

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
		public List<productDTO> listProductsByPriceLow() {
			   List<productDTO> list = new ArrayList<productDTO>();
			   PreparedStatement pstmt = null;
			   ResultSet rs = null;
			   StringBuilder sb = new StringBuilder();

			   try {
			       sb.append("SELECT productCode, productName, productPrice, hashtag ");
			       sb.append("FROM product ");
			       // sb.append("JOIN reviewBoard b2 ON b1.productCode = b2.productCode ");
			       sb.append("ORDER BY productPrice ASC"); // 낮은 가격순으로 정렬

			       pstmt = conn.prepareStatement(sb.toString());

			       rs = pstmt.executeQuery();

			       while (rs.next()) {
			           productDTO dto = new productDTO();
			           dto.setProductCode(rs.getString("productCode"));
			           dto.setProductName(rs.getString("productName"));
			           dto.setProductPrice(rs.getInt("productPrice"));
			           // dto.setStar(rs.getInt("star"));
			           dto.setHashtag(rs.getString("hashtag"));

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
		
		
}
