<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="../include/header.jsp" %>
<div class="row wrapper border-bottom white-bg page-heading">
	<div class="col-lg-10">
		<h1>
			<b>내역 수정/삭제</b>
		</h1>
		<ol class="breadcrumb">
			<li><a href="/cardList?email=${user.email}"><i class="fa fa-home"></i> Home</a></li>
			<li class="active">내역 수정/삭제</li>
		</ol>
	</div>
</div>
<div class="wrapper-content">

</div>
<%@include file="../include/footer.jsp" %>