package com.myqna;

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
import com.qna.QnaDTO;
import com.util.MyServlet;
import com.util.MyUtil;

@WebServlet("/myqna/*")
public class MyqnaServlet extends MyServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String uri = req.getRequestURI();
		
		// uri에 따른 작업 구분
		if(uri.indexOf("mylist.do") != -1) {
			list(req,resp);
	} else if (uri.indexOf("delete.do") != -1) {
			delete(req,resp);
		}
	}
	
	protected void list(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		MemberDAO memberDAO = new MemberDAO();
		MyqnaDAO dao = new MyqnaDAO();
		QnaDTO dto = new QnaDTO();
		
		SessionInfo memberInfo = (SessionInfo) session.getAttribute("member");
		String mid = memberInfo.getMid();
		MemberDTO memberDTO = memberDAO.mypage(mid);
		req.setAttribute("memberDTO", memberDTO);
		
		MyUtil util = new MyUtil();
		
		try {
			String page = req.getParameter("page");
			int current_page = 1;
			if (page != null) {
				current_page = Integer.parseInt(page);
			}
			
			// 전체 데이터 개수
			int dataCount = dao.dataCount(mid);
			
			// 전체 페이지 수
			int size = 5;
			int total_page = util.pageCount(dataCount, size);
			if (current_page > total_page) {
				current_page = total_page;
			}
			
			// 게시물 가져오기
			int offset = (current_page - 1) * size;
			if(offset < 0) offset = 0;

			List<QnaDTO> list = dao.listQuestion(offset, size, mid);
			
			// 페이징 처리
			String cp = req.getContextPath();
			String listUrl = cp + "/myqna/mylist.do";
			String articleUrl = cp + "/qna/article.do?page=" + current_page;
			
			String paging = util.paging(current_page, total_page, listUrl);

			// 포워딩할 JSP에 전달할 속성
			req.setAttribute("list", list);
			req.setAttribute("page", current_page);
			req.setAttribute("total_page", total_page);
			req.setAttribute("dataCount", dataCount);
			req.setAttribute("size", size);
			req.setAttribute("articleUrl", articleUrl);
			req.setAttribute("paging", paging);
			req.setAttribute("dto", dto);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		// JSP로 포워딩
		viewPage(req, resp, "member/mylist.jsp");
	}
	
	protected void delete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		MyqnaDAO dao = new MyqnaDAO();
		
		HttpSession session = req.getSession();
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		String page = req.getParameter("page");
		String query = "page=" + 1;

		try {
			long num = Long.parseLong(req.getParameter("num"));
		
		dao.deleteQuestion(num, info.getMid());
	} catch (Exception e) {
		e.printStackTrace();
	}
		
		viewPage(req, resp, "redirect:/myqna/mylist.do?" + query);
	}
}
