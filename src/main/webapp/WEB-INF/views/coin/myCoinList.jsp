<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@include file="../include/header.jsp" %>
<div class="row wrapper border-bottom white-bg page-heading">
     <div class="col-lg-10">
         <h1>
   			<b>코인몰</b>
	 	 </h1>
         <ol class="breadcrumb">
		    <li><a href="/home?email=${user.email}"><i class="fa fa-home"></i> Home</a></li>
		    <li class="active">코인몰</li>
	     </ol>
     </div>
</div>
 <div class="col-lg-12">
	 <div class="wrapper wrapper-content animated fadeInRight">
		<div class="row">
			<div class="ibox">
				<div class="ibox-content col-lg-12">
					<div class="col-sm-8" style="padding-top: 5px;">
						<img src="${coin.photoURL}" class="img-circle"><br>
						<small>${coin.username}</small>
					</div>
					<div class="col-sm-2 text-right">
						<small>누적 사용액</small><br>
						<h2><strong>${coin.useCoin}</strong></h2>
					</div>
					<div class="col-sm-2 text-right">
						<small>보유코인</small><br>
						<h2><strong>${coin.coin}</strong></h2>
					</div>
				</div>
			</div>
			<div class="ibox" style="padding-top: 20px;">
				<div class="ibox-title">
					코인 사용현황
				</div>
				<c:forEach items="${list}" var="coin">
					<c:set value="${coin.division}" var="division"></c:set>
					<c:if test="${division eq '상품구매'}">
						<div class="ibox-content col-lg-12">
							<div class="col-sm-1 text-center">
								<label class="label label-info division">${coin.division}</label>
							</div>
							<div class="col-sm-2">
								<p>${coin.useDate}</p>
							</div>
							<div class="col-sm-6">
								${coin.useText}(${coin.etc}개)
							</div>
							<div class="col-sm-3 text-right">
								-${coin.useCoin}
							</div>
						</div>
					</c:if>
					<c:if test="${division eq '입금'}">
						<div class="ibox-content col-lg-12">
							<div class="col-sm-1 text-center">
								<label class="label label-success division">${coin.division}</label>
							</div>
							<div class="col-sm-2">
								<p>${coin.useDate}</p>
							</div>
							<div class="col-sm-6">
								${coin.useText}<br>
								<small>${coin.etc}</small>
							</div>
							<div class="col-sm-3 text-right">
								+${coin.useCoin}
							</div>
						</div>
					</c:if>
					<c:if test="${division eq '출금'}">
						<div class="ibox-content col-lg-12">
							<div class="col-sm-1 text-center">
								<label class="label label-danger division">${coin.division}</label>
							</div>
							<div class="col-sm-2">
								<p>${coin.useDate}</p>
							</div>
							<div class="col-sm-6">
								${coin.useText}<br>
								<small>${coin.etc}</small>
							</div>
							<div class="col-sm-3 text-right">
								-${coin.useCoin}
							</div>
						</div>
					</c:if>
				</c:forEach>
			</div>
		</div>
	</div>
</div>
 <%@include file="../include/footer.jsp" %>