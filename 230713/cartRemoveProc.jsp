<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="market.vo.ProductVO, java.util.*"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%

// cartAddProc 참고해서 만들기
// cart에서 remove 하기

	// 세션의 cartList 속성에 pid에 해당하는 상품 삭제 후
		String pid = request.getParameter("pid");  //이렇게하면 잘 넘어옴 확인
		out.println(pid);

		 session.removeAttribute(pid);   // 세션에서는 삭제 됨.
		 out.println( session.getAttribute(pid));
		 
		
		
		
		/*
		
	   List<ProductVO> cartList = (ArrayList<ProductVO>) session.getAttribute("cartList");

		  */
	
		  
		 /*    // cartList가 널이면 새 장바구니 목록을 만들어서 세션에 담기
		         if (cartL){
		            session.removeAttribute(cartPvo.getPid());
		         } */
		     	
		         
	
	// 장바구니로 리다이렉트
	
	// response.sendRedirect("cart.jsp");






%>
