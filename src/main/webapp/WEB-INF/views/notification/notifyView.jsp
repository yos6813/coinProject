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
	    <li><a href="/notifyList?email=${user.email}"><i class="fa fa-home"></i>List</a></li>
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
                        <h5 class="text-muted">${notify.username}</h5>
                    </div>
                    <div class="text-center article-title">
                    <span class="text-muted"><i class="fa fa-calendar-o"></i> ${notify.nDate}</span>
                        <h1>
                            ${notify.nTitle}
                        </h1>
                    </div>
                    <p>
                    	${notify.nText}
                    </p>
                    <div class="mail-attachment">
                        <p>
                            <span><i class="fa fa-paperclip"></i> ${list2.size()} attachments - </span>
                        </p>
                        <div class="attachment">
                        	<c:forEach items="${list2}" var="notify">
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
                        	</c:forEach>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                    <hr>
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="small text-right">
                                <div> <i class="fa fa-comments-o"> </i> ${list.size()} comments </div>
                            </div>
                        </div>
                    </div>
                    <div class="row ibox1">
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
                    <div class="row">
                        <div class="col-lg-12">
                        	<c:forEach items="${list}" var="notify">
	                            <div class="social-feed-box">
	                                <div class="social-avatar">
	                                    <a href="" class="pull-left">
	                                        <img alt="image" src="${notify.photoURL}">
	                                    </a>
	                                    <div class="media-body">
                                            <h4>${notify.username}</h4>
	                                        <small class="text-muted">${notify.coDate}</small>
	                                    </div>
	                                </div>
	                                <div class="social-body">
	                                    <p>
	                                        ${notify.coText}
	                                    </p>
	                                </div>
	                            </div>
                        	</c:forEach>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="../include/footer.jsp" %>