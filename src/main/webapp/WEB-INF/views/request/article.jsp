<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@include file="../include/header.jsp" %>
<div class="row wrapper border-bottom white-bg page-heading">
    <div class="col-lg-10">
        <h1>
  			<b>물품 구매 신청</b>
 	 </h1>
        <ol class="breadcrumb">
	    <li><a href="/home?email=${user.email}"><i class="fa fa-home"></i> Home</a></li>
	    <li class="active">물품 구매 신청</li>
     </ol>
    </div>
</div>
<div class="col-lg-12" style="height:100%">
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="ibox">
			<c:forEach items="${list1}" var="calendar">
				<input type="text" class="hidden articleManagerEmail" value="${calendar.email}">
				<input type="text" class="hidden articleManagerSlack" value="${calendar.slackID}">
			</c:forEach>
				<input class="hidden" type="text" id="requestArticleUserName" value="${user.username}">
			<div class="ibox-title">
				<strong>물품구매신청 폼</strong>
				<small>구매를 원하는 물품의 정보를 아래폼에 맞춰 입력해주세요.</small>
			</div>
			<div class="ibox-content">
				<form class="form-horizontal ng-pristine ng-valid" id="articleForm" action="/articleRequest?email=${param.email}" method="post">
					<div class="form-group">
						<label class="col-sm-2 control-label">물품명</label>
						<div class="col-sm-10">
							<input class="hidden" name="requestDate" id="requestDateArticle">
							<input class="form-control" type="text" name="name" placeholder="구매를 원하는 물품명을 정확히 입력해주세요.">
						</div>
		 			</div>
		 			<div class="form-group">
						<label class="col-sm-2 control-label">제조사</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" name="maker" placeholder="구매를 원하는 물품의 제조사를 입력해주세요.">
						</div>
		 			</div>
		 			<div class="form-group">
						<label class="col-sm-2 control-label">단가</label>
						<div class="col-sm-10">
							<input class="form-control" type="text" name="price" placeholder="구매를 원하는 물품의 대략적인 가격을 입력해주세요.">
						</div>
		 			</div>
		 			<div class="form-group">
						<label class="col-sm-2 control-label">수량</label>
						<div class="col-sm-10">
							<input class="form-control" name="num" type="text"placeholder="구매를 원하는 물품의 구매수량을 입력해주세요.">
						</div>
		 			</div>
		 			<div class="form-group">
						<label class="col-sm-2 control-label">참조링크</label>
						<div class="col-sm-10">
							<input class="form-control" name="link" type="text"placeholder="구매를 원하는 물품의 정보가 있는 링크를 입력해주세요.">
						</div>
		 			</div>
		 			<div class="form-group">
						<label class="col-sm-2 control-label">구입목적</label>
						<div class="col-sm-10">
							<textarea class="form-control" name="purpose" id="rReason"></textarea>
						</div>
		 			</div>
		 			<div class="text-right">
		 				<button type="button" id="articleRequest" class="btn btn-success">신청</button>
		 			</div>
				</form>
			</div>
		</div>
	</div>
</div>
<%@include file="../include/footer.jsp" %>