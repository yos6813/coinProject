<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@include file="../include/header.jsp" %>
<div class="row wrapper border-bottom white-bg page-heading">
    <div class="col-lg-10">
        <h1>
  			<b>공지사항 보기</b>
 	 	</h1>
        <ol class="breadcrumb">
	    <li><a href="home?email=${user.email}"><i class="fa fa-home"></i>List</a></li>
	    <li class="active">공지사항 보기</li>
     </ol>
    </div>
</div>
<div class="wrapper wrapper-content  animated fadeInRight article">
    <div class="row">
        <div class="col-lg-10 col-lg-offset-1">
            <div class="ibox">
                <div class="ibox-content">
                	<div class="pull-right">
	                	<c:set var="username" value="${notify.writeUser}"/>
	                	<c:set var="email" value="${param.email}"/>
	                	<c:if test="${username eq email}">
		                	<div>
		                		<a class="btn btn-white btn-xs" href="notifyMod?email=${user.email}&nNo=${notify.nNo}">수정</a>
		                		<a class="btn btn-white btn-xs" onclick="deleteNotify(${notify.nNo})">삭제</a>
		                		<form method="post" id="notifyForm"><input type="hidden" name="nNo" value="${notify.nNo}"></form>
		                	</div>
	                	</c:if>
                    </div>
                    <div class="text-center article-title">
                    <span class="text-muted"><i class="fa fa-calendar-o"></i> ${notify.nDate}</span>
                        <h1>
                            ${notify.nTitle}
                        </h1>
                        <small class="text-muted">${notify.username}</small>
                    </div>
                    <p>
                    	${notify.nText}
                    </p>
                    <div class="mail-attachment">
                        <div class="attachment">
                        	<c:forEach items="${list2}" var="notify">
                        		<c:set var="num" value="${notify.fileNumber}"/>
	                        	<c:if test="${num > 0}">
		                            <div class="file-box">
		                                <div class="file">
		                                    <a href="#">
		                                        <span class="corner"></span>
		                                        <div class="icon">
	                                            	<i class="fa fa-file"></i>
	                                        	</div>
		                                        <div class="file-name">
		                                            ${notify.nFileName}
		                                            <br/>
		                                            <small>${notify.nDate}</small>
		                                        </div>
		                                    </a>
		                                </div>
		                            </div>
	                        	</c:if>
                        	</c:forEach>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                    <hr>
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="small">
                                <div> <i class="fa fa-comments-o"> </i> 댓글: ${list.size()}개 </div>
                            </div>
                        </div>
                    </div>
                    <div class="row ibox1">
                        <div class="col-lg-12">
                        	<c:forEach items="${list}" var="notify">
	                            <div class="social-feed-box">
	                                <div class="social-avatar col-md-12">
	                                    <a href="" class="pull-left">
	                                        <img alt="image" src="${notify.photoURL}">
	                                    </a>
	                                    <div class="col-md-6">
                                            <h4 class="ibox3">${notify.username}</h4>
	                                        <small class="text-muted">${notify.coDate}</small>
	                                    </div>
	                                    <div class="col-md-5 text-right">
	                                    	<c:set var="username" value="${notify.coUser}"/>
						                	<c:set var="email" value="${param.email}"/>
						                	<c:if test="${username eq email}">
						                		<a class="btn btn-white btn-xs modifyBtn" value="${notify.nNo}">수정</a>
						                		<a class="btn btn-white btn-xs deleteBtn" onclick="deleteComments(${notify.nNo})">삭제</a>
						                		<form method="post" id="nCommentForm"><input type="hidden" name="coNo" value="${notify.coNo}"></form>
						                	</c:if>
	                                    </div>
	                                </div>
	                                <div class="social-body">
	                                    <p class="commentText">
	                                        ${notify.coText}
	                                    </p>
	                                    <form class="form-horizontal ng-pristine ng-valid" method="post" action="modifyComments?email=${user.email}&nNo=${notify.nNo}">
		                                    <div class="input-group commentInput" style="padding:3px;">
		                                    	<input type="hidden" value="${notify.coNo}" name="coNo">
			                                    <input class="input form-control" type="text" name="coText" value="${notify.coText}">
			                                    <span class="input-group-btn">
						                        	<button type="submit" class="btn btn-white">저장</button>
					                        	</span>
				                        	</div>
			                        	</form>
	                                </div>
	                            </div>
                        	</c:forEach>
                        </div>
                    </div>
                    <div class="row">
                       	<form class="form-horizontal ng-pristine ng-valid" method="post" action="commentWrite?email=${user.email}&nNo=${notify.nNo}">
	                       	<div class="col-lg-12">
		                        <div class="input-group">
		                        	<input class="input form-control" type="text" name="coText">
		                        	<input type="hidden" id="coDate" name="coDate">
		                        	<span class="input-group-btn">
			                        	<button type="submit" class="btn btn-white">저장</button>
		                        	</span>
		                        </div>
	                       	</div>
                       	</form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="../include/footer.jsp" %>