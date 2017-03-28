<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@include file="../include/header.jsp" %>
<div class="row wrapper border-bottom white-bg page-heading">
     <div class="col-lg-10">
         <h1>
   			<b>상세보기</b>
	 	 </h1>
         <ol class="breadcrumb">
		    <li><a href="home?email=${user.email}"><i class="fa fa-home"></i> Home</a></li>
		    <li><a href="voteList?email=${user.email}"><i class="fa fa-bar-chart-o"></i> Vote List</a></li>
		    <li class="active">상세보기</li>
	     </ol>
     </div>
</div>
<div class="wrapper wrapper-content  animated fadeInRight article">
    <div class="row">
        <div class="col-lg-10 col-lg-offset-1">
            <div class="ibox">
                <div class="ibox-content">
                    <div class="pull-right">
                    	<c:set var="username" value="${vote.vUser}"/>
	                	<c:set var="email" value="${param.email}"/>
	                	<c:if test="${username eq email}">
		                	<div>
		                		<a class="btn btn-white btn-xs">수정</a>
		                		<a class="btn btn-white btn-xs">삭제</a>
		                		<form method="post" id="voteForm"><input type="hidden" name="vNo" value="${vote.vNo}"></form>
		                	</div>
	                	</c:if>
                    </div>
                    <div class="text-center article-title">
                    <span class="text-muted">${vote.vDate}</span>
                        <h2>
                            ${vote.vTitle}
                        </h2>
                    <small class="text-muted">작성자: ${vote.username}</small>
                    </div>
                    <p>
                    	${vote.vText}
                    </p>
                    <hr>
				     <div class="row">
			        	<c:forEach items="${list}" var="vote">
					        <div class="col-md-12 ibox1 borderBox123" value="${vote.iNo}">
					        	<div class="col-md-3"><h3 class="index" style="margin-top: 10px;"></h3></div>
				        		<h3 class="textIndex" style="margin-top: 10px;">${vote.iText}</h3>
					        </div>
			        	</c:forEach>
				    </div>
				    <div class="row">
				    	<div class="text-right">
				    		<a class="btn btn-success" id="voteSubmit">제출</a>
				    	</div>
				    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="../include/footer.jsp" %>