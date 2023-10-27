package com.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.util.MyServlet;

@WebServlet("/member/*")
public class MemberServlet extends MyServlet{
	private static final long serialVersionUID = 1L;

	@Override
	protected void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		
		String uri = req.getRequestURI();
		
		if (uri.indexOf("login.do") != -1) {
			loginForm(req, resp);
		} else if (uri.indexOf("login_ok.do") != -1) {
			loginSubmit(req, resp);
		} 
		
	}
	protected void loginForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String path = "/WEB-INF/views/member/login.jsp";
		forward(req, resp, path);
	}
	
	protected void loginSubmit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();

		MemberDAO dao = new MemberDAO();
		String cp = req.getContextPath();

		if (req.getMethod().equalsIgnoreCase("GET")) {
			resp.sendRedirect(cp + "/");
			return;
		}

		String mid = req.getParameter("mid");
		String mpwd = req.getParameter("mpwd");
		
		MemberDTO dto = dao.loginMember(mid, mpwd);
		
		if (dto != null) {
			// 로그인 성공 : 로그인정보를 서버에 저장
			// 세션의 유지시간을 20분설정(기본 30분)
			session.setMaxInactiveInterval(20 * 60);

			// 세션에 저장할 내용
			SessionInfo info = new SessionInfo();
			info.setMid(dto.getMid());
			info.setMname(dto.getMname());

			// 세션에 member이라는 이름으로 저장
			session.setAttribute("member", info);
			
			String preLoginURI = (String)session.getAttribute("preLoginURI");
			session.removeAttribute("preLoginURI");
			
			if(preLoginURI != null) {
				// 로그인 전페이지
				resp.sendRedirect(preLoginURI);
			} else {
				// 메인화면으로 리다이렉트
				resp.sendRedirect(cp + "/");
			}
			return;
		}
		
		// 로그인 실패인 경우(다시 로그인 폼으로)
			String msg = "아이디 또는 패스워드가 일치하지 않습니다.";
			req.setAttribute("message", msg);

			forward(req, resp, "/WEB-INF/views/member/login.jsp");
	}

}
