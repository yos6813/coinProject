<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@include file="../include/header.jsp" %>
<div class="row wrapper border-bottom white-bg page-heading">
    <div class="col-lg-10">
        <h1>
  			<b>글쓰기</b>
 	 	</h1>
        <ol class="breadcrumb">
        <li><a href="home?email=${user.email}"><i class="fa fa-home"></i> Home</a></li>
        <li><a href="voteList?email=${user.email}"><i class="fa fa-bar-chart-o"></i>Vote List</a></li>
	    <li class="active">글쓰기</li>
     </ol>
    </div>
</div>
<div class="col-lg-12">
    <div class="wrapper wrapper-content animated fadeInRight">
    	<div class="ibox">
    		<div class="ibox-content">
    			<form class="form-horizontal ng-pristine ng-valid" method="post" action="createVote?email=${user.email}" enctype="multipart/form-data">
    				<div class="form-group">
			 			<label class="col-sm-2 control-label">제목</label>
			 			<div class="col-sm-10">
			 				<input type="hidden" class="form-control" name="vUser" value="${user.email}">
			 				<input type="hidden" class="form-control" name="vDate" id="vDate">
			 				<input type="text" class="form-control" name="vTitle">
			 			</div>
			 		</div>
			 		<div class="form-group">
			 			<label class="col-sm-2 control-label">내용</label>
			 			<div class="col-sm-10">
			 				<textarea id="voteText" class="summernote"></textarea>
			 				<input type="hidden" name="vText" id="vText">
			 			</div>
			 		</div>
			 		<div class="form-group">
			 			<label class="col-sm-2 control-label">항목</label>
			 			<div class="col-sm-10">
			 				<input type="text" class="form-control" id="nText" placeholder="항목 추가">
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