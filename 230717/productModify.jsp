<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>productModify.jsp</title>
</head>
<body>


<%@ include file="../includes/header.jsp" %>

<fmt:setLocale value="${param.Language }"/>
<fmt:bundle basename="market.bundle.message">

<div class="jumbotron">
	<div class="container">
		<h1 class="display-4">
			<fmt:message key="title"/></h1></div></div>

<main role="main">
	<div class="container">
		<div class="text-right"><!--언어 선택  -->
			<a href="?Language=ko">한국어</a> | 
			<a href="?Language=en">English</a> 
			<a href="javascript:logout()" class="btn btn-sm btn-success">logout</a>
		 </div>
		
		<form action="productAddProc.jsp" method="post"
			  class="form-horizontal" enctype="multipart/form-data">
			<div class="form-group row"> 
				<label class="col-sm-2"><fmt:message key="pid"/></label>
				<div class="col-sm-3">
					<input type="text" class="form-control" name="pid" id="pid">
				</div></div>
		
			<div class="form-group row"> 
				<label class="col-sm-2"><fmt:message key="pname"/></label>
				<div class="col-sm-3">
					<input type="text" class="form-control" name="pname" id="pname">
				</div></div>
		
			<div class="form-group row"> 
				<label class="col-sm-2"><fmt:message key="price"/></label>
				<div class="col-sm-3">
					<input type="number" class="form-control"
						   value="0" min="0" step="1000" name="price" id="price">
				</div></div>
		
			<div class="form-group row"> 
				<label class="col-sm-2"><fmt:message key="description"/></label>
				<div class="col-sm-5">
					<textarea class="form-control" 
							  cols="50" rows="2" name="description" id="description"></textarea>
				</div></div>
		
			<div class="form-group row"> 
				<label class="col-sm-2"><fmt:message key="maker"/></label>
				<div class="col-sm-3">
					<input type="text" class="form-control" name="maker" id="maker">
				</div></div>
		
			<div class="form-group row"> 
				<label class="col-sm-2"><fmt:message key="category"/></label>
				<div class="col-sm-3">
					<select class="form-control" name="category" id="category">
						<option><fmt:message key="category_notebook"/>
						<option><fmt:message key="category_smaPhone"/>
						<option><fmt:message key="category_tablt"/>
					</select>
				</div></div>
		
			<div class="form-group row"> 
				<label class="col-sm-2"><fmt:message key="stock"/></label>
				<div class="col-sm-3">
					<input type="number" class="form-control"
						   value="0" min="0" name="stock" id="stock">
				</div></div>
		
			<div class="form-group row"> 
				<label class="col-sm-2"><fmt:message key="condition"/></label>
				<div class="col-sm-5">
					<label><input type="radio" value="new" name="condition" id="condition"><fmt:message key="condition_new"/> </label>
					<label><input type="radio" value="old" name="condition" id="condition"><fmt:message key="condition_old"/> </label>
					<label><input type="radio" value="refurb" name="condition"  id="condition"><fmt:message key="condition_ref"/></label>
				</div></div>
		
			<div class="form-group row"> 
				<label class="col-sm-2"><fmt:message key="pimage"/></label>
				<div class="col-sm-5">
					<input type="file" class="form-control" name="pimage" id="pimage">
				</div></div>
		
			<div class="form-group row"> 
				<div class="col-sm-offset-2 col-sm-10">
					<input type="button" class="btn btn-info" onclick="checkProduct()" 
						   value="<fmt:message key="modiBtn"/>">
					<input type="button" class="btn btn-secondary"
						   value="<fmt:message key="cancelBtn"/>">
				</div></div>
		</form></div></main>
		</fmt:bundle>

<%@ include file="../includes/\footer.jsp" %>

</body>
</html>
