package com.admin.product;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.util.DBConn;
import com.util.DBUtil;

public class ProductDAO {
	private Connection conn = DBConn.getConnection();
	
	// 상품 등록
	public void insertProduct(ProductDTO dto) throws SQLException {
		PreparedStatement pstmt = null;
		StringBuilder sb = new StringBuilder();
		
		
		try {
			sb.append("INSERT INTO product(productCode, productName, productPrice, "); 
			sb.append(" productSubject, expirationDate, productStorage, productCategory, ");
			sb.append(" hashTag, alcoholPercent, productTaste, productPerson, inventory, ");
			sb.append(" image, extinctOrNot, price, volume, breweryPage) ");
			sb.append("  VALUES (product_seq.NEXTVAL, ?, ?, ");
			sb.append(" ?, ?, ?, ?, ");
			sb.append(" ?, ?, ?, ?, ?, ");
			sb.append(" ?, ?, ?, ?, ?)");
			
			pstmt = conn.prepareStatement(sb.toString());

			
			pstmt.setString(1, dto.getProductName());
			pstmt.setInt(2, dto.getProductPrice());
			
			pstmt.setString(3, dto.getProductSubject());
			pstmt.setString(4, dto.getExpirationDate());
			pstmt.setString(5, dto.getProductStorage());
			pstmt.setString(6, dto.getProductCategory());
			
			pstmt.setString(7, dto.getHashTag());
			
			if(dto.getAlcoholPercent() != null) {
			pstmt.setDouble(8, dto.getAlcoholPercent());
			}
			
			pstmt.setString(9, dto.getProductTaste());
			pstmt.setString(10, dto.getProductPerson());
			pstmt.setInt(11, dto.getInventory());
			
			pstmt.setString(12, dto.getImage());
			pstmt.setInt(13, dto.getExtinctOrNot());
			pstmt.setInt(14, dto.getPrice());
			pstmt.setInt(15, dto.getVolume());
			pstmt.setString(16, dto.getBreweryPage());
			
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
			sql = "SELECT COUNT(*) FROM product";
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			if( rs.next() ) {
				result = rs.getInt(1);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(rs);
			DBUtil.close(pstmt);
		}
		
		return result;
	}
	
	// 검색에서 데이터 개수 구하기
	// List<String>
	public int dataCount(String productNameKwd, List<String> productPriceKwd, 
			List<String> volumeKwd, String expirationDateStart,String expirationDateEnd, 
			List<String> productCategoryKwd, List<String> alcoholPercentKwd, 
			List<String> productTasteKwd /*, String[] productPerson */ ) {
		int result  = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuilder sb = new StringBuilder();
		
		try {
			sb.append("SELECT COUNT(*) FROM product WHERE ");

			// 제품 이름 검색
			if( ! productNameKwd.isEmpty() ) {
				
				sb.append(" ( ");
				sb.append(" INSTR(productName, ?) >= 1 ");
				sb.append(" ) AND ");
			}
			
			// 제품 가격 검색
			if( ! productPriceKwd.isEmpty() ) {
				// p1 1만이하
				if(  sb.length() -  sb.lastIndexOf(" AND ") > 5 && sb.length() - sb.lastIndexOf(" WHERE ") >= 8) {
					sb.append(" AND ");
		        }
				sb.append(" ( ");
				
				if( productPriceKwd.contains("p1") ) {
					sb.append(" ( productPrice <= 10000 ) OR ");
				}
				// p2 1이상 3미만
				if( productPriceKwd.contains("p2") ) {
					sb.append(" ( productPrice >= 10000 AND productPrice < 30000 ) OR ");
				}
				// p3 3이상 5미만				
				if( productPriceKwd.contains("p3") ) {
					sb.append(" ( productPrice >= 30000 AND productPrice < 50000 ) OR ");
				}
				// p4 5이상				
				if( productPriceKwd.contains("p4") ) {
					sb.append(" ( productPrice >= 50000 ) OR ");
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
			
			// List<String> volumeKwd, 
			// 용량 검색
			if(! volumeKwd.isEmpty()) {
				if(  sb.length() -  sb.lastIndexOf(" AND ") > 5 && sb.length() - sb.lastIndexOf(" WHERE ") >=8 ) {
					sb.append(" AND ");
				}
				sb.append(" ( ");
				if( volumeKwd.contains("b1") ) {
					// b1 200ml 미만 
					sb.append(" ( volume < 200 ) OR ");
				}
				if( volumeKwd.contains("b2") ) {
					// b2 200ml ~ 500ml
					sb.append(" ( volume >= 200 AND volume < 500 ) OR ");
				}
				if( volumeKwd.contains("b3") ) {
					// b3 500ml
					sb.append(" ( volume > 500 ) OR ");
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
			
			// String expirationDateStart,
			// String expirationDateEnd, 
			// 유통기한 검색
			if( !(expirationDateStart.isEmpty()) || !(expirationDateEnd.isEmpty()) ) {
				if(  sb.length() -  sb.lastIndexOf(" AND ") > 5 && sb.length() - sb.lastIndexOf(" WHERE ") >=8 ) {
					sb.append(" AND ");
		        }
				sb.append(" ( ");
					sb.append(" expirationDate >= TO_DATE(?,'YYYY-MM-DD') AND expirationDate <= TO_DATE(?,'YYYY-MM-DD') ");
					
				
				sb.append(" ) AND ");
			} else {
				if(  sb.length() -  sb.lastIndexOf(" AND ") <= 5 ) {
					sb.delete(sb.length()-4, sb.length());
		        }
			}
			
			// List<String> productCategoryKwd,
			// 제품 카테고리
			if(! productCategoryKwd.isEmpty() ) {
				if(  sb.length() -  sb.lastIndexOf(" AND ") > 5 && sb.length() - sb.lastIndexOf(" WHERE ") >=8 ) {
					sb.append(" AND ");
		        }
				sb.append(" ( ");
			
				// 탁주
				if( productCategoryKwd.contains("탁주") ) {
					sb.append(" ( INSTR(productCategory, '탁주') >= 1 ) OR ");
				}
				// 약, 청주
				if( productCategoryKwd.contains("약,청주") ) {
					sb.append(" ( INSTR(productCategory, '약주') >= 1 ) OR ");
					sb.append(" ( INSTR(productCategory, '청주') >= 1 ) OR ");
				}
				// 과실주				
				if( productCategoryKwd.contains("과실주") ) {
					sb.append(" ( INSTR(productCategory, '과실주') >= 1 ) OR ");
				}
				// 증류주				
				if( productCategoryKwd.contains("증류주") ) {
					sb.append(" ( INSTR(productCategory, '증류주') >= 1 ) OR ");
				}
				// 기타주류
				if( productCategoryKwd.contains("기타주류") ) {
					sb.append(" ( INSTR(productCategory, '기타주류') >= 1 ) OR ");
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
			
			// List<String> alcoholPercentKwd,
			// 도수 검색
			if(! alcoholPercentKwd.isEmpty()) {
				if(  sb.length() -  sb.lastIndexOf(" AND ") > 5 && sb.length() - sb.lastIndexOf(" WHERE ") >=8 ) {
					sb.append(" AND ");
		        }
				sb.append(" ( ");
				// 10도 미만
				if( alcoholPercentKwd.contains("alcohol1") ) {
					sb.append(" ( alcoholPercent < 10.00 ) OR ");
				}
				if( alcoholPercentKwd.contains("alcohol2") ) {
					sb.append(" ( alcoholPercent >= 10.00 AND alcoholPercent < 30.00 ) OR ");
				}
				if( alcoholPercentKwd.contains("alcohol3") ) {
					sb.append(" ( alcoholPercent >= 30.00 ) OR ");
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
			// List<String> productTasteKwd
			// 맛 검색
			if(! productTasteKwd.isEmpty()) {
				if(  sb.length() -  sb.lastIndexOf(" AND ") > 5 && sb.length() - sb.lastIndexOf(" WHERE ") >=8 ) {
					sb.append(" AND ");
		        }
				sb.append(" ( ");
				if( productTasteKwd.contains("단맛") ) {
					sb.append(" ( INSTR(productTaste, '단맛') >= 1 ) OR ");
				}
				if( productTasteKwd.contains("신맛") ) {
					sb.append(" ( INSTR(productTaste, '신맛') >= 1 ) OR ");
				}
				if( productTasteKwd.contains("쓴맛") ) {
					sb.append(" ( INSTR(productTaste, '쓴맛') >= 1 ) OR ");
				}
				if( productTasteKwd.contains("탄산") ) {
					sb.append(" ( INSTR(productTaste, '탄산') >= 1 ) OR ");
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
			
			if(  sb.length() -  sb.lastIndexOf(" AND ") <= 5 ) {
				sb.delete(sb.length()-4, sb.length());
	        }
			
			pstmt = conn.prepareStatement(sb.toString());
			// ? ? ?

			// 이름이 있고, 날짜가 없을 때,
			// 이름이 없고, 날짜가 있을 때,
			// 이름이 없고, 날짜도 없을 때,
			// 이름이 있을 때
			if(! (productNameKwd.isEmpty())) {
				pstmt.setString(1, productNameKwd);
				
				// 날짜가 있을 때
				if( !(expirationDateStart.isEmpty()) || !(expirationDateEnd.isEmpty())) {
					if( !(expirationDateStart.isEmpty()) && expirationDateEnd.isEmpty() ) {
						// 최소일자만 있을 때
						pstmt.setString(2, expirationDateStart);
						pstmt.setString(3, "9999-09-09");
				
					} else if ( expirationDateStart.isEmpty() && !(expirationDateEnd.isEmpty()) ) {
						// 최대일자만 있을 때
						pstmt.setString(2, "1111-11-11");
						pstmt.setString(3, expirationDateEnd);
					
					} else if (!(expirationDateStart.isEmpty()) && !(expirationDateEnd.isEmpty()) ) {
						// 모두 있을 때
						pstmt.setString(2, expirationDateStart);
						pstmt.setString(3, expirationDateEnd);
					}
					// 날짜가 없을 때
				} else { }

				// 이름이 없을 때
			} else {

				if( !(expirationDateStart.isEmpty()) || !(expirationDateEnd.isEmpty())) {
					if( !(expirationDateStart.isEmpty()) && expirationDateEnd.isEmpty() ) {
						// 최소일자만 있을 때
						pstmt.setString(1, expirationDateStart);
						pstmt.setString(2, "9999-09-09");


					} else if ( expirationDateStart.isEmpty() && !(expirationDateEnd.isEmpty()) ) {
						// 최대일자만 있을 때
						pstmt.setString(1, "1111-11-11");
						pstmt.setString(2, expirationDateEnd);


					} else if (!(expirationDateStart.isEmpty()) && !(expirationDateEnd.isEmpty()) ) {
						// 모두 있을 때
						pstmt.setString(1, expirationDateStart);
						pstmt.setString(2, expirationDateEnd);


					}
				}
			}

			//유통기한
			
			
			rs = pstmt.executeQuery();
			if( rs.next() ) {
				result = rs.getInt(1);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e1) {
			e1.printStackTrace();
		} finally {
			DBUtil.close(rs);
			DBUtil.close(pstmt);
		}
		
		return result;
	}
	
	
	
	
	
	// 게시물 리스트
	public List<ProductDTO> listProduct(int offset, int size) {
		List<ProductDTO> list = new ArrayList<ProductDTO>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuilder sb = new StringBuilder();
		
		try {
			sb.append("SELECT productCode, productName, productPrice, "); 
			sb.append(" productSubject, TO_CHAR(expirationDate,'YYYY-MM-DD') expirationDate, productStorage, productCategory, ");
			sb.append(" hashTag, alcoholPercent, productTaste, productPerson, inventory, ");
			sb.append(" image, extinctOrNot, price, volume, breweryPage ");
			sb.append(" FROM product ");
			sb.append(" ORDER BY productCode DESC ");
			sb.append(" OFFSET ? ROWS FETCH FIRST ? ROWS ONLY ");
			
			pstmt = conn.prepareStatement(sb.toString());
			
			pstmt.setInt(1, offset);
			pstmt.setInt(2, size);
			
			rs = pstmt.executeQuery();
			
			while( rs.next() ) {
				ProductDTO dto = new ProductDTO();
				dto.setProductCode(rs.getString("productCode"));
				dto.setProductName(rs.getString("productName"));
				dto.setProductPrice(rs.getInt("productPrice"));
				dto.setProductSubject(rs.getString("productSubject"));
				dto.setExpirationDate(rs.getString("expirationDate"));
				dto.setProductStorage(rs.getString("productStorage"));
				dto.setProductCategory(rs.getString("productCategory"));
				dto.setHashTag(rs.getString("hashTag"));
				dto.setAlcoholPercent(rs.getDouble("alcoholPercent"));
				dto.setProductTaste(rs.getString("productTaste"));
				dto.setProductPerson(rs.getString("productPerson"));
				dto.setInventory(rs.getInt("inventory"));
				dto.setImage(rs.getString("image"));
				dto.setExtinctOrNot(rs.getInt("extinctOrNot"));
				dto.setPrice(rs.getInt("price"));
				dto.setVolume(rs.getInt("volume"));
				dto.setBreweryPage(rs.getString("breweryPage"));
				
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
	
	// 검색에서 상품 리스트
	public List<ProductDTO> listProduct(int offset, int size, String productNameKwd, List<String> productPriceKwd, 
			List<String> volumeKwd, String expirationDateStart,String expirationDateEnd, 
			List<String> productCategoryKwd, List<String> alcoholPercentKwd, 
			List<String> productTasteKwd) {
		List<ProductDTO> list = new ArrayList<ProductDTO>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuilder sb = new StringBuilder();
		
		try {
			sb.append("SELECT productCode, productName, productPrice, "); 
			sb.append(" productSubject, expirationDate, productStorage, productCategory, ");
			sb.append(" hashTag, alcoholPercent, productTaste, productPerson, inventory, ");
			sb.append(" image, extinctOrNot, price, volume, breweryPage ");
			sb.append(" FROM product WHERE ");
			
			// 제품 이름 검색
			if(! productNameKwd.isEmpty() ) {

				sb.append(" ( INSTR(productName, ?) >= 1 ) AND ");
			}
				
			

			// 제품 가격 검색
			if(! productPriceKwd.isEmpty() ) {
				if(  sb.length() -  sb.lastIndexOf(" AND ") > 5 && sb.length() - sb.lastIndexOf(" WHERE ") >=8 ) {
					sb.append(" AND ");
		        }
				sb.append(" ( ");
				// p1 1만이하
				if( productPriceKwd.contains("p1") ) {
					sb.append(" ( productPrice <= 10000 ) OR ");
				}
				// p2 1이상 3미만
				if( productPriceKwd.contains("p2") ) {
					sb.append(" ( productPrice >= 10000 AND productPrice < 30000 ) OR ");
				}
				// p3 3이상 5미만				
				if( productPriceKwd.contains("p3") ) {
					sb.append(" ( productPrice >= 30000 AND productPrice < 50000 ) OR ");
				}
				// p4 5이상				
				if( productPriceKwd.contains("p4") ) {
					sb.append(" ( productPrice >= 50000 ) OR ");
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

			
			// List<String> volumeKwd, 
			// 용량 검색
			if(! volumeKwd.isEmpty()) {
				if(  sb.length() -  sb.lastIndexOf(" AND ") > 5 && sb.length() - sb.lastIndexOf(" WHERE ") >=8 ) {
					sb.append(" AND ");
		        }
				sb.append(" ( ");
				if( volumeKwd.contains("b1") ) {
					// b1 200ml 미만 
					sb.append(" ( volume < 200 ) OR ");
				}
				if( volumeKwd.contains("b2") ) {
					// b2 200ml ~ 500ml
					sb.append(" ( volume >= 200 AND volume < 500 ) OR ");
				}
				if( volumeKwd.contains("b3") ) {
					// b3 500ml
					sb.append(" ( volume > 500 ) OR ");
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
			// String expirationDateStart,
			// String expirationDateEnd, 
			// 유통기한 검색
			if( !(expirationDateStart.isEmpty()) || !(expirationDateEnd.isEmpty()) ) {
				if(  sb.length() -  sb.lastIndexOf(" AND ") > 5 && sb.length() - sb.lastIndexOf(" WHERE ") >=8 ) {
					sb.append(" AND ");
		        }
				sb.append(" ( ");

					sb.append(" expirationDate >= TO_DATE(?,'YYYY-MM-DD') AND expirationDate <= TO_DATE(?,'YYYY-MM-DD') ");
					
				
				sb.append(" ) AND ");
			} else {
				if(  sb.length() -  sb.lastIndexOf(" AND ") <= 5 ) {
					sb.delete(sb.length()-4, sb.length());
		        }
			}
			
			// List<String> productCategoryKwd,
			// 제품 카테고리
			if(! productCategoryKwd.isEmpty() ) {
				if(  sb.length() -  sb.lastIndexOf(" AND ") > 5 && sb.length() - sb.lastIndexOf(" WHERE ") >=8 ) {
					sb.append(" AND ");
		        }
				// 탁주
				sb.append(" ( ");
				if( productCategoryKwd.contains("탁주") ) {
					sb.append(" ( INSTR(productCategory, '탁주') >= 1 ) OR ");
				}
				// 약, 청주
				if( productCategoryKwd.contains("약,청주") ) {
					sb.append(" ( INSTR(productCategory, '약주') >= 1 ) OR ");
					sb.append(" ( INSTR(productCategory, '청주') >= 1 ) OR ");
				}
				// 과실주				
				if( productCategoryKwd.contains("과실주") ) {
					sb.append(" ( INSTR(productCategory, '과실주') >= 1 ) OR ");
				}
				// 증류주				
				if( productCategoryKwd.contains("증류주") ) {
					sb.append(" ( INSTR(productCategory, '증류주') >= 1 ) OR ");
				}
				// 기타주류
				if( productCategoryKwd.contains("기타주류") ) {
					sb.append(" ( INSTR(productCategory, '기타주류') >= 1 ) OR ");
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
			
			
			// List<String> alcoholPercentKwd,
			// 도수 검색
			if(! alcoholPercentKwd.isEmpty() ) {
				if(  sb.length() -  sb.lastIndexOf(" AND ") > 5 && sb.length() - sb.lastIndexOf(" WHERE ") >=8 ) {
					sb.append(" AND ");
		        }
				sb.append(" ( ");
				// 10도 미만
				if( alcoholPercentKwd.contains("alcohol1") ) {
					sb.append(" ( alcoholPercent < 10.00 ) OR ");
				}
				if( alcoholPercentKwd.contains("alcohol2") ) {
					sb.append(" ( alcoholPercent >= 10.00 AND alcoholPercent < 30.00 ) OR ");
				}
				if( alcoholPercentKwd.contains("alcohol3") ) {
					sb.append(" ( alcoholPercent >= 30.00 ) OR ");
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
			
			// List<String> productTasteKwd
			// 맛 검색
			
			if(! productTasteKwd.isEmpty()) {
				if(  sb.length() -  sb.lastIndexOf(" AND ") > 5 && sb.length() - sb.lastIndexOf(" WHERE ") >=8 ) {
					sb.append(" AND ");
		        }
				sb.append(" ( ");
				if( productTasteKwd.contains("단맛") ) {
					sb.append(" ( INSTR(productTaste, '단맛') >= 1 ) OR ");
				}
				if( productTasteKwd.contains("신맛") ) {
					sb.append(" ( INSTR(productTaste, '신맛') >= 1 ) OR ");
				}
				if( productTasteKwd.contains("쓴맛") ) {
					sb.append(" ( INSTR(productTaste, '쓴맛') >= 1 ) OR ");
				}
				if( productTasteKwd.contains("탄산") ) {
					sb.append(" ( INSTR(productTaste, '탄산') >= 1 ) OR ");
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
			
			if(  sb.length() -  sb.lastIndexOf(" AND ") <= 5 ) {
				sb.delete(sb.length()-4, sb.length());
	        }
			
			
			sb.append(" ORDER BY productCode DESC ");
			sb.append(" OFFSET ? ROWS FETCH FIRST ? ROWS ONLY ");
			
			
			// AND삭제 연산
			
			
			pstmt = conn.prepareStatement(sb.toString());			
			
			// 이름이 있을 때
			if(! productNameKwd.isEmpty() ) {
				pstmt.setString(1, productNameKwd);
				// 날짜가 있을 때
				if( !(expirationDateStart.isEmpty()) || !(expirationDateEnd.isEmpty())) {
					if( !(expirationDateStart.isEmpty()) && expirationDateEnd.isEmpty() ) {
						// 최소일자만 있을 때
						pstmt.setString(2, expirationDateStart);
						pstmt.setString(3, "9999-09-09");
						pstmt.setInt(4, offset);
						pstmt.setInt(5, size);
					} else if ( expirationDateStart.isEmpty() && !(expirationDateEnd.isEmpty()) ) {
						// 최대일자만 있을 때
						pstmt.setString(2, "1111-11-11");
						pstmt.setString(3, expirationDateEnd);					
						pstmt.setInt(4, offset);
						pstmt.setInt(5, size);
					} else if (!(expirationDateStart.isEmpty()) && !(expirationDateEnd.isEmpty()) ) {
						// 모두 있을 때
						pstmt.setString(2, expirationDateStart);
						pstmt.setString(3, expirationDateEnd);
						pstmt.setInt(4, offset);
						pstmt.setInt(5, size);
					}
					// 날짜가 없을 때
				} else {					
					pstmt.setInt(2, offset);
					pstmt.setInt(3, size); 
				}

				// 이름이 없을 때
			} else {
				// 날짜가 있을 때
				
				if( !(expirationDateStart.isEmpty()) || !(expirationDateEnd.isEmpty())) {
					if( !(expirationDateStart.isEmpty()) && expirationDateEnd.isEmpty() ) {
						// 최소일자만 있을 때
						pstmt.setString(1, expirationDateStart);
						pstmt.setString(2, "9999-09-09");
						pstmt.setInt(3, offset);
						pstmt.setInt(4, size);

					} else if ( expirationDateStart.isEmpty() && !(expirationDateEnd.isEmpty()) ) {
						// 최대일자만 있을 때
						pstmt.setString(1, "1111-11-11");
						pstmt.setString(2, expirationDateEnd);
						pstmt.setInt(3, offset);
						pstmt.setInt(4, size);

					} else if (!(expirationDateStart.isEmpty()) && !(expirationDateEnd.isEmpty()) ) {
						// 모두 있을 때
						pstmt.setString(1, expirationDateStart);
						pstmt.setString(2, expirationDateEnd);
						pstmt.setInt(3, offset);
						pstmt.setInt(4, size);
					}
				} else {
					pstmt.setInt(1, offset);
					pstmt.setInt(2, size);
				}
			}
			
			rs = pstmt.executeQuery();
			
			while( rs.next() ) {
				ProductDTO dto = new ProductDTO();
				 dto.setProductCode(rs.getString("productCode"));
				dto.setProductName(rs.getString("productName"));
				dto.setProductPrice(rs.getInt("productPrice"));
				dto.setProductSubject(rs.getString("productSubject"));
				dto.setExpirationDate(rs.getString("expirationDate"));
				dto.setProductStorage(rs.getString("productStorage"));
				dto.setProductCategory(rs.getString("productCategory"));
				dto.setHashTag(rs.getString("hashTag"));
				dto.setAlcoholPercent(rs.getDouble("alcoholPercent"));
				dto.setProductTaste(rs.getString("productTaste"));
				dto.setProductPerson(rs.getString("productPerson"));
				dto.setInventory(rs.getInt("inventory"));
				dto.setImage(rs.getString("image"));
				dto.setExtinctOrNot(rs.getInt("extinctOrNot"));
				dto.setPrice(rs.getInt("price"));
				dto.setVolume(rs.getInt("volume"));
				dto.setBreweryPage(rs.getString("breweryPage"));
				
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
	
	public ProductDTO findById(String productCode) {
		ProductDTO dto = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		
		try {
			sql = "SELECT productCode, productName, productPrice, productSubject, TO_CHAR(expirationDate,'YYYY-MM-DD') expirationDate, "
					+ "	productStorage, productCategory,"
					+ "	hashTag, alcoholPercent, productTaste, productPerson, inventory,"
					+ " image, extinctOrNot, price, volume, breweryPage "
					+ "	FROM product "
					+ " WHERE productCode = ?";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, productCode);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto = new ProductDTO();
				
				dto.setProductCode(rs.getString("productCode"));
				
				dto.setProductName(rs.getString("productName"));
				dto.setProductPrice(rs.getInt("productPrice"));
				dto.setProductSubject(rs.getString("productSubject"));
				dto.setExpirationDate(rs.getString("expirationDate"));
				dto.setProductStorage(rs.getString("productStorage"));
				dto.setBreweryPage(rs.getString("breweryPage"));
				dto.setProductCategory(rs.getString("productCategory"));
				dto.setHashTag(rs.getString("hashTag"));
				dto.setAlcoholPercent(rs.getDouble("alcoholPercent"));
				dto.setProductTaste(rs.getString("productTaste"));
				dto.setProductPerson(rs.getString("productPerson"));
				dto.setInventory(rs.getInt("inventory"));
				dto.setImage(rs.getString("image"));
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
	
	
	public void updateProduct(ProductDTO dto) throws SQLException {
		PreparedStatement pstmt = null;
		String sql;
		
		// StringBuilder sb = new StringBuilder();
		
		try {
			sql = "UPDATE product SET productName = ?, productPrice = ?, "
					+ " productSubject = ?, expirationDate = ?, productStorage = ?, productCategory = ?,"
					+ " hashTag = ?, alcoholPercent = ?, productTaste = ?, productPerson = ?, inventory = ?,"
					+ " image = ?, extinctOrNot = ?, price = ?, volume = ?, breweryPage = ? "
					+ "	WHERE productCode = ?";
			/*
			sb.append("UPDATE product SET productName = '?', productPrice = '?', ");
			sb.append(" productSubject = '?', expirationDate = '?', productStorage = '?', productCategory = '?', ");
			sb.append(" hashTag = '?', alcoholPercent = '?', productTaste = '?', productPerson = '?', inventory = '?', ");
			sb.append(" image = '?', extinctOrNot = '?', price = '?', volume = '?', breweryPage = '?' ");
			sb.append(" WHERE productCode = '?'");

			pstmt = conn.prepareStatement(sb.toString());
			*/
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getProductName());
			pstmt.setInt(2, dto.getProductPrice());
			pstmt.setString(3, dto.getProductSubject());
			
			Date expire = Date.valueOf(dto.getExpirationDate());
			pstmt.setDate(4, expire);
			
			pstmt.setString(5, dto.getProductStorage());
			pstmt.setString(6, dto.getProductCategory());
			pstmt.setString(7, dto.getHashTag());
			pstmt.setDouble(8, dto.getAlcoholPercent());
			pstmt.setString(9, dto.getProductTaste());
			pstmt.setString(10, dto.getProductPerson());
			pstmt.setInt(11, dto.getInventory());
			pstmt.setString(12, dto.getImage());
			pstmt.setInt(13, dto.getExtinctOrNot());
			pstmt.setInt(14, dto.getPrice());
			pstmt.setInt(15, dto.getVolume());
			pstmt.setString(16, dto.getBreweryPage());
			pstmt.setString(17, dto.getProductCode());
			
			pstmt.executeUpdate();


		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}  finally {
			DBUtil.close(pstmt);
		}
	}
	
	public void deleteProduct(String produtCode) throws SQLException {
		PreparedStatement pstmt = null;
		String sql;
		
		try {
			sql  = "DELETE FROM product WHERE productCode = ?";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, produtCode);
			
			pstmt.executeUpdate();
					
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		} finally {
			DBUtil.close(pstmt);
		}
		
	}

	
	
	
	

}
