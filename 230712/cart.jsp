<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="market.vo.ProductVO, java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>cart.jsp</title>
<style>

.nocart { border: 1px solid lightpink; background: #FADBD8; color: #641E16; margin: 50px; padding: 20px 30px; 
		 line-height: 100px; text-align: center; display: none; }

.btn { margin: 10px 30px;}

.table { margin: 50px; }
</style>
</head>
<body>

<jsp:useBean id="pdao" class="market.dao.productDAO" /> 
<!--세션에서 cartList 세션 확인 하고 
	// 있으면 들어있는 값 꺼내고
	// 없으면 없습니다. 알림창 나오고 화면과 같이 구성  -->

	<%@ include file="../includes/header.jsp" %>​

	<div class="jumbotron">
		<div class="container">
			<h1 class="display-4">장바구니</h1>
		</div>
	</div>
	<button type="button" class="btn btn-success">장바구니 비우기</button>
	<button type="button" class="btn btn-danger">주문하기</button>
	
	<table class="table">
  <thead>
    <tr>
      <th scope="col">상품</th>
      <th scope="col">수량</th>
      <th scope="col">가격</th>
      <th scope="col">소계</th>
      <th scope="col">비고</th>
    </tr>
  </thead>
  <tbody>
    <tr> 
      <td>P1234 - iPhone 6s</td>
      <td>1</td>
      <td>800000</td>
      <td>800000</td>    
      <td><span class="badge badge-danger">삭제</span></td>
    </tr>
    <tr> 
      <td>P1235 - LG PC gram</td>
      <td>1</td>
      <td>1500000</td>
      <td>1500000</td>
      <td><span class="badge badge-danger">삭제</span></td>
    </tr>
 
  </tbody>
</table>
	
	
	
	
	
	
	<div class="nocart">장바구니에 담긴 상품이 없습니다.</div>
	
	<div class="col-md-8">
		<a href="productList.jsp" class="btn btn-secondary">
					쇼핑 계속하기</a>
	</div>

	<%@ include file="../includes/footer.jsp" %>
</body>
</html>
