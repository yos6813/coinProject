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
	    <li class="active">공지사항</li>
     </ol>
    </div>
</div>
<div class="col-lg-12 text-right">
	<a class="btn btn-white" href="notifyWrite?email=${user.email}">글쓰기</a>
</div>
<div class="col-lg-12">
    <div class="wrapper wrapper-content animated fadeInRight ibox1">
	    <c:forEach items="${list}" var="notify">
	        <div class="vote-item">
	            <div class="row">
	                <div class="col-md-12">
	                    <div class="vote-actions ibox3">
	                        <div>${notify.nNo}</div>
	                    </div>
	                    <a href="notifyView?email=${user.email}&nNo=${notify.nNo}" class="vote-title">
	                        ${notify.nTitle}
	                    </a>
	                    <div class="vote-info">
	                        <i class="fa fa-comments-o"></i><a>Comments (${notify.countComment})</a>
	                        <i class="fa fa-clock-o"></i><a>${notify.nDate}</a>
	                        <i class="fa fa-user"></i><a>${notify.username}</a>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </c:forEach>
 	</div>
</div>
<%@include file="../include/footer.jsp" %>