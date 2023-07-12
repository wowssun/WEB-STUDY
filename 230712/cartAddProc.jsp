<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="market.vo.ProductVO, java.util.*"%>
    
  <jsp:useBean id="pdao" class="market.dao.productDAO" /> 
  
  
  <%
  // import 다오, vo, util
   // cartAddProc.jsp 
  	
   // 요청객체에서 pid를 꺼내서
   String pid = request.getParameter("pid");
  
  // dao에 pid를 보낸 값을 호출해서 pvo에 저장
   ProductVO pvo = pdao.select(pid);
   
   // pid가 없으면 상품목록으로 리다이렉트
   if (pid == null) {
      response.sendRedirect("../product/productList.jsp");
      return;
   }

   //(db)product 테이블에 pid에 해당하는 상품 정보 하나 가져오기 (vo 가져오기)
  
   // 해당 상품이 없으면 오류 페이지로 보내기 ------(보류)
  
   int cnt = 0;
   // 세션에서 장바구니 목록( cartList 속성)을 꺼내기
   List<ProductVO> cartList = (ArrayList<ProductVO>) session.getAttribute("cartList");
  
   // cartList가 널이면 새 장바구니 목록을 만들어서 세션에 담기
   if (cartList == null){
      cartList = new ArrayList<ProductVO>();
      session.setAttribute("cartList", cartList);
   } else { // 그렇지 않으면 
      for (ProductVO cartPvo : cartList) {
         if (cartPvo.getPid().equals(pid)){
            cartPvo.setQuantity(cartPvo.getQuantity() + 1); // 원래를 가져와서 +1
            cnt++;	  
         }
      }
   }
  
   // 장바구니 목록의 상품과 pid가 같다면 속성 1 증가
   // cnt++;
  
   // cnt가 0이면
   if (cnt == 0) {
      pvo.setQuantity(1);
      cartList.add(pvo);
   }
  
   // 상품 정보 페이지로 리다이렉트
   response.sendRedirect("../product/productInfo.jsp?pid=" + pid);
 
  
  
%>


