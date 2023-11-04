package com.orderList;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import com.member.MemberDTO;
import com.util.DBConn;
import com.util.DBUtil;

public class OrderListDAO {
	private Connection conn = DBConn.getConnection();
	
	// 데이터 개수
	public int dataCount() {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuilder sb = new StringBuilder();
		
		try {
			sb.append(" SELECT Count(*) ");
			sb.append(" FROM orderDetail d, ");
			sb.append(" product p, ");
			sb.append(" orderPrice o, ");
			sb.append(" member m ");
			sb.append(" WHERE d.productCode = p.productCode ");
			sb.append(" AND d.orderNum = o.orderNum ");
			sb.append(" AND o.mNum = ? ");
			
			pstmt = conn.prepareStatement(sb.toString());
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
	public List<OrderListDTO> listOrder(MemberDTO memberDTO) {
		List<OrderListDTO> list = null;
		PreparedStatement pstmt = null;
		StringBuilder sb = new StringBuilder();
		ResultSet rs = null;
		int memberNum = memberDTO.getMnum();
		OrderListDTO dto = null;
		
		try {

			sb.append(" SELECT o.orderDate, m.mName, m.mPhone, o.orderStatus, ");
			sb.append(" p.image, p.productName, ");
			sb.append(" p.volume, d.pricePerProduct, d.orderCount, o.shippingFee ");
			sb.append(" FROM orderDetail d, ");
			sb.append(" product p, ");
			sb.append(" orderPrice o, ");
			sb.append(" member m ");
			sb.append(" WHERE d.productCode = p.productCode ");
			sb.append(" AND d.orderNum = o.orderNum ");
			sb.append(" AND o.mNum = ? ");
			
			pstmt = conn.prepareStatement(sb.toString());
			
			pstmt.setInt(1, memberNum);
			
			rs = pstmt.executeQuery();
			
			if( rs.next() ) {
				dto = new OrderListDTO();
				
				dto.setOrderDate(rs.getString("orderDate"));
				dto.setMemberName(rs.getString("mName"));
				dto.setMemberPhone(rs.getString("mPhone"));
				dto.setOrderStatus(rs.getString("orderStatus"));
				dto.setProductImage(rs.getString("image"));
				dto.setProductName(rs.getString("productName"));
				dto.setProductVolume(rs.getString("volume"));
				dto.setProductPrice(rs.getString("pricePerProduct"));
				dto.setOrderCount(rs.getString("orderCount"));
				dto.setShippingFee(rs.getString("shippingFee"));
				
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
