package com.orderList;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.member.MemberDAO;
import com.member.MemberDTO;
import com.member.SessionInfo;
import com.util.MyServlet;
import com.util.MyUtil;

@WebServlet("/orderList/*")
public class OrderListServlet extends MyServlet {
	private static final long serialVersionUID = 1L;
	
	protected void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		
		String uri = req.getRequestURI();
		
		if (uri.indexOf("orderList.do") != -1) {
			orderList(req, resp);
		}
	}
	
	
	protected void orderList(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		MemberDAO memberDAO = new MemberDAO(); 
		OrderListDAO listDAO = new OrderListDAO();
		OrderListDTO listDTO = new OrderListDTO();
		String cp = req.getContextPath();
		List<OrderListDTO> list = new ArrayList<OrderListDTO>();
		SessionInfo memberInfo = (SessionInfo) session.getAttribute("member");
		int mNum = memberInfo.getMnum();
		MemberDTO memberDTO = memberDAO.mypage(mNum);
		req.setAttribute("memberDTO", memberDTO);
		MyUtil util = new MyUtil();
		
//		if (req.getMethod().equalsIgnoreCase("GET")) {
//			resp.sendRedirect(cp + "/");
//			return;
//		}
		
		try {
			String page = req.getParameter("page");
			int current_page = 1;
			if(page != null) {
				current_page = Integer.parseInt(page);
			}
			int dataCount = listDAO.dataCount(mNum);
			int size = 10;
			int total_page = util.pageCount(dataCount, size);
			if (current_page > total_page) {
				current_page = total_page;
			}
			// 게시물 가져오기
			int offset = (current_page - 1) * size;
			if(offset < 0) offset = 0;
			
			list = listDAO.listOrder(mNum);
			
			String listUrl = cp + "/member/mypage_orderList.do";
			String articleUrl = cp + "/member/mypage_orderList.do?page=" + current_page;
			
			String paging = util.paging(current_page, total_page, listUrl);
			
			req.setAttribute("list", list);
			req.setAttribute("page", current_page);
			req.setAttribute("total_page", total_page);
			req.setAttribute("dataCount", dataCount);
			req.setAttribute("size", size);
			req.setAttribute("articleUrl", articleUrl);
			req.setAttribute("paging", paging);
			
			req.setAttribute("dto", listDTO);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		forward(req,resp, "/WEB-INF/views/orderList/mypage_orderList.jsp");
		
		
	}
}
