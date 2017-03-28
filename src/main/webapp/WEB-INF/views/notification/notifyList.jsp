<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@include file="../include/header.jsp" %>
<div class="row wrapper border-bottom white-bg page-heading">
    <div class="col-lg-10">
        <h1>
  			<b>공지사항</b>
 	 	</h1>
        <ol class="breadcrumb">
        <li><a href="home?email=${user.email}"><i class="fa fa-home"></i>Home</a></li>
	    <li class="active">공지사항</li>
     </ol>
    </div>
</div>
<div class="col-lg-12 marginTopnBottom">
	<div class="col-md-11 no-padding">
		<div class="input-group">
			<input class="input form-control" type="text" id="titleInput">
			<span class="input-group-btn">
		 		<a id="searchTitle" class="btn btn-white">검색</a>
			</span>
		</div>
	</div>
	<div class="col-md-1">
		<a class="btn btn-white" href="notifyWrite?email=${user.email}">글작성</a>
	</div>
</div>
<div class="col-lg-12" id="notifyList1">
    <div class="wrapper wrapper-content animated fadeInRight ibox1">
	    <c:forEach items="${list}" var="notify">
	        <div class="vote-item notifyList2">
	            <div class="row">
	                <div class="col-md-10">
	                    <div class="vote-actions ibox3">
	                        <div>${notify.nNo}</div>
	                    </div>
	                    <a href="notifyView?email=${user.email}&nNo=${notify.nNo}" class="vote-title">
	                        ${notify.nTitle}
	                    </a>
	                    <div class="vote-info">
	                        <a>댓글: ${notify.countComment}</a>
	                    </div>
	                </div>
	                <div class="col-md-2 text-right">
			            <h3 class="text-info notifyListMargin">${notify.nDate}</h3>
			            <small class="text-gray">
			            	작성자: ${notify.username}
			            </small>
			        </div>
	            </div>
	        </div>
	    </c:forEach>
 	</div>
</div>
<div class="col-lg-12 text-center">
	<button class="btn btn-white col-md-12" id="tenMore">10개 더보기</button>
</div>
<%@include file="../include/footer.jsp" %>