<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="market.vo.ProductVO, java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>prouctInfo.jsp</title>
</head>
<body>
<%@ include file="../includes/header.jsp" %>

<div class="jumbotron">
	<div class="container">
		<h1 class="display-4">
			상품 정보</h1></div></div>

<main role="main">
	<div class="container">
		<div class="row"> 
			<%-- ------------------------------------ --%>
			
		 	<jsp:useBean id="pdao" class="market.dao.productDAO" /> 
		 	<% 
		 		String pid = request.getParameter("pid");
		 		ProductVO pvo = pdao.select(pid);      %>
		 	
			<div class="col-md-4">
				<img src="../resources/images/<%=pvo.getPimage() %>"
					 style="width:100%"></div>
					 
			<div class="col-md-8">
				<h3><%=pvo.getPname() %></h3>
				<p><%=pvo.getDescription() %></p>
				<p><b>상품 코드 : </b>
				   <span class="badge badge-danger"><%=pvo.getPid() %></span></p>
				<p><b>제조사 :   </b><%=pvo.getMaker() %></p>
				<p><b>분류 : </b><%=pvo.getCategory() %></p>
				<p><b>재고 수량 : </b><%=pvo.getStock() %></p>
				<h4><%=pvo.getPrice() %>원</h4>
				
				<form method="post" action="../cart/cartAddProc.jsp">
					<input type="hidden" name="pid" value="<%=pvo.getPid() %>">
					<a href="#" class="btn btn-info cartAddBtn" >
						장바구니 담기 &raquo;</a>
					<a href="../cart/cart.jsp" class="btn btn-warning">
						장바구니 보기 &raquo;</a>
					<a href="productList.jsp" class="btn btn-secondary">
						상품 목록 &raquo;</a>
				</form>	
			</div>
			<%-- ------------------------------------ --%>
		</div></div></main>

<%@ include file="../includes/footer.jsp" %>
<script>

$('.cartAddBtn').click(function () {
	if(confirm('상품을 장바구니에 추가하시겠습니까?')){
		$('form').submit();
		// pid를 주소창에 표시하지 않고보낸다.
		// 그리고 상품 목록으로 간다.
	}
});
	
	


</script>	
</body>
</html>
