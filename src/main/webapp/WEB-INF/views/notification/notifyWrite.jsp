<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@include file="../include/header.jsp" %>
<div class="row wrapper border-bottom white-bg page-heading">
    <div class="col-lg-10">
        <h1>
  			<b>공지사항 쓰기</b>
 	 	</h1>
        <ol class="breadcrumb">
	    <li><a href="home?email=${user.email}"><i class="fa fa-bell-o"></i>List</a></li>
	    <li class="active">공지사항 쓰기</li>
     </ol>
    </div>
</div>
<c:forEach items="${list}" var="user">
	<input type="text" class="hidden userListEmail" value="${user.email}">
	<input type="text" class="hidden userListSlack" value="${user.slackID}">
</c:forEach>
<div class="col-lg-12">
    <div class="wrapper wrapper-content animated fadeInRight">
    	<div class="ibox">
    		<div class="ibox-content">
    			<form class="form-horizontal ng-pristine ng-valid" id="notifyForm" method="post" action="/notifyRegist?email=${user.email}" enctype="multipart/form-data">
    				<div class="form-group">
			 			<label class="col-sm-2 control-label">제목</label>
			 			<div class="col-sm-10">
			 				<input type="hidden" class="form-control" name="writeUser" value="${user.email}">
			 				<input type="hidden" class="form-control" name="nDate" id="nDate">
			 				<input type="text" class="form-control" name="nTitle">
			 			</div>
			 		</div>
			 		<div class="form-group">
			 			<label class="col-sm-2 control-label">내용</label>
			 			<div class="col-sm-10">
			 				<textarea id="notifyText" class="summernote"></textarea>
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
			 			<a class="btn btn-white" id="notifycationCancel">취소</a>
			 			<button type="button" id="notifyBtn" class="btn btn-primary">저장</button>
			 		</div>
    			</form>
    		</div>
    	</div>
    </div>
</div>
<%@include file="../include/footer.jsp" %>