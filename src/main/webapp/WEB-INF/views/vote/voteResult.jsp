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
                    <div class="text-center article-title">
                    <span class="text-muted">${vote.vDate}</span>
                        <h1>
                            ${vote.vTitle}
                        </h1>
                        <small class="text-gray">작성자: ${vote.username}</small>
                    </div>
                    <p>
                    	${vote.vText}
                    </p>
                     <hr>
                     <h4>결과:</h4>
				    <div class="row">
						<div class="col-md-12">
							<c:forEach items="${list}" var="vote">
								<c:set var="rank" value="${vote.rank}"/>
								<c:if test="${rank eq 1}">
							        <div class="col-md-12 ibox1 borderBox backgroundColor">
							        	<div class="col-md-3"><h3 class="index" style="margin-top: 10px;"></h3></div>
						        		<h3 class="col-md-6 textIndex" style="margin-top: 10px;">${vote.iText}</h3>
						        		<h3 class="col-md-3 text-right" style="margin-top: 10px;">${vote.icount}명(${vote.percentage}%)</h3>
							        </div>
								</c:if>
								<c:if test="${rank ne 1}">
							        <div class="col-md-12 ibox1 borderBox">
							        	<div class="col-md-3"><h3 class="index" style="margin-top: 10px;"></h3></div>
						        		<h3 class="col-md-6 textIndex" style="margin-top: 10px;">${vote.iText}</h3>
						        		<h3 class="col-md-3 text-right" style="margin-top: 10px;">${vote.icount}명(${vote.percentage}%)</h3>
							        </div>
								</c:if>
				        	</c:forEach>
						</div>				    	
				    </div>
				    <hr>
				    <div class="row">
                        <div class="col-lg-12">
                            <div class="small">
                                <div> <i class="fa fa-comments-o"> </i> 댓글: ${list3.size()}개 </div>
                            </div>
                        </div>
                    </div>
                    <div class="row ibox1">
                        <div class="col-lg-12">
                        	<c:forEach items="${list3}" var="vote">
	                            <div class="social-feed-box">
	                                <div class="social-avatar col-md-12">
	                                    <a class="pull-left">
	                                        <img alt="image" src="${vote.photoURL}">
	                                    </a>
	                                    <div class="col-md-8">
                                            <h5 class="ibox3">${vote.username}</h5>
	                                        <small class="text-muted">${vote.coDate}</small>
	                                    </div>
	                                    <div class="col-md-3 text-right no-padding">
	                                    	<c:set var="username" value="${vote.coUser}"/>
						                	<c:set var="email" value="${param.email}"/>
						                	<c:if test="${username eq email}">
						                		<a class="btn btn-white btn-xs modBtn" value="${vote.vNo}">수정</a>
						                		<a class="btn btn-white btn-xs delBtn" onclick="deleteVoteComment(${vote.vNo})">삭제</a>
						                		<form method="post" id="voteCommentsForm"><input type="hidden" name="coNo" value="${vote.coNo}"></form>
						                	</c:if>
	                                    </div>
	                                </div>
	                                <div class="social-body">
	                                    <p class="resultCommentText" style="padding-top:50px;">
	                                        ${vote.coText}
	                                    </p>
	                                    <form class="form-horizontal ng-pristine ng-valid" method="post" action="modifyVoteComments?email=${user.email}&vNo=${vote.vNo}">
		                                    <div class="input-group ResultcommentInput" style="padding:3px;">
		                                    	<input type="hidden" value="${vote.coNo}" name="coNo">
			                                    <input class="input form-control" type="text" name="coText" value="${vote.coText}">
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
                       	<form class="form-horizontal ng-pristine ng-valid" method="post" action="commentWrite?email=${user.email}&vNo=${vote.vNo}">
	                       	<div class="col-lg-12">
		                        <div class="input-group">
		                        	<input type="hidden" value="${vote.vNo}" name="vNo">
		                        	<input class="input form-control" type="text" name="coText">
		                        	<input type="hidden" id="coDate" name="coDate">
		                        	<span class="input-group-btn">
			                        	<button type="submit" class="btn btn-white">저장</button>
		                        	</span>
		                        </div>
	                       	</div>
                       	</form>
                    </div>
                    <hr>
				    <div class="row">
				    	<div class="text-right">
				    		<form method="post" action="modVoteUser?email=${param.email}&vNo=${param.vNo}">
				    			<c:forEach items="${list2}" var="vote">
					    			<input type="hidden" value="${vote.iNo}" name="iNo">
					    			<input type="hidden" value="${vote.vuNo}" name="vuNo">
						    		<button type="submit" class="btn btn-success">설문 수정</button>
				    			</c:forEach>
				    		</form>
				    	</div>
				    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="../include/footer.jsp" %>