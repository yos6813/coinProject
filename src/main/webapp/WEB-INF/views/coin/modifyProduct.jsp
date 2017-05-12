<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@include file="../include/header.jsp" %>
<div class="row wrapper border-bottom white-bg page-heading">
     <div class="col-lg-10">
         <h1>
   			<b>상품수정</b>
	 	 </h1>
         <ol class="breadcrumb">
		    <li><a href="/home?email=${user.email}"><i class="fa fa-home"></i> Home</a></li>
		    <li><a href="/coinmall?email=${user.email}"><i class="fa fa-krw"></i> coin Mall</a></li>
		    <li class="active">상품수정</li>
	     </ol>
     </div>
 </div>
 <div class="col-lg-12" style="height:100%">
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="ibox">
			<div class="ibox-content">
				<form class="form-horizontal ng-pristine ng-valid" action="/productUpdate?email=${param.email}&id=${coin.id}" method="post">
					<div class="form-group">
						<label class="col-sm-2 control-label">상품이름</label>
						<div class="col-sm-10">
							<input class="form-control" type="text" name="name" value="${coin.name}">
						</div>
		 			</div>
		 			<div class="form-group">
						<label class="col-sm-2 control-label">상품설명</label>
						<div class="col-sm-10">
							<textarea class="form-control" id="productText" name="text">${coin.text}</textarea>
						</div>
		 			</div>
		 			<div class="form-group">
						<label class="col-sm-2 control-label">가격</label>
						<div class="col-sm-10">
							<input class="form-control" type="text" name="price" value="${coin.price}">
						</div>
		 			</div>
		 			<div class="text-right">
		 				<button type="submit" class="btn btn-success">수정</button>
		 				<a class="btn btn-warning" id="cancelModify">취소</a>
		 			</div>
				</form>
			</div>
		</div>
	</div>
</div>
 <%@include file="../include/footer.jsp" %>