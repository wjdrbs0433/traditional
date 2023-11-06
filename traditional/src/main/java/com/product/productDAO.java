package com.product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
			sb.append(" FROM product");
			// sb.append(" right outer JOIN reviewBoard b2 ON b1.productCode = b2.productCode ");
			// 별점은 리뷰테이블 연결되면(주문상세랑도 연결되있어서 지금당장은 만질수가 x)
			
			pstmt = conn.prepareStatement(sb.toString());

			rs = pstmt.executeQuery();

			while (rs.next()) {
				productDTO dto = new productDTO();

				dto.setProductCode(rs.getString("productCode"));
				dto.setProductName(rs.getString("productName"));
				dto.setProductPrice(rs.getInt("productPrice"));
				// dto.setStar(rs.getDouble("star"));
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
		
		public Map<String, Integer> dataCountreview() {
		    Map<String, Integer> reviewCountMap = new HashMap<>();
		    PreparedStatement pstmt = null;
		    ResultSet rs = null;
		    String sql;

		    try {
		        sql = "SELECT p.productCode, COUNT(rb.reviewBoardNum) AS reviewCount " +
		              "FROM product p " +
		              "LEFT JOIN reviewBoard rb ON p.productCode = rb.productCode " +
		              "GROUP BY p.productCode";

		        pstmt = conn.prepareStatement(sql);
		        rs = pstmt.executeQuery();

		        while (rs.next()) {
		            String productCode = rs.getString("productCode");
		            int reviewCount = rs.getInt("reviewCount");
		            reviewCountMap.put(productCode, reviewCount);
		        }

		    } catch (SQLException e) {
		        e.printStackTrace();
		    } finally {
		        DBUtil.close(rs);
		        DBUtil.close(pstmt);
		    }

		    return reviewCountMap;
		}
		
		public Map<String, Double> averageStarByProduct() {
		    Map<String, Double> averageStarMap = new HashMap<>();
		    PreparedStatement pstmt = null;
		    ResultSet rs = null;
		    String sql;

		    try {
		        sql = "SELECT product.productCode, ROUND(NVL(AVG(star), 0.0), 1) AS avgStar " +
		              "FROM product " +
		              "LEFT JOIN reviewBoard ON product.productCode = reviewBoard.productCode " +
		              "GROUP BY product.productCode";

		        pstmt = conn.prepareStatement(sql);
		        rs = pstmt.executeQuery();

		        while (rs.next()) {
		            String productCode = rs.getString("productCode");
		            double avgStar = rs.getDouble("avgStar");
		            averageStarMap.put(productCode, avgStar);
		        }

		    } catch (SQLException e) {
		        e.printStackTrace();
		    } finally {
		        DBUtil.close(rs);
		        DBUtil.close(pstmt);
		    }

		    return averageStarMap;
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
		
	public productDTO productdetail(String productcode) {
			productDTO dto = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql;
			
			try {
				sql = " SELECT productCode, productName, productPrice, productSubject,  ExpirationDate, productStorage, breweryPage, "
						+ " productcategory, hashtag, alcoholPercent, productTaste, productPerson, "
						+ " inventory, extinctOrNot, price, volume "
						+ " FROM product "
						+ " WHERE productcode = ? ";
				
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, productcode);
				
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					dto = new productDTO();
					
					dto.setProductCode(rs.getString("productCode"));
					dto.setProductName(rs.getString("productName"));
					dto.setProductPrice(rs.getInt("productPrice"));
					dto.setProductSubject(rs.getString("productSubject"));
					dto.setExpirationDate(rs.getString("expirationDate"));
					dto.setProductStorage(rs.getString("productStorage"));
					dto.setBreweryPage(rs.getString("breweryPage"));
					dto.setProductcategory(rs.getString("productcategory"));
					dto.setHashtag(rs.getString("hashtag"));
					dto.setAlcoholPercent(rs.getInt("alcoholPercent"));
					dto.setProductTaste(rs.getString("productTaste"));
					dto.setProductPerson(rs.getString("productPerson"));
					dto.setInventory(rs.getInt("inventory"));
					dto.setExtinctOrNot(rs.getInt("extinctOrNot"));
					dto.setPrice(rs.getInt("price"));
					dto.setVolume(rs.getInt("volume"));

				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				DBUtil.close(rs);
				DBUtil.close(pstmt);
			}
			
			return dto;
	}
	
	public int orderNumber() {
		int seq = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		
		try {
			sql = " SELECT orderprice_seq.NEXTVAL "
					+ " FROM dual ";
			
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				seq = rs.getInt(1);

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(rs);
			DBUtil.close(pstmt);
		}
		
		return seq;
}	
	
	// 데이터 추가
	public void insertproduct(productDTO dto) throws SQLException {
	    PreparedStatement pstmt = null;
	    String sql;
	    int generatedOrderNum = 0; // 생성된 주문 번호를 저장할 변수
	    ResultSet rs = null;

	    try {
	        // orderprice_seq.NEXTVAL를 사용하여 새로운 주문 번호를 생성
	        sql = "INSERT INTO orderprice(orderNum, orderDate, orderprice, totalprice, orderRequire, shippingFee, orderStatus, ordername, "
	                + " orderphone, addressnum, address1, address2, mnum ) "
	                + " VALUES (?, SYSDATE, ?, ?, ?, 3000, '결제완료', ?, ?, ?, ?, ?, ?)";
	        pstmt = conn.prepareStatement(sql);

	        pstmt.setInt(1, dto.getOrderNum());
	        pstmt.setInt(2, dto.getOrderprice());
	        pstmt.setInt(3, dto.getTotalprice()+3000);
	        pstmt.setString(4, dto.getOrderRequire());
	        pstmt.setString(5, dto.getOrdername());
	        pstmt.setString(6, dto.getOrderphone());
	        pstmt.setInt(7, dto.getAddressnum());
	        pstmt.setString(8, dto.getAddress1());
	        pstmt.setString(9, dto.getAddress2());
	        pstmt.setInt(10, dto.getMnum());

	        pstmt.executeUpdate();
	        pstmt.close();
	        

	        
	        // 생성된 주문 번호를 얻어옴
	        generatedOrderNum = getGeneratedOrderNumber(); // getGeneratedOrderNumber 메서드를 정의하여 시퀀스 값을 얻어옴
	        pstmt.close();
	        
	        // orderDetail 테이블에 데이터 추가
	        sql = "INSERT INTO orderDetail(orderDetailNum, orderCount, pricePerProduct, orderNum, productCode) "
	                + " VALUES (orderDetail_seq.NEXTVAL, ?, ?, ?, ?)";
	        
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setInt(1, dto.getOrderCount());
	        pstmt.setInt(2, dto.getPricePerProduct());
	        pstmt.setInt(3, generatedOrderNum); // 생성된 주문 번호 사용
	        pstmt.setString(4, dto.getProductCode());

	        pstmt.executeUpdate();
	        pstmt.close();
	        
	        sql = "SELECT inventory FROM product WHERE productcode = ?";
            pstmt = conn.prepareStatement(sql);

            pstmt.setString(1, dto.getProductCode());
            rs = pstmt.executeQuery();

            int currentInventory = 0;

            if (rs.next()) {
                currentInventory = rs.getInt("inventory");
            }

            int newInventory = currentInventory - dto.getOrderCount(); // 새로운 재고 수량 계산

            sql = "UPDATE product SET inventory=? WHERE productCode=?";
            pstmt = conn.prepareStatement(sql);

            pstmt.setInt(1, newInventory); // 수정된 재고 수량을 사용
            pstmt.setString(2, dto.getProductCode());

            pstmt.executeUpdate();
            pstmt.close();
	        
	        
	    } catch (SQLException e) {
	        e.printStackTrace();
	        throw e;
	    } finally {
	        DBUtil.close(pstmt);
	    }
	}

	// 시퀀스에서 생성된 주문 번호를 얻는 메서드
	private int getGeneratedOrderNumber() {
	    int orderNum = 0;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    String sql = "SELECT orderprice_seq.CURRVAL FROM dual"; // 시퀀스의 현재 값을 가져옴

	    try {
	        pstmt = conn.prepareStatement(sql);
	        rs = pstmt.executeQuery();

	        if (rs.next()) {
	            orderNum = rs.getInt(1);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        DBUtil.close(rs);
	        DBUtil.close(pstmt);
	    }

	    return orderNum;
	}
}
