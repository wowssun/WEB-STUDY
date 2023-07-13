<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>cart.jsp</title>
<style>
td:not(:first-child) { text-align: center;}
</style>
</head>
<body>
<%@ include file="../includes/header.jsp" %>

<div class="jumbotron">
	<div class="container">
		<h1 class="display-4">
			장바구니</h1></div></div>

<main role="main">
	<div class="container">
		<!-- 장바구니가 비어 있는 경우 -->
		<c:if test="${cartList == null}">
			<div class="row">
				<div class="col" align="center"> 
					<p class="alert alert-danger p-5">
						장바구니에 담긴 상품이 없습니다.</p>
				</div>
			</div>
		</c:if>
		<!-- 그렇지 않은 경우 -->
		<c:if test="${cartList != null}">
			<div class="row">
				<div class="col-8"> 
					<a href="cartClearProc.jsp" class="btn btn-danger">
						장바구니 비우기</a>
				</div>
				<div class="col-4 text-right"> 
					<a href="deliveryInfo.jsp" class="btn btn-success">
						주문하기</a>
				</div>
			</div>
			<div style="padding-top: 50px">
				<table class="table table-hover">
					<thead>
						<tr>
							<th>상품</th>
							<th class="text-center">수량</th>
							<th class="text-center">가격</th>
							<th class="text-center">소계</th>
							<th class="text-center">비고</th>
						</tr>
					</thead>
						<tbody>
						<c:set var="total" value="0"/>
						<c:forEach items="${cartList}" var="cartPvo">
						<c:set var="sum" value="${cartPvo.quantity * cartPvo.price}"/>
							${total = total + sum;''}
							<tr>
								<td>${cartPvo.pid} - ${cartPvo.pname}</td>
								<td><fmt:formatNumber value="${cartPvo.quantity}"/></td>
								<td><fmt:formatNumber value="${cartPvo.price}"/></td>
								<td><fmt:formatNumber value="${sum}"/></td>
								<td><a href="cartRemoveProc.jsp?pid=${cartPvo.pid }" class="badge badge-danger">삭제</a></td>
							</tr>
						</c:forEach>
						</tbody>	
						<tfoot>				
							<tr>
								<th></th>
								<th></th>
								<th class="text-center">총액</th>
								<th class="text-center"><fmt:formatNumber value="${total}"/>원</th>
								<th></th>
							</tr>
						</tfoot>
					
				</table>
			</div>
		</c:if>
		<!-- 쇼핑 계속하기 -->
		<div class="row">
			<div class="col-8"> 
				<a href="../product/productList.jsp" class="btn btn-secondary">
					쇼핑 계속하기</a>
			</div>
		</div>
	</div>
</main>

<%@ include file="../includes/footer.jsp" %>
	
</body>
</html>


