package com.product;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
	    }
		
	}
	
	protected void list(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 게시물 리스트
		productDAO dao = new productDAO();
		
		List<productDTO> productList = dao.listproduct();
		req.setAttribute("productList", productList);
		
		int dataCount = dao.dataCount();
		req.setAttribute("dataCount", dataCount);

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

}
