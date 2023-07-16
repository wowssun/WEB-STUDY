<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="market.vo.ProductVO, java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>productEdit.jsp</title>
</head>
<body>
		
	<%@ include file="../includes/header.jsp" %>​

	<div class="jumbotron">
		<div class="container">
			<h1 class="display-4">상품 편집</h1>
		</div>
	</div>
​
	<main role="main">
		<div class="container">
			<div class="row" align="center"> 
			
			<jsp:useBean id="pdao" class="market.dao.productDAO" /> 
			<%   					// list<membervo>로 받을거니까 리스트로 형변환
				List<ProductVO> proList = pdao.selectAll();	// out.print(mvoList.size()); list 길이 확인
																		// dao에 매개변수가 없는 셀렉트 메서드 호출
																		// 반환되는 값을 저장한뒤
																		//화면에 표시

		if(proList.size() > 0 && proList != null) {   // 등록된 게시물이 있다면 화면에 표시
				for(ProductVO pvo : proList) {%>
					<div class="col-md-4">
						<img src="../resources/images/<%=pvo.getPimage() %>" style="width: 100%">
						<h3><%=pvo.getPname() %></h3>
						<p><%=pvo.getDescription() %></p>
						<p><%=pvo.getPrice() %></p>
						<c:if test="${param.edit =='modify'}">
							<p><a href="productModifyProc.jsp" class="btn btn-info modifyBtn">수정 &raquo;</a></p>
						</c:if>
						<c:if test="${param.edit =='remove'}">
							<p><a href="javascript:remove('<%=pvo.getPid()%>')" class="btn btn-danger removeBtn">삭제 &raquo;</a></p>
						</c:if>
					</div>								<!--쿼리스트링으로 pid를 보낸다.  -->
				 	
			<% 	}
				
		}else {
				out.println("등록된 상품이 없습니다.");
			}%>
	

			
			</div>
		</div>
	</main>


	<%@ include file="../includes/footer.jsp" %>
	
	
</body>
</html>
