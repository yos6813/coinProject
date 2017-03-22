<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@include file="../include/header.jsp" %>
<div class="row wrapper border-bottom white-bg page-heading">
     <div class="col-lg-10">
         <h1>
   			<b>고객사 등록</b>
	 	 </h1>
         <ol class="breadcrumb">
		    <li><a href="/notifyList?email=${user.email}"><i class="fa fa-home"></i>Home</a></li>
		    <li><a href="/clientList?email=${user.email}"><i class="fa fa-group"></i>고객 관리</a></li>
		    <li class="active">고객사 등록</li>
	     </ol>
     </div>
 </div>
<div class="col-lg-12">
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="ibox">
			<div class="ibox-content">
				<form class="form-horizontal ng-pristine ng-valid" method="post" id="clientForm">
			 		<div class="form-group">
			 			<label class="col-sm-2 control-label">회사명</label>
			 			<div class="col-sm-10">
			 				<input type="text" class="form-control" name="ctName" value="${client.ctName}">
			 			</div>
			 		</div>
			 		<div class="form-group">
			 			<label class="col-sm-2 control-label">주소</label>
			 			<div class="col-sm-10">
			 				<div class="ibox1">
				 				<input type="text" id="clientaddr" name="ctAddr" class="form-control" placeholder="주소"  value="${client.ctAddr}">
			 				</div>
			 				<div class="ibox1 col-md-6">
								<input type="text" id="clientaddr2" name="ctAddr2" class="form-control" placeholder="상세주소"  value="${client.ctAddr2}">
							</div>
							<div class="col-md-3">
								<a onclick="sample6_execDaumPostcode1()" class="btn btn-default">주소검색</a>
							</div>
			 			</div>
			 		</div>
			 		<div class="form-group">
			 			<label class="col-sm-2 control-label">사업자 등록번호</label>
			 			<div class="col-sm-10">
			 				<input type="text" class="form-control" name="ctLicense" value="${client.ctLicense}">
			 			</div>
			 		</div>
			 		<div class="form-group">
			 			<label class="col-sm-2 control-label"></label>
			 			<div class="col-sm-10">
							<a onclick="form_submit(${client.ctNo})" class="btn btn-success">저장</a>
							<a class="btn btn-warning">취소</a>
						</div>
					</div>
			 	</form>
			</div>
		</div>
	</div>
</div>
<%@include file="../include/footer.jsp" %>