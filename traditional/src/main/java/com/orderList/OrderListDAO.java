package com.orderList;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import com.util.DBConn;
import com.util.DBUtil;

public class OrderListDAO {
	private Connection conn = DBConn.getConnection();
	
	// 데이터 개수
	public int dataCount(int mNum) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuilder sb = new StringBuilder();
		
		try {
			sb.append(" SELECT COUNT(*) ");
//			sb.append(" 	 ");
//			sb.append(" 	 ");
			sb.append(" FROM orderDetail d, product p, orderPrice o, member m ");
//			sb.append(" 	 ");
//			sb.append(" 	 ");
//			sb.append(" 	 ");
			sb.append(" WHERE d.productCode = p.productCode AND d.orderNum = o.orderNum AND o.mNum = m.mnum AND m.mnum = ?");
			
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, String.valueOf(mNum));
			rs = pstmt.executeQuery();
			
			if( rs.next() ) {
				result = rs.getInt(1);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e2) {
			e2.printStackTrace();
		} finally {
			DBUtil.close(rs);
			DBUtil.close(pstmt);
		}
		
		return result;
	}
	
	
	
	// 제품정보 가져오기
	public List<OrderListDTO> listOrder(int mNum) {
		List<OrderListDTO> list = new ArrayList<OrderListDTO>();
		PreparedStatement pstmt = null;
		StringBuilder sb = new StringBuilder();
		ResultSet rs = null;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일");
		
		try {

			sb.append(" SELECT p.productCode, d.orderDetailNum, o.orderDate, m.mName, m.mPhone, o.orderStatus, p.image, p.productName, p.volume, d.pricePerProduct, d.orderCount, o.shippingFee, o.orderRequire, o.orderPrice, o.totalPrice, o.shippingFee ");

//			sb.append(" 	 ");
			sb.append(" FROM orderDetail d, product p, orderPrice o, member m ");
//			sb.append(" 	 ");
//			sb.append(" 	 ");
//			sb.append(" 	 ");
			sb.append(" WHERE d.productCode = p.productCode AND d.orderNum = o.orderNum AND o.mNum = m.mnum AND m.mnum = ? ");
//			sb.append(" 	 ");
//			sb.append(" 	 ");
//			sb.append(" 	");
			
			pstmt = conn.prepareStatement(sb.toString());
			
			pstmt.setString(1, String.valueOf(mNum));
			
			rs = pstmt.executeQuery();
			
			while( rs.next() ) {
				OrderListDTO dto = new OrderListDTO();
				
			try {
				String sqlDate = rs.getString("orderDate").substring(0, rs.getString("orderDate").lastIndexOf("-")+3);
				dto.setOrderDate(sqlDate);
			} catch (Exception e) {
				e.printStackTrace();
				dto.setOrderDate(rs.getString("orderDate"));
			}				
				dto.setProductCode(rs.getString("productCode"));
				dto.setMemberName(rs.getString("mName"));
				dto.setOrderDetailNum(rs.getString("orderDetailNum"));
				String mPhone = rs.getString("mPhone");
				mPhone = mPhone.replace(mPhone.substring(mPhone.indexOf("-"), mPhone.lastIndexOf("-")+1), "-****-");
				dto.setMemberPhone(mPhone);
				
				dto.setOrderStatus(rs.getString("orderStatus"));
				dto.setProductImage(rs.getString("image"));
				dto.setProductName(rs.getString("productName"));
				
				String volume = rs.getString("volume");
				volume += "ml";
				dto.setProductVolume(volume);
				
				
				
				int price = Integer.parseInt(rs.getString("pricePerProduct"));
				String result = NumberFormat.getCurrencyInstance(Locale.KOREA).format(price);
				dto.setProductPrice(result);
				
				
				
				String count = "수량 " + rs.getString("orderCount") + "개"; 
				dto.setOrderCount(count);
						
				
				String shipping = rs.getString("shippingFee") + "원";
				dto.setShippingFee(shipping);
				list.add(dto);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e2) {
			e2.printStackTrace();
		} finally {
			DBUtil.close(rs);
			DBUtil.close(pstmt);
		}

		return list;
	}
	
	public OrderListDetailDTO orderDetail(int mNum, int orderDetailNum) {
		List<OrderListDTO> list = new ArrayList<OrderListDTO>();
		PreparedStatement pstmt = null;
		StringBuilder sb = new StringBuilder();
		ResultSet rs = null;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일");
		OrderListDetailDTO dto = null;
		
		try {
			sb.append(" SELECT p.productCode, o.orderDate, m.mName, m.mPhone, o.orderStatus, p.image, p.productName, p.volume, d.pricePerProduct, d.orderCount, o.shippingFee, de.address1, de.address2, o.orderRequire, o.orderPrice, o.totalPrice ");

			sb.append(" FROM orderDetail d, product p, orderPrice o, member m, delivery de ");
			sb.append(" WHERE (d.productCode = p.productCode) AND (d.orderNum = o.orderNum) AND (o.mNum = m.mNum) AND (m.mnum = ?) AND (m.mnum = de.mNum) AND (d.orderDetailNum = ?)");
			
			pstmt = conn.prepareStatement(sb.toString());
			
			pstmt.setString(1, String.valueOf(mNum));
			pstmt.setInt(2, orderDetailNum);
			
			rs = pstmt.executeQuery();
			
			if( rs.next() ) {
				dto = new OrderListDetailDTO();
			}
			
			
			String sqlDate = rs.getString("orderDate").substring(0, rs.getString("orderDate").lastIndexOf("-")+3);
			
			dto.setOrderDate(sqlDate);
			
			dto.setProductCode(rs.getString("productCode"));
			dto.setMemberName(rs.getString("mName"));
			dto.setMemberPhone(rs.getString("mPhone"));
			dto.setOrderStatus(rs.getString("orderStatus"));
			dto.setImage(rs.getString("image"));
			dto.setProductName(rs.getString("productName"));
			
			String volume = rs.getString("volume");
			volume += "ml";
			dto.setProductVolume(volume);
			
			int price = Integer.parseInt(rs.getString("pricePerProduct"));
			String result = NumberFormat.getCurrencyInstance(Locale.KOREA).format(price);
			dto.setProductPrice(result);

			
			String count = "수량 " + rs.getString("orderCount") + "개"; 
			dto.setOrderCount(count);
			
			String shipping = rs.getString("shippingFee") + "원";
			dto.setShippingFee(shipping);
			
			dto.setMemberAddress1(rs.getString("address1"));
			dto.setMemberAddress2(rs.getString("address2"));
			dto.setOrderRequire(rs.getString("orderRequire"));
			dto.setTotalPrice(rs.getLong("totalPrice"));
			dto.setOrderPrice(rs.getLong("orderPrice"));
					
			
			
			
			
			
			
			
		
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e2) {
			e2.printStackTrace();
		} finally {
			DBUtil.close(rs);
			DBUtil.close(pstmt);
		}

		return dto;
		
		/*
		 SELECT o.orderDate, m.mName, m.mPhone, o.orderStatus, p.image, 
		p.productName, p.volume, d.pricePerProduct, d.orderCount, o.shippingFee, 
		de.address1, de.address2, o.orderRequire, o.orderPrice, o.totalPrice, o.shippingFee
		FROM orderDetail d, product p, orderPrice o, member m, delivery de
		WHERE d.productCode = p.productCode AND d.orderNum = o.orderNum AND o.mNum = m.mNum AND m.mnum = '69' AND m.mnum = de.mNum; 
		 
		 */
		
		
	}
	
}
