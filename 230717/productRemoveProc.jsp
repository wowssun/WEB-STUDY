<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="market.vo.ProductVO, java.util.*"%>
          
       
	<jsp:useBean id="pdao" class="market.dao.productDAO" /> 
	      
<%
// productRemoveProc.jsp-------

//confirm 하고 
// 리무브를 하려면 pid값이 필요하다 그럼 여기로 오기전에 pid를 보내야 하는데 어떻게 보낼까
// 삭제버튼을 누르면 여기로 오면서 그 해당상품의 pid를 가져온다.
// 그럼 confirm은 어떻게 해야되냐!!!


		String pid = request.getParameter("pid");	
			out.println(pid);

			  if(pdao.delete(pid)){	
				   response.sendRedirect("productEdit.jsp?edit=remove");     
			 	}

%>
