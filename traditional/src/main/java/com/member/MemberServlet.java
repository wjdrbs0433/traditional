package com.member;

import java.io.IOException;
import java.sql.SQLException;

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
		} else if (uri.indexOf("logout.do") != -1) {
			logout(req, resp);
		} else if (uri.indexOf("member.do") != -1) {
			memberForm(req, resp);
		} else if (uri.indexOf("member_ok.do") != -1) {
			memberSubmit(req, resp);
		} else if (uri.indexOf("userIdCheck.do") != -1) {
			userIdCheck(req, resp);
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
			String alertScript = "<script>alert('" + msg + "');</script>";
			req.setAttribute("alertScript", alertScript);

			forward(req, resp, "/WEB-INF/views/member/login.jsp");
	}
	
	protected void logout(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 로그아웃
		HttpSession session = req.getSession();
		String cp = req.getContextPath();

		// 세션에 저장된 정보를 지운다.
		session.removeAttribute("member");

		// 세션에 저장된 모든 정보를 지우고 세션을 초기화 한다.
		session.invalidate();

		// 루트로 리다이렉트
		resp.sendRedirect(cp + "/");
	}
	
	protected void memberForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 회원가입 폼
		req.setAttribute("title", "회원 가입");
		req.setAttribute("mode", "member");

		forward(req, resp, "/WEB-INF/views/member/member.jsp");
	}
	
	public void memberSubmit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	    // 회원가입 처리
	    MemberDAO dao = new MemberDAO();

	    String cp = req.getContextPath();
	    if (req.getMethod().equalsIgnoreCase("GET")) {
	        resp.sendRedirect(cp + "/");
	        return;
	    }

	    String message = "";
	    try {
	        MemberDTO dto = new MemberDTO();
	        dto.setMid(req.getParameter("mid"));
	        dto.setMpwd(req.getParameter("mpwd"));
	        dto.setMname(req.getParameter("mname"));
	        dto.setMrnum(req.getParameter("mrnum"));
	        
	        String mtel1 = req.getParameter("mtel1");
	        String mtel2 = req.getParameter("mtel2");
	        String mtel3 = req.getParameter("mtel3");
	        String mtel = mtel1 + "-" + mtel2 + "-" + mtel3;
	        dto.setMtel(mtel);
	 
	        String mphone1 = req.getParameter("mphone1");
	        String mphone2 = req.getParameter("mphone2");
	        String mphone3 = req.getParameter("mphone3");
	        String mphone = mphone1 + "-" + mphone2 + "-" + mphone3;
	        dto.setMphone(mphone);
	        
	        String memail1 = req.getParameter("memail1");
	        String memail2 = req.getParameter("memail2");
	        String memail = memail1 + "@" + memail2;
	        dto.setMemail(memail);
	        
	        dto.setField(req.getParameter("field") != null ? "Y" : "N");
	        dto.setField2(req.getParameter("field2") != null ? "Y" : "N");
	        dto.setAdminOrNot(req.getParameter("adminOrNot") != null ? 0 : 1);

	        dao.insertMember(dto);
	        resp.sendRedirect(cp + "/");
	        return;
	    } catch (SQLException e) {
	        if (e.getErrorCode() == 1)
	            message = "아이디 중복으로 회원 가입이 실패 했습니다.";
	        else if (e.getErrorCode() == 1400)
	            message = "필수 사항을 입력하지 않았습니다.";
	        else if (e.getErrorCode() == 1840 || e.getErrorCode() == 1861)
	            message = "날짜 형식이 일치하지 않습니다.";
	        else
	            message = "회원 가입이 실패 했습니다.";
	        // 기타 - 2291:참조키 위반, 12899:폭보다 문자열 입력 값이 큰 경우
	    } catch (Exception e) {
	        message = "회원 가입이 실패 했습니다.";
	        e.printStackTrace();
	    }

	    req.setAttribute("title", "회원 가입");
	    req.setAttribute("mode", "member");
	    req.setAttribute("message", message);

	    forward(req, resp, "/WEB-INF/views/member/member.jsp");
	}
	
	public void userIdCheck(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 아이디 중복 체크
	}

}
