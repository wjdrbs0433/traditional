package com.qna;

import java.io.IOException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.member.SessionInfo;
import com.util.MyServlet;
import com.util.MyUtil;

@WebServlet("/qna/*")
public class QnaServlet extends MyServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String uri = req.getRequestURI();

		// uri에 따른 작업 구분
		if (uri.indexOf("list.do") != -1) {
			list(req, resp);
		} else if (uri.indexOf("write.do") != -1) {
			writeForm(req, resp);
		} else if (uri.indexOf("write_ok.do") != -1) {
			writeSubmit(req, resp);
		} else if (uri.indexOf("article.do") != -1) {
			article(req, resp);
		} else if (uri.indexOf("update.do") != -1) {
			updateForm(req, resp);
		} else if (uri.indexOf("update_ok.do") != -1) {
			updateSubmit(req, resp);
		} else if (uri.indexOf("answer.do") != -1) {
			answerSubmit(req, resp);
		} else if (uri.indexOf("delete.do") != -1) {
			delete(req, resp);
		}
	}

	protected void list(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 게시물 리스트
		QnaDAO dao = new QnaDAO();
		MyUtil util = new MyUtil();
		
		try {
			String page = req.getParameter("page");
			int current_page = 1;
			if (page != null) {
				current_page = Integer.parseInt(page);
			}
			
			// 검색
			String kwd = req.getParameter("kwd");
			if (kwd == null) {
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
				dataCount = dao.dataCount(kwd);
			}
			
			// 전체 페이지 수
			int size = 5;
			int total_page = util.pageCount(dataCount, size);
			if (current_page > total_page) {
				current_page = total_page;
			}

			// 게시물 가져오기
			int offset = (current_page - 1) * size;
			if(offset < 0) offset = 0;
			
			List<QnaDTO> list = null;
			if (kwd.length() == 0) {
				list = dao.listQuestion(offset, size);
			} else {
				list = dao.listQuestion(offset, size, kwd);
			}

			String query = "";
			if (kwd.length() != 0) {
				query = "kwd=" + URLEncoder.encode(kwd, "utf-8");
			}

			// 페이징 처리
			String cp = req.getContextPath();
			String listUrl = cp + "/qna/list.do";
			String articleUrl = cp + "/qna/article.do?page=" + current_page;
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
			req.setAttribute("kwd", kwd);
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		// JSP로 포워딩
		viewPage(req, resp, "qna/list.jsp");
	}

	protected void writeForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 글쓰기 폼
		req.setAttribute("mode", "write");
		viewPage(req, resp, "qna/write.jsp");
	}

	protected void writeSubmit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 글 저장
		QnaDAO dao = new QnaDAO();
		
		HttpSession session = req.getSession();
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		if (req.getMethod().equalsIgnoreCase("GET")) {
			viewPage(req, resp, "redirect:/qna/list.do");
			return;
		}
		
		try {
			QnaDTO dto = new QnaDTO();

			// userId는 세션에 저장된 정보
			dto.setUserId(info.getMid());

			// 파라미터
			dto.setSecret(Integer.parseInt(req.getParameter("secret")));
			dto.setTitle(req.getParameter("title"));
			dto.setContent(req.getParameter("content"));

			dao.insertQuestion(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}

		viewPage(req, resp, "redirect:/qna/list.do");
	}

	protected void article(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 글보기
		QnaDAO dao = new QnaDAO();
		
		HttpSession session = req.getSession();
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		String page = req.getParameter("page");
		String query = "page=" + page;

		try {
			long num = Long.parseLong(req.getParameter("num"));
			String kwd = req.getParameter("kwd");
			if (kwd == null) {
				kwd = "";
			}
			kwd = URLDecoder.decode(kwd, "utf-8");

			if (kwd.length() != 0) {
				query += "&kwd=" + URLEncoder.encode(kwd, "UTF-8");
			}

			// 게시물 가져오기
			QnaDTO dto = dao.findById(num);
			if (dto == null) {
				viewPage(req, resp, "redirect:/qna/list.do?" + query);
				return;
			}
			
			if( dto.getSecret() == 1) {
				if( ! dto.getUserId().equals(info.getMid()) && ! info.getMid().equals("admin")) {
					viewPage(req, resp, "redirect:/qna/list.do?" + query);
					return;
				}
			}
			
			
			dto.setContent(dto.getContent().replaceAll("\n", "<br>"));
			if(dto.getAnswer() != null) {
				dto.setAnswer(dto.getAnswer().replaceAll("\n", "<br>"));
			}

			// 이전글 다음글
			QnaDTO prevDto = dao.findByPrev(dto.getNum(), kwd);
			QnaDTO nextDto = dao.findByNext(dto.getNum(), kwd);

			// JSP로 전달할 속성
			req.setAttribute("dto", dto);
			req.setAttribute("page", page);
			req.setAttribute("query", query);
			req.setAttribute("prevDto", prevDto);
			req.setAttribute("nextDto", nextDto);

			// 포워딩
			viewPage(req, resp, "qna/article.jsp");
			return;
		} catch (Exception e) {
			e.printStackTrace();
		}

		viewPage(req, resp, "redirect:/qna/list.do?" + query);
	}

	protected void updateForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 수정 폼
		QnaDAO dao = new QnaDAO();

		HttpSession session = req.getSession();
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		String page = req.getParameter("page");

		try {
			long num = Long.parseLong(req.getParameter("num"));
			QnaDTO dto = dao.findById(num);

			if (dto == null) {
				viewPage(req, resp, "redirect:/qna/list.do?page=" + page);
				return;
			}

			// 게시물을 올린 사용자가 아니면
			if (! dto.getUserId().equals(info.getMid())) {
				viewPage(req, resp, "redirect:/qna/list.do?page=" + page);
				return;
			}

			req.setAttribute("dto", dto);
			req.setAttribute("page", page);
			req.setAttribute("mode", "update");

			viewPage(req, resp, "qna/write.jsp");
			return;
		} catch (Exception e) {
			e.printStackTrace();
		}

		viewPage(req, resp, "redirect:/qna/list.do?page=" + page);
	}

	protected void updateSubmit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 수정 완료
		QnaDAO dao = new QnaDAO();

		HttpSession session = req.getSession();
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		if (req.getMethod().equalsIgnoreCase("GET")) {
			viewPage(req, resp, "redirect:/qna/list.do");
			return;
		}

		String page = req.getParameter("page");
		try {
			QnaDTO dto = new QnaDTO();
			
			dto.setNum(Long.parseLong(req.getParameter("num")));
			dto.setSecret(Integer.parseInt(req.getParameter("secret")));
			dto.setTitle(req.getParameter("title"));
			dto.setContent(req.getParameter("content"));

			dto.setUserId(info.getMid());

			dao.updateQuestion(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}

		viewPage(req, resp, "redirect:/qna/list.do?page=" + page);
	}

	protected void answerSubmit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 답변 완료
		QnaDAO dao = new QnaDAO();

		HttpSession session = req.getSession();
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		if (req.getMethod().equalsIgnoreCase("GET")) {
			viewPage(req, resp, "redirect:/qna/list.do");
			return;
		}

		if (! info.getMid().equals("admin")) {
			viewPage(req, resp, "redirect:/qna/list.do");
			return;
		}
		
		String page = req.getParameter("page");
		try {
			QnaDTO dto = new QnaDTO();
			
			dto.setNum(Long.parseLong(req.getParameter("num")));
			dto.setAnswer(req.getParameter("answer"));
			dto.setAnswerId(info.getMid());

			dao.updateAnswer(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}

		viewPage(req, resp, "redirect:/qna/list.do?page=" + page);
	}

	protected void delete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 삭제
		QnaDAO dao = new QnaDAO();

		HttpSession session = req.getSession();
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		String page = req.getParameter("page");
		String query = "page=" + page;

		try {
			long num = Long.parseLong(req.getParameter("num"));
			String mode = req.getParameter("mode");
			
			String kwd = req.getParameter("kwd");
			if (kwd == null) {
				kwd = "";
			}
			kwd = URLDecoder.decode(kwd, "utf-8");

			if (kwd.length() != 0) {
				query += "&kwd=" + URLEncoder.encode(kwd, "UTF-8");
			}
			
			if(mode.equals("answer") && info.getMid().equals("admin")) {
				// 답변 삭제
				QnaDTO dto = new QnaDTO();
				dto.setNum(num);
				dto.setAnswer("");
				dto.setAnswerId("");
				dao.updateAnswer(dto);
			} else if(mode.equals("question")) {
				// 질문 삭제
				dao.deleteQuestion(num, info.getMid());
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		viewPage(req, resp, "redirect:/qna/list.do?" + query);
	}
}
