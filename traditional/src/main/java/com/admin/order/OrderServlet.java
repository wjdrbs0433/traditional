package com.admin.order;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.util.MyServlet;
import com.util.MyUtil;

@WebServlet("/admin/order/*")
public class OrderServlet extends MyServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		
		String uri = req.getRequestURI();
		HttpSession session = req.getSession();
		
		if(uri.indexOf("list.do") != -1) {
			list(req,resp);
		} else if (uri.indexOf("update.do") != -1) {
			updateForm(req, resp);
		} else if (uri.indexOf("update_ok.do") != -1) {
			updateSubmit(req, resp);
		}
		
	}
	
	protected void list(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// OrderList 검색
		// ordernum  String
//		deliverynum  
//		orderDateStart	String
//		orderDateEnd		String
//		orderPrice			1만원 이하 / 1만원이상 3만원 미만	/	3만원 이상 5만원 미만 / 5만원 이상
//		totalPrice			1만원 이하 / 1만원이상 3만원 미만	/	3만원 이상 5만원 미만 / 5만원 이상
//		discount				1만원 이하 / 1만원이상 3만원 미만	/	3만원 이상 
//		shippingFee	무료배송 / 무료배송 X
//		orderStatus String
		OrderDAO dao = new OrderDAO();
		MyUtil util = new MyUtil();
		
		String cp = req.getContextPath();
		
		try {
			// 넘어온 페이지
			String page = req.getParameter("page");
			int current_page = 1;
			if( page != null) {
				current_page =  Integer.parseInt(page);
			}
			
			// 검색
			String orderNumKwd = req.getParameter("orderNum");
			String orderDateStart = req.getParameter("orderDateStart");
			String orderDateEnd= req.getParameter("orderDateEnd");
			String[] orderPrice= req.getParameterValues("orderPrice");
			String[] totalPrice = req.getParameterValues("totalPrice");
			String orderStatus = req.getParameter("orderStatus");
			

			List<String> orderPriceList = new ArrayList<String>();
			List<String> totalPriceList = new ArrayList<String>();
			
			if( orderPrice != null) {
				for(String s: orderPrice) {
					orderPriceList.add(s);
				}
			}
			if( totalPrice != null) {
				for(String s: totalPrice) {
					totalPriceList.add(s);
				}
			}
			
			int dataCount;
			
			if ( orderNumKwd == null
					&& orderDateStart == null
					&& orderDateEnd == null
					&& orderPriceList.isEmpty()
					&& totalPriceList.isEmpty()
					&& orderStatus == null
				) 
			{
				dataCount = dao.dataCount();
			} else {
				dataCount = dao.dataCount(orderNumKwd,
						  orderDateStart,
						  orderDateEnd,
						  orderPriceList,
						  totalPriceList,
						  orderStatus);
			}
			
			// 전체 페이지 수
			int size = 10;
			int total_page = util.pageCount(dataCount, size);
			if (current_page > total_page) {
				current_page = total_page;
			}
				
			int offset = (current_page - 1) * size;
			if(offset < 0) offset = 0;
			
			List<OrderDTO> list = null;
			
			if( orderNumKwd == null
					&& orderDateStart == null
					&& orderDateEnd == null
					&& orderPriceList.isEmpty()
					&& totalPriceList.isEmpty()
					&& orderStatus == null  ) {
				list = dao.listOrder(offset, size);
			} else {
				list = dao.listOrder(offset, size, orderNumKwd,
						  orderDateStart,
						  orderDateEnd,
						  orderPriceList,
						  totalPriceList,
						  orderStatus);
			}
			
			String listUrl = cp + "/order/list.do";
			String paging = util.paging(current_page, total_page, listUrl);
			
			req.setAttribute("list", list);
			req.setAttribute("page", current_page);
			req.setAttribute("total_page", total_page);
			req.setAttribute("dataCount", dataCount);
			req.setAttribute("size", size);
			req.setAttribute("paging", paging);
			/*
			 * jsp로 배열 전달 하는거 구현 => 검색 후에도 검색 조건 사라지지 않게
			 */
			req.setAttribute("orderNumKwd", orderNumKwd);
			req.setAttribute("orderDateStart", orderDateStart);
			req.setAttribute("orderDateEnd",	orderDateEnd);
			req.setAttribute("orderPrice", orderPrice);
			req.setAttribute("totalPriceStart",	 totalPrice);
			req.setAttribute("orderStatus", orderStatus);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		forward(req, resp, "/WEB-INF/views/admin/order/list.jsp");
		
	}
	protected void updateForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 수정 폼
		
		OrderDAO dao = new OrderDAO();
		String cp = req.getContextPath();

		String page = req.getParameter("page");
		String size = req.getParameter("size");
		
		try {
			Long orderNum = Long.parseLong(req.getParameter("orderNum"));
			OrderDTO dto = dao.findByOrderNum(orderNum);
			
			if(dto == null) {
				resp.sendRedirect(cp + "/admin/order/list.do?page=" + page);
				System.out.println("dto==null");
				return;
			}
			
			req.setAttribute("dto", dto);
			req.setAttribute("page", page);
			req.setAttribute("size", size);
			req.setAttribute("orderNum", orderNum);
			
			forward(req, resp, "/WEB-INF/views/admin/order/write.jsp");
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		viewPage(req, resp, "redirect:/notice/admin/order/list.do?page=" + page + "&size=" + size);
	}
	
	protected void updateSubmit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String cp = req.getContextPath();
		OrderDAO dao = new OrderDAO();
		String page = req.getParameter("page");
		
		try {
			OrderDTO dto = new OrderDTO();
			
			// 파라미터
			dto.setOrderNum(Long.parseLong(req.getParameter("orderNum")));
			dto.setOrderDate(req.getParameter("orderDate"));
			dto.setOrderPrice(Long.parseLong(req.getParameter("orderPrice")));
			dto.setTotalPrice(Long.parseLong(req.getParameter("totalPrice")));
			dto.setShippingFee(Long.parseLong(req.getParameter("shippingFee")));
			dto.setOrderStatus(req.getParameter("orderStatus"));
			dto.setmNum(Long.parseLong(req.getParameter("mNum")));
			
			dao.updateOrder(dto);
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	
		resp.sendRedirect(cp + "/admin/order/list.do?page=" + page);
	}
}
