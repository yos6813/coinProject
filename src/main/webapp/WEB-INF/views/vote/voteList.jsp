<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@include file="../include/header.jsp" %>
<div class="row wrapper border-bottom white-bg page-heading">
     <div class="col-lg-10">
         <h1>
   			<b>Vote List</b>
	 	 </h1>
         <ol class="breadcrumb">
		    <li><a href="/home?email=${user.email}"><i class="fa fa-home"></i> Home</a></li>
		    <li class="active">Vote List</li>
	     </ol>
     </div>
</div>
<div class="col-lg-12 text-right">
	<a class="btn btn-white" href="voteWrite?email=${user.email}">글쓰기</a>
</div>
<div class="col-lg-12">
   <div class="wrapper wrapper-content animated fadeInRight ibox1">
	   <c:forEach items="${list}" var="vote">
	       <div class="vote-item">
	           <div class="row">
	               <div class="col-md-10">
	                   <div class="vote-actions ibox3">
	                       <div>${vote.vNo}</div>
	                   </div>
	                   <a href="vote?email=${user.email}&vNo=${vote.vNo}" class="vote-title">
	                       ${vote.vTitle}
	                   </a>
	                   <div class="vote-info">
	                       <i class="fa fa-clock-o"></i> <a>${vote.vDate }</a>
	                       <i class="fa fa-user"></i> <a>${vote.username}</a>
	                   </div>
	               </div>
	           </div>
	       </div>
	   	</c:forEach>
   </div>
</div>
 <%@include file="../include/footer.jsp" %>