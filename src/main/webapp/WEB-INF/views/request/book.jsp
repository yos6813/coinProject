<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@include file="../include/header.jsp" %>
<div class="row wrapper border-bottom white-bg page-heading">
    <div class="col-lg-10">
        <h1>
  			<b>도서 구매 신청</b>
 	 </h1>
        <ol class="breadcrumb">
	    <li><a href="/home?email=${user.email}"><i class="fa fa-home"></i> Home</a></li>
	    <li class="active">도서 구매 신청</li>
     </ol>
    </div>
</div>
<div class="col-lg-12" style="height:100%">
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="ibox">
			<div class="ibox-title">
				<c:forEach items="${list1}" var="calendar">
					<input type="text" class="hidden bookManagerEmail" value="${calendar.email}">
					<input type="text" class="hidden bookManagerSlack" value="${calendar.slackID}">
				</c:forEach>
					<input class="hidden" type="text" id="requestBookUserName" value="${user.username}">
				<strong>도서구매신청 폼</strong>
				<small>구매를 원하는 도서의 정보를 아래폼에 맞춰 입력해주세요.</small>
			</div>
			<div class="ibox-content">
				<form class="form-horizontal ng-pristine ng-valid" id="bookRequestForm" action="/bookRequest?email=${param.email}" method="post">
					<div class="form-group">
						<label class="col-sm-2 control-label">도서명</label>
						<div class="col-sm-10">
							<input class="hidden" name="requestDate" id="requestDateBook">
							<input class="form-control" type="text" name="bookName" placeholder="구매를 원하는 도서명을 정확히 입력해주세요.">
						</div>
		 			</div>
		 			<div class="form-group">
						<label class="col-sm-2 control-label">저자</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" name="writer" placeholder="구매를 원하는 저자를 정확히 입력해주세요.">
						</div>
		 			</div>
		 			<div class="form-group">
						<label class="col-sm-2 control-label">출판사</label>
						<div class="col-sm-10">
							<input class="form-control" type="text" name="publisher" placeholder="구매를 원하는 출판사를 정확히 입력해주세요.">
						</div>
		 			</div>
		 			<div class="form-group">
						<label class="col-sm-2 control-label">분야</label>
						<div class="col-sm-10">
							<select class="form-control" name="division">
								<option>선택</option>
								<option value="철학">철학</option>
								<option value="세법">세법</option>
								<option value="회계">회계</option>
								<option value="IT">IT</option>
								<option value="기업경영사례">기업경영사례</option>
								<option value="기타">기타</option>
							</select>
						</div>
		 			</div>
		 			<div class="form-group">
						<label class="col-sm-2 control-label">참조링크</label>
						<div class="col-sm-10">
							<input class="form-control" name="link" type="text"placeholder="구매를 원하는 도서의 정보가 있는 링크를 입력해주세요.">
						</div>
		 			</div>
		 			<div class="form-group">
						<label class="col-sm-2 control-label">구입목적</label>
						<div class="col-sm-10">
							<textarea class="form-control" name="purpose" id="breason"></textarea>
						</div>
		 			</div>
		 			<div class="text-right">
		 				<button type="button" id="bookRequestBtn" class="btn btn-success">추가</button>
		 			</div>
				</form>
			</div>
		</div>
	</div>
</div>
<%@include file="../include/footer.jsp" %>