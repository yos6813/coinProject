<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@include file="../include/header.jsp" %>
<div class="row wrapper border-bottom white-bg page-heading">
    <div class="col-lg-10">
        <h1>
  			<b>공지사항 수정</b>
 	 	</h1>
        <ol class="breadcrumb">
	    <li><a href="/notifyList?email=${user.email}"><i class="fa fa-bell-o"></i>List</a></li>
	    <li class="active">공지사항 수정</li>
     </ol>
    </div>
</div>
<div class="col-lg-12">
    <div class="wrapper wrapper-content animated fadeInRight">
    	<div class="ibox">
    		<div class="ibox-content">
    			<form class="form-horizontal ng-pristine ng-valid" method="post" action="notifyModify?email=${user.email}&nNo=${notify.nNo}" enctype="multipart/form-data">
    				<div class="form-group">
			 			<label class="col-sm-2 control-label">제목</label>
			 			<div class="col-sm-10">
			 				<input type="text" class="form-control" name="nTitle" value="${notify.nTitle}">
			 			</div>
			 		</div>
			 		<div class="form-group">
			 			<label class="col-sm-2 control-label">내용</label>
			 			<div class="col-sm-10">
			 				<textarea id="notifyText" class="summernote">${notify.nText}</textarea>
			 				<input type="hidden" name="nText" id="nText">
			 			</div>
			 		</div>
			 		<div class="form-group">
			 			<label class="col-sm-2 control-label">파일</label>
			 			<div class="col-sm-10">
			 				<input type="file" multiple="multiple" name="nFile">
			 			</div>
			 		</div>
			 		<div class="text-right">
			 			<a class="btn btn-white">취소</a>
			 			<button type=submit class="btn btn-primary">저장</button>
			 		</div>
    			</form>
    		</div>
    	</div>
    </div>
</div>
<%@include file="../include/footer.jsp" %>