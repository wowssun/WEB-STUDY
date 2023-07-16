<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import= "java.util.*"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
    
    <jsp:useBean id="pvo" class="market.vo.ProductVO"/> 
    
    <jsp:useBean id="pdao" class="market.dao.productDAO" />
<%
	// productModifyProc.jsp----------
	
	// 등록할때는 빈 입력창에 값을 입력했지만
	// 수정은 그 값들이 이미 들어있는 상태여야 한다.
    // vlaue
    
    // option에는 selected 
    
    //radio 에는 checked로 표시되어서????
    		
    		

	String savePath = application.getRealPath("/resources/images");

	int maxSize = 1024 * 1024 * 5;    // 최대 업로드 크기 5MB
	// System.out.print(savePath);   이건 RealPath 경로 찍어보는 것. 웹에서는 이 경로에 파일이 들어가야
								// 업로드 할 수 있다.
	
	String encType = "UTF-8";
	
	MultipartRequest multi
			= new MultipartRequest(request,savePath, maxSize, encType, new DefaultFileRenamePolicy());
	
	pvo.setPid(multi.getParameter("pid"));
	pvo.setDescription(multi.getParameter("description"));
	pvo.setPname(multi.getParameter("pname"));
	pvo.setCategory(multi.getParameter("category"));
	pvo.setCondition(multi.getParameter("condition"));
	pvo.setMaker(multi.getParameter("maker"));
	pvo.setPrice(Integer.parseInt(multi.getParameter("price")));   // 숫자는 partInt 하기
	pvo.setStock(Integer.parseInt(multi.getParameter("stock")));
	pvo.setPimage(multi.getFilesystemName("pimage"));
	
	
	if(pdao.update(pvo)){
		response.sendRedirect("productList.jsp");			
	}else{ %>
	 <script>
		alert('상품 수정 실패');
		history.back();				// 이전 페이지로 돌아가기
	</script> 
	
	 <% }%> 
	
	
	
	


