package com.admin.order;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.util.DBConn;
import com.util.DBUtil;

public class OrderDAO {
	private Connection conn = DBConn.getConnection();

	public int dataCount() {
		int result = 0;
		
		return result;
	}
	
	// 검색값 있을 때의 데이터 개수
	public int dataCount(String orderNumKwd, 
			String orderDateStart,
			String orderDateEnd,
			List<String> orderPriceList,
			List<String> totalPriceList,
			List<String> discountList,
			List<String> shippingFeeList,
			String orderStatus) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuilder sb = new StringBuilder();
		
		try {
			sb.append("SELECT COUNT(*) FROM order WHERE ");
			
			// 주문 코드 검색
			if( ! orderNumKwd.isEmpty() ) {
				sb.append(" ( ");
				sb.append(" INSTR(orderNum, ?) >= 1 ");
				sb.append(" ) AND ");
			}
			
			// 주문 날짜 검색
			if( (! orderDateStart.isEmpty()) || (! orderDateEnd.isEmpty()) ) {
				if(  sb.length() -  sb.lastIndexOf(" AND ") > 5 && sb.length() - sb.lastIndexOf(" WHERE ") >= 8) {
					sb.append(" AND ");
		        }
				
				sb.append("( orderDate >= TO_DATE(?, 'YYYY-MM-DD') AND orderDate <= TO_DATE(?, 'YYYY-MM-DD') )");
				
				if( sb.lastIndexOf("OR") == sb.length()-3 ) {
					sb.delete(sb.lastIndexOf("OR"), sb.length());
				}
				
				sb.append(" ) AND ");
			} else {
				if(  sb.length() -  sb.lastIndexOf(" AND ") <= 5 ) {
					sb.delete(sb.length()-4, sb.length());
		        }
			}
			
			
			if( !(orderPriceList.isEmpty()) ) {
				if(  sb.length() -  sb.lastIndexOf(" AND ") > 5 && sb.length() - sb.lastIndexOf(" WHERE ") >= 8) {
					sb.append(" AND ");
				}
				
				sb.append(" ( ");
				
				if( orderPriceList.contains("orderPrice1") ) {
					sb.append(" ( orderPrice <= 10000 ) OR ");
				}
				// 1이상 3미만
				if( orderPriceList.contains("orderPrice2") ) {
					sb.append(" ( orderPrice >= 10000 AND orderPrice < 30000 ) OR ");
				}
				// 3이상 5미만				
				if( orderPriceList.contains("orderPrice3") ) {
					sb.append(" ( orderPrice >= 30000 AND orderPrice < 50000 ) OR ");
				}
				// 5이상				
				if( orderPriceList.contains("orderPrice4") ) {
					sb.append(" ( orderPrice >= 50000 ) OR ");
				}
				//
				if( sb.lastIndexOf("OR") == sb.length()-3 ) {
					sb.delete(sb.lastIndexOf("OR"), sb.length());
				}
				sb.append(" ) AND ");
			} else {
				if(  sb.length() -  sb.lastIndexOf(" AND ") <= 5 ) {
					sb.delete(sb.length()-4, sb.length());
				}
			}
			
			
			if( !(totalPriceList.isEmpty()) ) {
				if(  sb.length() -  sb.lastIndexOf(" AND ") > 5 && sb.length() - sb.lastIndexOf(" WHERE ") >= 8) {
					sb.append(" AND ");
				}
				
				sb.append(" ( ");
				
				if( totalPriceList.contains("totalPrice1") ) {
					sb.append(" ( totalPrice <= 10000 ) OR ");
				}
				// 1이상 3미만
				if( totalPriceList.contains("totalPrice2") ) {
					sb.append(" ( totalPrice >= 10000 AND totalPrice < 30000 ) OR ");
				}
				// 3이상 5미만				
				if( totalPriceList.contains("totalPrice3") ) {
					sb.append(" ( totalPrice >= 30000 AND totalPrice < 50000 ) OR ");
				}
				// 5이상				
				if( totalPriceList.contains("totalPrice4") ) {
					sb.append(" ( totalPrice >= 50000 ) OR ");
				}
				//
				if( sb.lastIndexOf("OR") == sb.length()-3 ) {
					sb.delete(sb.lastIndexOf("OR"), sb.length());
				}
				sb.append(" ) AND ");
			} else {
				if(  sb.length() -  sb.lastIndexOf(" AND ") <= 5 ) {
					sb.delete(sb.length()-4, sb.length());
				}
			}
			
			if( ! discountList.isEmpty() ) {
				// p1 1만이하
				if(  sb.length() -  sb.lastIndexOf(" AND ") > 5 && sb.length() - sb.lastIndexOf(" WHERE ") >= 8) {
					sb.append(" AND ");
		        }
				sb.append(" ( ");
				
				if( discountList.contains("discount1") ) {
					sb.append(" ( discount <= 10000 ) OR ");
				}
				// 1이상 3미만
				if( discountList.contains("discount2") ) {
					sb.append(" ( discount >= 10000 AND discount < 30000 ) OR ");
				}
				// 3이상 5미만				
				if( discountList.contains("discount3") ) {
					sb.append(" ( discount >= 30000 AND discount < 50000 ) OR ");
				}		

				//
				if( sb.lastIndexOf("OR") == sb.length()-3 ) {
					sb.delete(sb.lastIndexOf("OR"), sb.length());
				}
				sb.append(" ) AND ");
				
			} else {
				if(  sb.length() -  sb.lastIndexOf(" AND ") <= 5 ) {
					sb.delete(sb.length()-4, sb.length());
		        }
			}
			
			if( ! (shippingFeeList.isEmpty()) ) {
				// p1 1만이하
				if(  sb.length() -  sb.lastIndexOf(" AND ") > 5 && sb.length() - sb.lastIndexOf(" WHERE ") >= 8) {
					sb.append(" AND ");
		        }
				sb.append(" ( ");
				
				if( shippingFeeList.contains("shippingFee1") ) {
					sb.append(" ( shippingFee = 0 ) OR ");
				}
				// 1이상 3미만
				if( shippingFeeList.contains("shippingFee2") ) {
					sb.append(" ( shippingFee >= 1 ) OR ");
				}

				if( sb.lastIndexOf("OR") == sb.length()-3 ) {
					sb.delete(sb.lastIndexOf("OR"), sb.length());
				}
				sb.append(" ) AND ");
				
			} else {
				if(  sb.length() -  sb.lastIndexOf(" AND ") <= 5 ) {
					sb.delete(sb.length()-4, sb.length());
		        }
			}
			
			if( ! orderStatus.isEmpty() ) {
				if(  sb.length() -  sb.lastIndexOf(" AND ") > 5 && sb.length() - sb.lastIndexOf(" WHERE ") >= 8) {
					sb.append(" AND ");
				}

				sb.append(" ( INSTR(orderStatus, ?) >= 1 ) ");
				
				if( sb.lastIndexOf("OR") == sb.length()-3 ) {
					sb.delete(sb.lastIndexOf("OR"), sb.length());
				}

				sb.append(" ) AND ");
			} else {
				if(  sb.length() -  sb.lastIndexOf(" AND ") <= 5 ) {
					sb.delete(sb.length()-4, sb.length());
				}
			}
			
			pstmt = conn.prepareStatement(sb.toString());
			
			// 주문번호가 있을 때
			if( ! orderNumKwd.isEmpty() ) {
				
				pstmt.setString(1, orderNumKwd);
			
				// 주문 날짜가 있을 때
				if( !(orderDateStart.isEmpty()) || !(orderDateEnd.isEmpty()) ) {                                                                                                                                                                                                                                                                                                                      
					// 시작 날짜만 있을 때
					if( !(orderDateStart.isEmpty()) && (orderDateEnd.isEmpty()) ) {
						pstmt.setString(2, orderDateStart);
						pstmt.setString(3, "9999-09-09");
						// 주문 상태 있을 때
						if( !(orderStatus.isEmpty()) ) {
							pstmt.setString(4, orderStatus);
						// 없을 때
						} 
						
					// 끝 날짜만 있을 때
					} else if (!(orderDateStart.isEmpty()) || !(orderDateEnd.isEmpty()) ) {
						pstmt.setString(2, "1111-11-11");
						pstmt.setString(3, orderDateEnd);
						// 주문 상태 있을 때
						if( !(orderStatus.isEmpty()) ) {
							pstmt.setString(4, orderStatus);
						// 없을 때
						} 
						
					// 둘다 있을 때
					} else if ( !(orderDateStart.isEmpty()) || !(orderDateEnd.isEmpty())) {
						pstmt.setString(2, orderDateStart);
						pstmt.setString(3, orderDateEnd);
						// 주문 상태 있을 때
						if( !(orderStatus.isEmpty()) ) {
							pstmt.setString(4, orderStatus);
						// 없을 때
						}
					}
						
				// 주문 날짜가 없을 때	
				} else {
					if( !(orderStatus.isEmpty()) ) {
						pstmt.setString(2, orderStatus);
					} 
				
				}
			// 주문 코드가 없을 때
			} else {
				
				if( !(orderDateStart.isEmpty()) || !(orderDateEnd.isEmpty()) ) {                                                                                                                                                                                                                                                                                                                      
					// 시작 날짜만 있을 때
					if( !(orderDateStart.isEmpty()) && (orderDateEnd.isEmpty()) ) {
						pstmt.setString(1, orderDateStart);
						pstmt.setString(2, "9999-09-09");
						// 주문 상태 있을 때
						if( !(orderStatus.isEmpty()) ) {
							pstmt.setString(3, orderStatus);
						// 없을 때
						} 
						
					// 끝 날짜만 있을 때
					} else if (!(orderDateStart.isEmpty()) || !(orderDateEnd.isEmpty()) ) {
						pstmt.setString(1, "1111-11-11");
						pstmt.setString(2, orderDateEnd);
						// 주문 상태 있을 때
						if( !(orderStatus.isEmpty()) ) {
							pstmt.setString(3, orderStatus);
						// 없을 때
						} 
						
					// 둘다 있을 때
					} else if ( !(orderDateStart.isEmpty()) || !(orderDateEnd.isEmpty())) {
						pstmt.setString(1, orderDateStart);
						pstmt.setString(2, orderDateEnd);
						// 주문 상태 있을 때
						if( !(orderStatus.isEmpty()) ) {
							pstmt.setString(3, orderStatus);
						// 없을 때
						}
					}
						
				// 주문 날짜가 없을 때	
				} else {
					if( !(orderStatus.isEmpty()) ) {
						pstmt.setString(1, orderStatus);
					} 
				
				}
			}
			
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
	
	public List<OrderDTO> listOrder(int offset,int size) {
		List<OrderDTO> list = new ArrayList<OrderDTO>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuilder sb = new StringBuilder();
		
		try {
			sb.append(" SELECT orderNum, orderDate, totalPrice, discount, ");
			sb.append(" shippingFee, orderStatus ");
			sb.append(" FROM order ");
			sb.append(" ORDER BY orderNum DESC ");
			sb.append(" OFFSET ? ROWS FETCH FIRST ? ROWS ONLY ");

			pstmt = conn.prepareStatement(sb.toString());
			
			pstmt.setInt(1, offset);
			pstmt.setInt(2, size);
			
			rs = pstmt.executeQuery();
			
			while( rs.next() ) {
				OrderDTO dto = new OrderDTO();
				dto.setOrderNum(Long.parseLong((rs.getString("orderNum"))));
				dto.setDeliveryNum(Long.parseLong((rs.getString("deliveryNum"))));
				dto.setOrderDate(rs.getString("orderDate"));
				dto.setOrderPrice(Long.parseLong((rs.getString("orderPrice"))));
				dto.setTotalPrice(Long.parseLong((rs.getString("totalPrice"))));
				dto.setOrderRequire(rs.getString("orderRequire"));
				dto.setDiscount(Long.parseLong((rs.getString("discount"))));
				dto.setShippingFee(Long.parseLong((rs.getString("shippingFee"))));
				dto.setOrderStatus(rs.getString("orderStatus"));
				dto.setmNum(Long.parseLong((rs.getString("mNum"))));
				
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
	
	// 검색값 있을 때의 order들
	public List<OrderDTO> listOrder(int offset,int size, 
			String orderNumKwd, 
			String orderDateStart,
			String orderDateEnd,
			List<String> orderPriceList,
			List<String> totalPriceList,
			List<String> discountList,
			List<String> shippingFeeList,
			String orderStatus) {
		List<OrderDTO> list = new ArrayList<OrderDTO>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuilder sb = new StringBuilder();
		
		try {
			sb.append(" SELECT orderNum, orderDate, totalPrice, discount, ");
			sb.append(" shippingFee, orderStatus ");
			sb.append(" FROM order ");
			sb.append(" ORDER BY orderNum DESC ");
			sb.append(" OFFSET ? ROWS FETCH FIRST ? ROWS ONLY ");
			
			// 주문 코드 검색
						if( ! orderNumKwd.isEmpty() ) {
							sb.append(" ( ");
							sb.append(" INSTR(orderNum, ?) >= 1 ");
							sb.append(" ) AND ");
						}
						
						// 주문 날짜 검색
						if( (! orderDateStart.isEmpty()) || (! orderDateEnd.isEmpty()) ) {
							if(  sb.length() -  sb.lastIndexOf(" AND ") > 5 && sb.length() - sb.lastIndexOf(" WHERE ") >= 8) {
								sb.append(" AND ");
					        }
							
							sb.append("( orderDate >= TO_DATE(?, 'YYYY-MM-DD') AND orderDate <= TO_DATE(?, 'YYYY-MM-DD') )");
							
							if( sb.lastIndexOf("OR") == sb.length()-3 ) {
								sb.delete(sb.lastIndexOf("OR"), sb.length());
							}
							
							sb.append(" ) AND ");
						} else {
							if(  sb.length() -  sb.lastIndexOf(" AND ") <= 5 ) {
								sb.delete(sb.length()-4, sb.length());
					        }
						}
						
						
						if( !(orderPriceList.isEmpty()) ) {
							if(  sb.length() -  sb.lastIndexOf(" AND ") > 5 && sb.length() - sb.lastIndexOf(" WHERE ") >= 8) {
								sb.append(" AND ");
							}
							
							sb.append(" ( ");
							
							if( orderPriceList.contains("orderPrice1") ) {
								sb.append(" ( orderPrice <= 10000 ) OR ");
							}
							// 1이상 3미만
							if( orderPriceList.contains("orderPrice2") ) {
								sb.append(" ( orderPrice >= 10000 AND orderPrice < 30000 ) OR ");
							}
							// 3이상 5미만				
							if( orderPriceList.contains("orderPrice3") ) {
								sb.append(" ( orderPrice >= 30000 AND orderPrice < 50000 ) OR ");
							}
							// 5이상				
							if( orderPriceList.contains("orderPrice4") ) {
								sb.append(" ( orderPrice >= 50000 ) OR ");
							}
							//
							if( sb.lastIndexOf("OR") == sb.length()-3 ) {
								sb.delete(sb.lastIndexOf("OR"), sb.length());
							}
							sb.append(" ) AND ");
						} else {
							if(  sb.length() -  sb.lastIndexOf(" AND ") <= 5 ) {
								sb.delete(sb.length()-4, sb.length());
							}
						}
						
						
						if( !(totalPriceList.isEmpty()) ) {
							if(  sb.length() -  sb.lastIndexOf(" AND ") > 5 && sb.length() - sb.lastIndexOf(" WHERE ") >= 8) {
								sb.append(" AND ");
							}
							
							sb.append(" ( ");
							
							if( totalPriceList.contains("totalPrice1") ) {
								sb.append(" ( totalPrice <= 10000 ) OR ");
							}
							// 1이상 3미만
							if( totalPriceList.contains("totalPrice2") ) {
								sb.append(" ( totalPrice >= 10000 AND totalPrice < 30000 ) OR ");
							}
							// 3이상 5미만				
							if( totalPriceList.contains("totalPrice3") ) {
								sb.append(" ( totalPrice >= 30000 AND totalPrice < 50000 ) OR ");
							}
							// 5이상				
							if( totalPriceList.contains("totalPrice4") ) {
								sb.append(" ( totalPrice >= 50000 ) OR ");
							}
							//
							if( sb.lastIndexOf("OR") == sb.length()-3 ) {
								sb.delete(sb.lastIndexOf("OR"), sb.length());
							}
							sb.append(" ) AND ");
						} else {
							if(  sb.length() -  sb.lastIndexOf(" AND ") <= 5 ) {
								sb.delete(sb.length()-4, sb.length());
							}
						}
						
						if( ! discountList.isEmpty() ) {
							// p1 1만이하
							if(  sb.length() -  sb.lastIndexOf(" AND ") > 5 && sb.length() - sb.lastIndexOf(" WHERE ") >= 8) {
								sb.append(" AND ");
					        }
							sb.append(" ( ");
							
							if( discountList.contains("discount1") ) {
								sb.append(" ( discount <= 10000 ) OR ");
							}
							// 1이상 3미만
							if( discountList.contains("discount2") ) {
								sb.append(" ( discount >= 10000 AND discount < 30000 ) OR ");
							}
							// 3이상 5미만				
							if( discountList.contains("discount3") ) {
								sb.append(" ( discount >= 30000 AND discount < 50000 ) OR ");
							}		

							//
							if( sb.lastIndexOf("OR") == sb.length()-3 ) {
								sb.delete(sb.lastIndexOf("OR"), sb.length());
							}
							sb.append(" ) AND ");
							
						} else {
							if(  sb.length() -  sb.lastIndexOf(" AND ") <= 5 ) {
								sb.delete(sb.length()-4, sb.length());
					        }
						}
						
						if( ! (shippingFeeList.isEmpty()) ) {
							// p1 1만이하
							if(  sb.length() -  sb.lastIndexOf(" AND ") > 5 && sb.length() - sb.lastIndexOf(" WHERE ") >= 8) {
								sb.append(" AND ");
					        }
							sb.append(" ( ");
							
							if( shippingFeeList.contains("shippingFee1") ) {
								sb.append(" ( shippingFee = 0 ) OR ");
							}
							// 1이상 3미만
							if( shippingFeeList.contains("shippingFee2") ) {
								sb.append(" ( shippingFee >= 1 ) OR ");
							}

							if( sb.lastIndexOf("OR") == sb.length()-3 ) {
								sb.delete(sb.lastIndexOf("OR"), sb.length());
							}
							sb.append(" ) AND ");
							
						} else {
							if(  sb.length() -  sb.lastIndexOf(" AND ") <= 5 ) {
								sb.delete(sb.length()-4, sb.length());
					        }
						}
						
						if( ! orderStatus.isEmpty() ) {
							if(  sb.length() -  sb.lastIndexOf(" AND ") > 5 && sb.length() - sb.lastIndexOf(" WHERE ") >= 8) {
								sb.append(" AND ");
							}

							sb.append(" ( INSTR(orderStatus, ?) >= 1 ) ");
							
							if( sb.lastIndexOf("OR") == sb.length()-3 ) {
								sb.delete(sb.lastIndexOf("OR"), sb.length());
							}

							sb.append(" ) AND ");
						} else {
							if(  sb.length() -  sb.lastIndexOf(" AND ") <= 5 ) {
								sb.delete(sb.length()-4, sb.length());
							}
						}
						
						
						sb.append(" ORDER BY productCode DESC ");
						sb.append(" OFFSET ? ROWS FETCH FIRST ? ROWS ONLY ");
						
						pstmt = conn.prepareStatement(sb.toString());
						
						// 주문번호가 있을 때
						if( ! orderNumKwd.isEmpty() ) {
							
							pstmt.setString(1, orderNumKwd);
						
							// 주문 날짜가 있을 때
							if( !(orderDateStart.isEmpty()) || !(orderDateEnd.isEmpty()) ) {                                                                                                                                                                                                                                                                                                                      
								// 시작 날짜만 있을 때
								if( !(orderDateStart.isEmpty()) && (orderDateEnd.isEmpty()) ) {
									pstmt.setString(2, orderDateStart);
									pstmt.setString(3, "9999-09-09");

									// 주문 상태 있을 때
									if( !(orderStatus.isEmpty()) ) {
										pstmt.setString(4, orderStatus);
										pstmt.setInt(5, offset);
										pstmt.setInt(6, size);
									// 없을 때
									} 
									
								// 끝 날짜만 있을 때
								} else if (!(orderDateStart.isEmpty()) || !(orderDateEnd.isEmpty()) ) {
									pstmt.setString(2, "1111-11-11");
									pstmt.setString(3, orderDateEnd);
									// 주문 상태 있을 때
									if( !(orderStatus.isEmpty()) ) {
										pstmt.setString(4, orderStatus);
										pstmt.setInt(5, offset);
										pstmt.setInt(6, size);
									// 없을 때
									} 
									
								// 둘다 있을 때
								} else if ( !(orderDateStart.isEmpty()) || !(orderDateEnd.isEmpty())) {
									pstmt.setString(2, orderDateStart);
									pstmt.setString(3, orderDateEnd);
									// 주문 상태 있을 때
									if( !(orderStatus.isEmpty()) ) {
										pstmt.setString(4, orderStatus);
									// 없을 때
									}
								}
									
							// 주문 날짜가 없을 때	
							} else {
								if( !(orderStatus.isEmpty()) ) {
									pstmt.setString(2, orderStatus);
								} 
							
							}
						// 주문 코드가 없을 때
						} else {
							
							if( !(orderDateStart.isEmpty()) || !(orderDateEnd.isEmpty()) ) {                                                                                                                                                                                                                                                                                                                      
								// 시작 날짜만 있을 때
								if( !(orderDateStart.isEmpty()) && (orderDateEnd.isEmpty()) ) {
									pstmt.setString(1, orderDateStart);
									pstmt.setString(2, "9999-09-09");
									// 주문 상태 있을 때
									if( !(orderStatus.isEmpty()) ) {
										pstmt.setString(3, orderStatus);
									// 없을 때
									} 
									
								// 끝 날짜만 있을 때
								} else if (!(orderDateStart.isEmpty()) || !(orderDateEnd.isEmpty()) ) {
									pstmt.setString(1, "1111-11-11");
									pstmt.setString(2, orderDateEnd);
									// 주문 상태 있을 때
									if( !(orderStatus.isEmpty()) ) {
										pstmt.setString(3, orderStatus);
									// 없을 때
									} 
									
								// 둘다 있을 때
								} else if ( !(orderDateStart.isEmpty()) || !(orderDateEnd.isEmpty())) {
									pstmt.setString(1, orderDateStart);
									pstmt.setString(2, orderDateEnd);
									// 주문 상태 있을 때
									if( !(orderStatus.isEmpty()) ) {
										pstmt.setString(3, orderStatus);
									// 없을 때
									}
								}
									
							// 주문 날짜가 없을 때	
							} else {
								if( !(orderStatus.isEmpty()) ) {
									pstmt.setString(1, orderStatus);
								} 
							
							}
						}
			
			
		} catch (Exception e) {
			// TODO: handle exception
		}


		return list;
	}
	
	
}
