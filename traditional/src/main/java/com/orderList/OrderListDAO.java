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
			
			System.out.println(result + "result");
			
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
			System.out.println(mNum);
			sb.append(" SELECT o.orderDate, m.mName, m.mPhone, o.orderStatus, p.image,  ");
			sb.append(" p.productName, p.volume, d.pricePerProduct, d.orderCount, o.shippingFee ");
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
				System.out.println(sqlDate);
				dto.setOrderDate(sqlDate);
			} catch (Exception e) {
				e.printStackTrace();
				dto.setOrderDate(rs.getString("orderDate"));
			}				
				dto.setMemberName(rs.getString("mName"));
				
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
	
}
