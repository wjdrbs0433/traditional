package com.admin.product;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.util.MyUploadServlet;
import com.util.MyUtil;

@WebServlet("/admin/product/*")
@MultipartConfig
public class ProductServlet extends MyUploadServlet {
	private static final long serialVersionUID = 1L;

	private String pathname;
	
	@Override
	protected void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		
		HttpSession session = req.getSession();
		
		// 이미지를 저장할 경로(pathname)
		String root = session.getServletContext().getRealPath("/");
		pathname = root + "uploads" + File.separator + "photo";
		
		String uri = req.getRequestURI();
		
		/*
		// 세션 정보
		
		SessionInfo info = (SessionInfo) session.getAttribute("admin");

		if (info == null) {
			forward(req, resp, "/WEB-INF/views/member/login.jsp");
			return;
		}
		*/
		
		// uri에 따른 작업 구분
		if(uri.indexOf("list.do") != -1) {
			list(req,resp);
		} else if (uri.indexOf("write.do") != -1) {
			writeForm(req,resp);
		} else if (uri.indexOf("write_ok.do") != -1) {
			writeSubmit(req,resp); 
		} else if (uri.indexOf("update.do") != -1) {
			updateForm(req,resp); 
		} else if (uri.indexOf("update_ok.do") != -1) {
			updateSubmit(req, resp); 
		} else if (uri.indexOf("updateList.do") != -1) {
			updateListForm(req, resp);
		}
	
	}
	
	protected void list(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 상품관리 리스트
		ProductDAO dao = new ProductDAO();
		MyUtil util = new MyUtil();
		
		String cp = req.getContextPath();
		
		try {
			// 넘어온 페이지
			String page = req.getParameter("page");
			int current_page = 1;
			if(page != null) {
				current_page = Integer.parseInt(page);
			}
			
			
			// 검색
			String productNameKwd = req.getParameter("productName");
			String[] productPriceKwd = req.getParameterValues("price");
			String[] volumeKwd = req.getParameterValues("volume");
			String expirationDateStart = req.getParameter("expirationDateStart");
			String expirationDateEnd = req.getParameter("expirationDateEnd");
			String[] productCategoryKwd = req.getParameterValues("category");
			String[] alcoholPercentKwd = req.getParameterValues("alcohol");
			String[] productTasteKwd = req.getParameterValues("taste");

			
			// 전체 데이터 개수
			List<String> productPriceKwdlist = new ArrayList<String>();
			if(productPriceKwd != null ) {
				for(String s : productPriceKwd) {
					productPriceKwdlist.add(s);
				}
			}
			
			List<String> volumeKwdlist = new ArrayList<String>();
			if(volumeKwd != null) {
				for(String s : volumeKwd) {
					volumeKwdlist.add(s);
				}
			}
			
			
			List<String> productCategoryKwdlist = new ArrayList<String>();
			if(productCategoryKwd != null) {
				for(String s : productCategoryKwd) {
					productCategoryKwdlist.add(s);
				}
			}
			
			List<String> alcoholPercentKwdlist = new ArrayList<String>();
			if(alcoholPercentKwd != null) {
				for(String s : alcoholPercentKwd) {
					alcoholPercentKwdlist.add(s);
				}
			}
			
			List<String> productTasteKwdlist = new ArrayList<String>();
			if(productTasteKwd != null) {
				for(String s : productTasteKwd) {
					productTasteKwdlist.add(s);
				}
			}
			
			
			int dataCount;

			if( productNameKwd == null
					&& productPriceKwd == null
					&& volumeKwd == null
					&& expirationDateStart == null
					&& expirationDateEnd == null
					&& productCategoryKwd == null
					&& alcoholPercentKwd == null
					&& productTasteKwd == null) {
				dataCount = dao.dataCount();
			} else {
				
				dataCount = dao.dataCount(productNameKwd, productPriceKwdlist, volumeKwdlist, 
						expirationDateStart, expirationDateEnd, productCategoryKwdlist,
						alcoholPercentKwdlist, productTasteKwdlist);
			}
			
			
			// 전체 페이지 수
			int size = 10;
			int total_page = util.pageCount(dataCount, size);
			if (current_page > total_page) {
				current_page = total_page;
			}
			
			
			// 게시물 가져오기
			int offset = (current_page - 1) * size;
			if(offset < 0) offset = 0;
			
			List<ProductDTO> list = null;
			
			if (productNameKwd == null
					&& productPriceKwd == null
					&& volumeKwd == null
					&& expirationDateStart == null
					&& expirationDateEnd == null
					&& productCategoryKwd == null
					&& alcoholPercentKwd == null
					&& productTasteKwd == null) {
				list = dao.listProduct(offset, size);
			} else {
				list = dao.listProduct(offset, size, productNameKwd, productPriceKwdlist, volumeKwdlist, 
						expirationDateStart, expirationDateEnd, productCategoryKwdlist,
						alcoholPercentKwdlist, productTasteKwdlist);
			
			}
			
			/*
			String query = "";
			if (productNameKwd.length() != 0) {
				query = "productNameKwd=" + URLEncoder.encode(productNameKwd, "utf-8");
			}
			
			*/
			
			// 페이징 처리
			String listUrl = cp + "/admin/product/list.do";
			String articleUrl = cp + "/admin/product/list.do?page=" + current_page;
			/*
			if (query.length() != 0) {
				listUrl += "?" + query;
				//articleUrl += "&" + query;
			}
			*/
			String paging = util.paging(current_page, total_page, listUrl);
			
			// 포워딩할 JSP에 전달할 속성
			req.setAttribute("list", list);
			req.setAttribute("page", current_page);
			req.setAttribute("total_page", total_page);
			req.setAttribute("dataCount", dataCount);
			req.setAttribute("size", size);
			req.setAttribute("articleUrl", articleUrl);
			req.setAttribute("paging", paging);
			req.setAttribute("productNameKwd", productNameKwd);
			req.setAttribute("productPriceKwd", productPriceKwd);
			req.setAttribute("volumeKwd", volumeKwd);
			req.setAttribute("expirationDateStart", expirationDateStart);
			req.setAttribute("expirationDateEnd", expirationDateEnd);
			req.setAttribute("productCategoryKwd", productCategoryKwd);
			req.setAttribute("alcoholPercentKwd", alcoholPercentKwd);
			req.setAttribute("productTasteKwd", productTasteKwd);
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		// JSP로 포워딩
		forward(req, resp, "/WEB-INF/views/admin/product/list.jsp");
	
	}
	
	protected void writeForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 글쓰기 폼
		
		String size = req.getParameter("size");
		req.setAttribute("size", size);
		
		String page = req.getParameter("page");
		req.setAttribute("page", page);
		
		req.setAttribute("mode", "write");
		forward(req, resp, "/WEB-INF/views/admin/product/write.jsp");
		
	}
	
	protected void writeSubmit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 글 저장
		String cp = req.getContextPath();
		ProductDAO dao = new ProductDAO();
		
		/*
		if (req.getMethod().equalsIgnoreCase("GET")) {
			viewPage(req, resp, "redirect:/admin/product/list.do");
			return;
		}
		*/
		try {
			ProductDTO dto = new ProductDTO();

			// 파라미터
			dto.setProductName(req.getParameter("productName"));
			
			if(req.getParameter("productPrice") != null) {
			dto.setProductPrice(Integer.parseInt(req.getParameter("productPrice")));
			}
			dto.setProductSubject(req.getParameter("productSubject"));
			dto.setExpirationDate(req.getParameter("expirationDate"));
			dto.setProductStorage(req.getParameter("productStorage"));
			dto.setProductCategory(req.getParameter("productCategory"));
			
			dto.setHashTag(req.getParameter("hashTag"));
			
			if(req.getParameter("alcoholPercent") != null) {
			dto.setAlcoholPercent(Double.parseDouble(req.getParameter("alcoholPercent")));
			}
			
			dto.setProductTaste(req.getParameter("productTaste"));
			
			dto.setProductPerson(req.getParameter("productPerson"));
			dto.setInventory(Integer.parseInt(req.getParameter("inventory")));
			
			dto.setImage(req.getParameter("image"));
			
			if(req.getParameter("extinctOrNot") != null) {
			dto.setExtinctOrNot(Integer.parseInt(req.getParameter("extinctOrNot")));
			}
			if(req.getParameter("price") != null) {
			dto.setPrice(Integer.parseInt(req.getParameter("price")));
			}
			if(req.getParameter("volume") != null) {
			dto.setVolume(Integer.parseInt(req.getParameter("volume")));
			}
			
			dto.setBreweryPage(req.getParameter("breweryPage"));

			dao.insertProduct(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		resp.sendRedirect(cp + "/admin/product/list.do");
	}
	
	protected void updateForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 수정 폼 
		 ProductDAO dao = new ProductDAO();

		String cp = req.getContextPath();

		String page = req.getParameter("page");
		String size = req.getParameter("size");

		try {
			String productCode = req.getParameter("productCode");
			ProductDTO dto = dao.findById(productCode);

			if (dto == null) {
				resp.sendRedirect(cp + "/admin/product/list.do?page=" + page);
				return;
			}
			
			req.setAttribute("dto", dto);
			req.setAttribute("page", page);
			req.setAttribute("size", size);
			req.setAttribute("mode", "update");
			req.setAttribute("productCode", productCode);

			forward(req, resp, "/WEB-INF/views/admin/product/write.jsp");
			return;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		viewPage(req, resp, "redirect:/notice/admin/product/list.do?page=" + page + "&size=" + size);

	}
	
	protected void viewPage(HttpServletRequest req, HttpServletResponse resp, String string) {
		// TODO Auto-generated method stub
		
	}

	protected void updateSubmit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 수정 완료
		ProductDAO dao = new ProductDAO();

		
		String cp = req.getContextPath();
		

		String page = req.getParameter("page");
		
		
		
		try {
			ProductDTO dto = new ProductDTO();
			
			dto.setProductName(req.getParameter("productName"));
			dto.setProductPrice(Integer.parseInt(req.getParameter("productPrice")));
			dto.setProductSubject(req.getParameter("productSubject"));
			dto.setExpirationDate(req.getParameter("expirationDate"));
			dto.setProductStorage(req.getParameter("productStorage"));
			dto.setProductCategory(req.getParameter("productCategory"));
			dto.setHashTag(req.getParameter("hashTag"));
			dto.setAlcoholPercent(Double.parseDouble(req.getParameter("alcoholPercent")));
			dto.setProductTaste(req.getParameter("productTaste"));
			dto.setProductPerson(req.getParameter("productPerson"));
			dto.setInventory(Integer.parseInt(req.getParameter("inventory")));
			dto.setImage(req.getParameter("image"));
			dto.setExtinctOrNot(Integer.parseInt(req.getParameter("extinctOrNot")));
			dto.setPrice(Integer.parseInt(req.getParameter("price")));
			dto.setVolume(Integer.parseInt(req.getParameter("volume")));
			dto.setBreweryPage(req.getParameter("breweryPage"));
			dto.setProductCode(req.getParameter("productCode"));
			
			dao.updateProduct(dto);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		resp.sendRedirect(cp + "/admin/product/list.do?page=" + page);
	}
	
	protected void updateListForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String cp = req.getContextPath();
		
		try {
			String[] check = req.getParameterValues("check");
			long nums[] = null;
			nums = new long[check.length];
			for(int i=0; i<check.length; i++) {
				nums[i] = Long.parseLong(check[i]);
			}
			
			ProductDAO dao = new ProductDAO();
			
			// 상품 선택 삭제
			dao.updateProductList(nums);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		resp.sendRedirect(cp + "/admin/product/list.do?");
	}
}
	
	

