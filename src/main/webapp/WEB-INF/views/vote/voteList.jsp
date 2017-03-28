<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@include file="../include/header.jsp" %>
<div class="row wrapper border-bottom white-bg page-heading">
     <div class="col-lg-10">
         <h1>
   			<b>설문조사</b>
	 	 </h1>
         <ol class="breadcrumb">
		    <li><a href="/home?email=${user.email}"><i class="fa fa-home"></i> Home</a></li>
		    <li class="active">Vote List</li>
	     </ol>
     </div>
</div>
<div class="col-lg-12 text-right marginTopnBottom">
	<a class="btn btn-white" href="voteWrite?email=${user.email}">글작성</a>
</div>
<div class="col-lg-12" id="voteList1">
   <div class="wrapper wrapper-content animated fadeInRight ibox1">
	   <c:forEach items="${list}" var="vote">
	       <div class="vote-item voteList1">
	           <div class="row">
	               <div class="col-md-10">
	                   <div class="vote-actions ibox3">
	                       <div>${vote.vNo}</div>
	                   </div>
	                   <a href="vote?email=${user.email}&vNo=${vote.vNo}" class="vote-title">
	                       ${vote.vTitle}
	                   </a>
	                   <div class="vote-info">
							<a>댓글: ${vote.countComment}</a>
							<a>참여: ${vote.countJoinUser}/${list2.size()}</a>
	                   </div>
	               </div>
	               <div class="col-md-2 text-right">
			            <h3 class="text-info notifyListMargin">${vote.vDate}</h3>
			            <small class="text-gray">
			            	작성자: ${vote.username}
			            </small>
			        </div>
	           </div>
	       </div>
	   	</c:forEach>
   </div>
</div>
<div class="col-lg-12 text-center">
	<button class="btn btn-white col-md-12" id="vTenMore">10개 더보기</button>
</div>
 <%@include file="../include/footer.jsp" %>