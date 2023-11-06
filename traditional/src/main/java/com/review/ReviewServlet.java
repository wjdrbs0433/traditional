package com.review;

import java.io.IOException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.MyServlet;
import com.util.MyUtil;

@WebServlet("/review/*")
public class ReviewServlet extends MyServlet {
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	    req.setCharacterEncoding("utf-8");
		String uri = req.getRequestURI();

		if (uri.indexOf("list.do") != -1) {
			list(req, resp);
		} else if (uri.indexOf("myList.do") != -1) {
			myList(req, resp);
		} else if (uri.indexOf("reviewWrite.do") != -1) {
			reviewWrite(req, resp);
		} else if (uri.indexOf("write_ok.do") != -1) {
			writeSubmit(req,resp);
		}
		
	}

	
	private void writeSubmit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		ReviewDAO dao = new ReviewDAO();
		
		//HttpSession session = req.getSession();
		//SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		
		try {
			ReviewDTO dto = new ReviewDTO();

			// userId는 세션에 저장된 정보
			dto.setProductCode(req.getParameter("productCode"));
			dto.setOrderDetailNum(Integer.parseInt(req.getParameter("orderDetailNum")) );			
			dto.setReviewContent(req.getParameter("reviewContent"));
			dto.setStar(Double.parseDouble(req.getParameter("rating")));

			dao.insertReview(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}

		viewPage(req, resp, "redirect:/review/list.do");
	}


	private void reviewWrite(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		ReviewDAO dao = new ReviewDAO();
		String cp = req.getContextPath();

		
		try {
			String productCode = req.getParameter("productCode");
			String orderDetailNum = req.getParameter("orderDetailNum");
			
			ReviewDTO dto = dao.findByCode(productCode);
			
			if(dto == null) {
				resp.sendRedirect(cp+"/review/myList.do");
				return;
			}
			
			req.setAttribute("dto", dto);
			req.setAttribute("orderDetailNum", orderDetailNum);
			req.setAttribute("mode", "write");

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		viewPage(req, resp, "review/reviewWrite.jsp");	
	}


	// 마이리뷰 리스트
	private void myList(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		ReviewDAO dao = new ReviewDAO();
		MyUtil util = new MyUtil();
		
		try {
			String page = req.getParameter("page");
			int current_page = 1;
			if (page != null) {
				current_page = Integer.parseInt(page);
			}
			
			

			// 전체 데이터 개수
			int dataCount;
			
			dataCount = dao.dataCount();
			
			
			// 전체 페이지 수
			int size = 10;
			int total_page = util.pageCount(dataCount, size);
			if (current_page > total_page) {
				current_page = total_page;
			}

			// 게시물 가져오기
			int offset = (current_page - 1) * size;
			if(offset < 0) offset = 0;
			
			List<ReviewDTO> list = null;
			
			list = dao.listMyReview(offset, size);
			

			String query = "";
			

			// 페이징 처리
			String cp = req.getContextPath();
			String listUrl = cp + "/review/myList.do";
			String articleUrl = cp + "/review/reviewArticle.do?page=" + current_page;
			if (query.length() != 0) {
				listUrl += "?" + query;
				articleUrl += "&" + query;
			}

			String paging = util.paging(current_page, total_page, listUrl);

			// 포워딩할 JSP에 전달할 속성
			req.setAttribute("list", list);
			req.setAttribute("page", current_page);
			req.setAttribute("total_page", total_page);
			req.setAttribute("dataCount", dataCount);
			req.setAttribute("size", size);
			req.setAttribute("articleUrl", articleUrl);
			req.setAttribute("paging", paging);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		// JSP로 포워딩
		viewPage(req, resp, "review/myReview.jsp");
		
	}



	private void list(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		ReviewDAO dao = new ReviewDAO();
		MyUtil util = new MyUtil();
		
		try {
			String page = req.getParameter("page");
			int current_page = 1;
			if (page != null) {
				current_page = Integer.parseInt(page);
			}
			
			// 검색
			String schType = req.getParameter("schType");
			String kwd = req.getParameter("kwd");
			if (schType == null) {
				schType = "all";
				kwd = "";
			}

			// GET 방식인 경우 디코딩
			if (req.getMethod().equalsIgnoreCase("GET")) {
				kwd = URLDecoder.decode(kwd, "utf-8");
			}

			// 전체 데이터 개수
			int dataCount;
			if (kwd.length() == 0) {
				dataCount = dao.dataCount();
			} else {
				dataCount = dao.dataCount(schType, kwd);
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
			
			List<ReviewDTO> list = null;
			if (kwd.length() == 0) {
				list = dao.listReview(offset, size);
			} else {
				list = dao.listReview(offset, size, schType, kwd);
			}

			String query = "";
			if (kwd.length() != 0) {
				query = "schType=" + schType + "&kwd=" + URLEncoder.encode(kwd, "utf-8");
			}

			// 페이징 처리
			String cp = req.getContextPath();
			String listUrl = cp + "/review/list.do";
			String articleUrl = cp + "/review/reviewArticle.do?page=" + current_page;
			if (query.length() != 0) {
				listUrl += "?" + query;
				articleUrl += "&" + query;
			}

			String paging = util.paging(current_page, total_page, listUrl);

			// 포워딩할 JSP에 전달할 속성
			req.setAttribute("list", list);
			req.setAttribute("page", current_page);
			req.setAttribute("total_page", total_page);
			req.setAttribute("dataCount", dataCount);
			req.setAttribute("size", size);
			req.setAttribute("articleUrl", articleUrl);
			req.setAttribute("paging", paging);
			req.setAttribute("schType", schType);
			req.setAttribute("kwd", kwd);
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		// JSP로 포워딩
		viewPage(req, resp, "review/reviewList.jsp");
	}
}
