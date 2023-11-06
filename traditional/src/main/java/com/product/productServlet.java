package com.product;

import java.io.IOException;
import java.sql.SQLException;
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

@WebServlet("/product/*")
public class productServlet extends MyServlet{

	private static final long serialVersionUID = 1L;

	@Override
	protected void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		
		String uri = req.getRequestURI();
		
		if (uri.indexOf("product.do") != -1) {
	        if ("price_high".equals(req.getParameter("sortOption"))) {
	            listProductsByPriceHigh(req, resp);
	        } else if ("price_low".equals(req.getParameter("sortOption"))) {
	            listProductsByPriceLow(req, resp);
	        } else {
	            list(req, resp);
	        }
	    } else if(uri.indexOf("productdetail.do") != -1) {
	    	productdetail(req, resp);
	    } else if(uri.indexOf("order.do") != -1) {
	    	order(req, resp);
	    } else if(uri.indexOf("orderok.do") != -1) {
	    	orderok(req, resp);
	    }
		
	}
	
	protected void list(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 게시물 리스트
		productDAO dao = new productDAO();
		
		List<productDTO> productList = dao.listproduct();
		req.setAttribute("productList", productList);
		
		int dataCount = dao.dataCount();
		req.setAttribute("dataCount", dataCount);
		
		int dataCountreview = dao.dataCountreview();
		req.setAttribute("dataCountreview", dataCountreview);

		// JSP로 포워딩
		forward(req, resp, "/WEB-INF/views/product/product.jsp");
	}
	
	protected void listProductsByPriceHigh(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	    productDAO dao = new productDAO();
	    List<productDTO> productList = dao.listProductsByPriceHigh();
	    req.setAttribute("productList", productList);
	    
	    int dataCount = dao.dataCount();
		req.setAttribute("dataCount", dataCount);

	    // JSP로 포워딩
	    forward(req, resp, "/WEB-INF/views/product/product.jsp");
	}
	
	protected void listProductsByPriceLow(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	    productDAO dao = new productDAO();
	    List<productDTO> productList = dao.listProductsByPriceLow();
	    req.setAttribute("productList", productList);
	    
	    int dataCount = dao.dataCount();
		req.setAttribute("dataCount", dataCount);

	    // JSP로 포워딩
	    forward(req, resp, "/WEB-INF/views/product/product.jsp");
	}
	
	protected void productdetail(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	    String productCode = req.getParameter("productCode");
	    
	    if (productCode != null && !productCode.isEmpty()) {
	        productDAO dao = new productDAO();

	        productDTO product = dao.productdetail(productCode);
	        
	        if (product != null) {
	            req.setAttribute("product", product);
	            
	            forward(req, resp, "/WEB-INF/views/product/productdetail.jsp");
	        } else {
	        }
	    } else {
	    }
	}
	
	protected void order(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	    HttpSession session = req.getSession();
	    MemberDAO dao = new MemberDAO();
	    productDAO pdao = new productDAO();

	    SessionInfo memberInfo = (SessionInfo) session.getAttribute("member");
	    int mnum = memberInfo.getMnum();
	    
	    int orderNum = pdao.orderNumber();
	    
	    MemberDTO dto1 = dao.mypage(mnum);
	    req.setAttribute("memberDTO", dto1);

	    // total, productCode, quantity를 request에 설정
	    String total = req.getParameter("total");
	    String productCode = req.getParameter("productCode");
	    String quantity = req.getParameter("quantity");
	    String productPrice = req.getParameter("productPrice");
	    
	    productDTO pdto = pdao.productdetail(productCode);
	    
	    
	    req.setAttribute("orderNum", orderNum);
	    req.setAttribute("total", total);
	    req.setAttribute("productCode", productCode);
	    req.setAttribute("quantity", quantity);
	    req.setAttribute("productPrice", productPrice);
	    
	    req.setAttribute("pdto", pdto);
	    req.setAttribute("orderNum", orderNum);	    
	    
	    forward(req, resp, "/WEB-INF/views/product/order.jsp");
	}
	
	protected void orderok(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	    HttpSession session = req.getSession();

	    SessionInfo memberInfo = (SessionInfo) session.getAttribute("member");
	    int mnum = memberInfo.getMnum();

	    // total, productCode, quantity를 request에서 가져옵니다.
	    int orderNum = Integer.parseInt(req.getParameter("orderNum"));
	    String total = req.getParameter("total");
	    String productCode = req.getParameter("productCode");
	    String quantity = req.getParameter("quantity");
	    String productPrice = req.getParameter("productPrice");
	    String ordername = req.getParameter("name");
	    String addressnum = req.getParameter("zip");
	    String addr1 = req.getParameter("addr1");
        String addr2 = req.getParameter("addr2");
       
	    String tel1 = req.getParameter("tel1");
        String tel2 = req.getParameter("tel2");
        String tel3 = req.getParameter("tel3");
        String tel = tel1 + "-" + tel2 + "-" + tel3;
        String orderRequire = req.getParameter("baesong");
	    
	    // 위의 정보를 이용하여 productDTO 객체를 생성합니다.
	    productDTO dto = new productDTO();
	    dto.setOrderNum(orderNum);
	    dto.setOrderprice(Integer.parseInt(total));
	    dto.setTotalprice(Integer.parseInt(total));
	    dto.setOrderRequire(orderRequire); // 필요에 따라 변경하세요.
	    dto.setOrdername(ordername);
	    dto.setOrderphone(tel); // 회원 전화번호로 변경하세요.
	    dto.setAddressnum(Integer.parseInt(addressnum)); // 배송지 우편번호로 변경하세요.
	    dto.setAddress1(addr1); // 배송지 주소 1로 변경하세요.
	    dto.setAddress2(addr2); // 배송지 주소 2로 변경하세요.
	    dto.setMnum(mnum);

	    dto.setOrderCount(Integer.parseInt(quantity));
	    dto.setPricePerProduct(Integer.parseInt(productPrice));
	    dto.setProductCode(productCode);
	    

	    try {
	        // productDAO의 insertproduct 메서드를 호출하여 데이터를 추가합니다.
	        productDAO productDao = new productDAO();
	        productDao.insertproduct(dto);
	        
	        MemberDAO dao2 = new MemberDAO();
			MemberDTO dto1 = dao2.mypage(mnum);
		    
		    req.setAttribute("memberDTO", dto1);
	        // 성공한 경우, 성공 메시지를 설정하고 orderok.jsp로 포워딩합니다.
	        req.setAttribute("message", "주문이 성공적으로 처리되었습니다.");
	        forward(req, resp, "/WEB-INF/views/member/mypage.jsp");
	    } catch (SQLException e) {
	        e.printStackTrace();
	        // 실패한 경우, 실패 메시지를 설정하고 다시 주문 페이지로 돌아갑니다.
	        req.setAttribute("error", "주문 처리 중 오류가 발생했습니다.");
	        forward(req, resp, "/WEB-INF/views/product/order.jsp");
	    }
	}


}
