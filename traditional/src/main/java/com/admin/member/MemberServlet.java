package com.admin.member;

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

@WebServlet("/admin/member/*")
public class MemberServlet extends MyServlet {
   private static final long serialVersionUID = 1L;

   @Override
   protected void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      req.setCharacterEncoding("utf-8");

      String uri = req.getRequestURI();
      
      if (uri.indexOf("list.do") != -1) {
         list(req, resp);
      } else if (uri.indexOf("updateList.do") != -1) { // 선택삭제
    	  updateListForm(req,resp);
      } else if (uri.indexOf("update_ok.do") != -1) { // 개별삭제
          updateSubmit(req, resp);
      }
   }
   
   
   protected void list(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      MemberDAO dao = new MemberDAO();
      MyUtil util = new MyUtil();

      String cp = req.getContextPath();
      
      try {
         String page = req.getParameter("page");
         int current_page = 1;
         if (page != null) {
            current_page = Integer.parseInt(page);
         }
         
         // 검색
         String schType = req.getParameter("schType");
         String kwd = req.getParameter("kwd");
         String agreeSms = req.getParameter("agreeSms");
         String agreeEmail = req.getParameter("agreeEmail");
         
         System.out.println(agreeSms);
         if (schType == null) {
            schType = "";
            kwd = "";
         }

         if (req.getMethod().equalsIgnoreCase("GET")) {
            kwd = URLDecoder.decode(kwd, "utf-8");
         }

		int dataCount;
		if (kwd.length() == 0 && agreeSms == null && agreeEmail == null) {
			// 검색 없고 체크도 없을때 (전체 리스트)
			dataCount = dao.dataCount();

		} else if (kwd.length() == 0 && (agreeSms != null || agreeEmail != null)) {
			// 검색 없고 체크 있을때
			dataCount = dao.dataCount2(agreeSms, agreeEmail);
		} else {
			// 검색만 있을 때
			dataCount = dao.dataCount(schType, kwd);
		} 
		// 검색있고 체크도 있을때는 생략

         
         // 전체 페이지 수
         int size = 10;
         int total_page = util.pageCount(dataCount, size);
         if (current_page > total_page) {
            current_page = total_page;
         }

         // 게시물 가져오기
         int offset = (current_page - 1) * size;
         if(offset < 0) offset = 0;
         
         List<MemberDTO> list = null;
         
         if (kwd.length() == 0 && agreeSms == null && agreeEmail == null) {
			list = dao.listMember(offset, size);
		 } else if (kwd.length() == 0 && (agreeSms != null || agreeEmail != null)) {
			list = dao.listMember2(offset, size, agreeSms,agreeEmail);
		 } else {
			list = dao.listMember(offset, size, schType, kwd);
		 }

         String query = "";
         if (kwd.length() != 0) {
            query = "schType=" + schType + "&kwd=" + URLEncoder.encode(kwd, "utf-8");
         }
         
         String q = "";
         if(agreeSms != null ) {
        	 q = "agreeSms=Y";
         }
         
         if(agreeEmail != null ) {
        	 if(q.length() != 0 ) {
        		 q += "&agreeEmail=Y";
        	 } else {
        		 q = "agreeEmail=Y";
        	 }
         }
         
         if(q.length() != 0 ) {
        	 if(query.length() != 0) {
        		 query = query+"&" + q ;
        	 } else {
        		 query= q;
        	 }
         }

         // 페이징 처리
         String listUrl = cp + "/admin/member/list.do";
         String articleUrl = cp + "/admin/member/article.do?page=" + current_page;
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
      forward(req, resp, "/WEB-INF/views/admin/member/memberManage.jsp"); 
   }
   
   
   protected void updateSubmit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {	
		String cp = req.getContextPath();
		MemberDAO dao = new MemberDAO();
		
		Long mNum = Long.parseLong(req.getParameter("mNum"));
		
		try {
			System.out.println(mNum);
			dao.updateMember(mNum);

		} catch (Exception e) {
			e.printStackTrace();
		}
		resp.sendRedirect(cp + "/admin/member/list.do");
	}
   
   
   private void updateListForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	   String cp = req.getContextPath();
	   
	   try {
			
			String[] members = req.getParameterValues("members");
			long nums[] = null;
			nums = new long[members.length];
			for (int i = 0; i < members.length; i++) {
				nums[i] = Long.parseLong(members[i]);
			}

			MemberDAO dao = new MemberDAO();

			// 게시글 삭제
			dao.updateMemberList(nums);

		} catch (Exception e) {
			e.printStackTrace();
		}
		resp.sendRedirect(cp + "/admin/member/list.do?");
	
   }

 
}