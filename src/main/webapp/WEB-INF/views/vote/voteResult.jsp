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
		    <li><a href="notifyList?email=${user.email}"><i class="fa fa-home"></i> Home</a></li>
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
                        <h5>${vote.username}</h5>
                    </div>
                    <div class="text-center article-title">
                    <span class="text-muted"><i class="fa fa-clock-o"></i>${vote.vDate}</span>
                        <h1>
                            ${vote.vTitle}
                        </h1>
                    </div>
                    <p>
                    	${vote.vText}
                    </p>
                     <hr>
				     <div class="row">
			        	<c:forEach items="${list}" var="vote">
					        <div class="col-md-3">
				        		<a href="resources/img/${vote.fileName}"><img src="resources/img/${vote.fileName}" alt="no-image" onerror="this.src='resources/img/237033-file_document__text_word-512.png'" class="img-size"></a><br>
				        		<small>${vote.iText}</small>
					        </div>
			        	</c:forEach>
				    </div>
				    <hr>
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