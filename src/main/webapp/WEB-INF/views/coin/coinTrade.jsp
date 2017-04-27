<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@include file="../include/header.jsp" %>
<div class="row wrapper border-bottom white-bg page-heading">
     <div class="col-lg-10">
         <h1>
   			<b>코인 거래</b>
	 	 </h1>
         <ol class="breadcrumb">
		    <li><a href="/home?email=${user.email}"><i class="fa fa-home"></i>Home</a></li>
		    <li>코인 거래</li>
	     </ol>
     </div>
 </div>
 <div class="wrapper-content">
	<div class="row">
		<div class="col-sm-4">
			<div class="ibox">
				<div class="ibox-title">
					<a class="text-info pull-right" id="allSelect">전체 선택</a>
					송금 대상자
				</div>
				<div class="ibox-content">
					<small class="text-muted">송금 할 대상을 선택해주세요.</small>
					<div class="ibox1" style="height: 500px; max-height: 500px;">
						<div class="full-height-scroll">
							<ul class="list-group clear-list">
                            	<c:forEach items="${list}" var="user">
									<c:set value="${param.email}" var="this1"></c:set>
                            		<c:set value="${user.email}" var="this2"></c:set>
                            		<c:if test="${this1 ne this2}">
										<li class="list-group-item fist-item coinUserList">
									    	<span class="pull-right text-right">
									    		<small>보유코인</small><br>
												<h3 value="${user.email}">${user.coin}</h3>
												<p value="${user.username}"></p>
												<input value="${user.slackID}" class="slackIDCoin" type="hidden">
									    	</span>
										    <span> 
										    	<img src="${user.photoURL}" class="img-circle"><br>
										    	<small>${user.username}</small>
									    	</span>
										</li>
										<hr style="margin-top:5px; margin-bottom:5px;">
                            		</c:if>
  	                        	</c:forEach>
                            </ul>
						</div>
                    </div>
				</div>
			</div>
		</div>
		<div class="col-sm-8">
			<div class="ibox">
				<div class="ibox-title">
					송금 내용
				</div>
				<div class="ibox-content">
					<form class="form-horizontal" method="post" id="coinTradeForm" action="/tradeCoin?email=${user.email}">
						<div class="form-group">
							<label class="col-sm-3 control-label">인당 송금액</label>
							<div class="col-sm-9">
								<input type="text" id="coinInput" class="form-control">
								<input type="text" id="tradeUserName" class="hidden" value="${user.username}">
								<small class="hidden text-danger" id="warningCoin">송금 대상을 먼저 선택해주세요.</small>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">송금 메세지</label>
							<div class="col-sm-9">
								<textarea id="coinText" class="form-control"></textarea>
							</div>
						</div>
						<hr>
						<div class="form-group">
							<label class="col-sm-3 control-label">대상인원</label>
							<div class="col-sm-9 text-right">
								<h3 id="tradeUser">0</h3>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">송금액</label>
							<div class="col-sm-9 text-right">
								<h3 id="tradeCoin">0</h3>
								<input type="hidden" id="tradeCoin2">
							</div>
						</div>
						<div class="form-group hidden">
							<label class="col-sm-3 control-label">송금액</label>
							<div class="col-sm-9 text-right">
								<h3 id="totalCoin">0</h3>
								<input type="hidden" id="totalCoin2">
							</div>
						</div>
						<hr>
						<div class="form-group">
							<label class="col-sm-3 control-label">현재 보유코인</label>
							<div class="col-sm-9 text-right">
								<h3 id="ownCoin">${user.coin}</h3>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">송금 후 잔여코인</label>
							<div class="col-sm-9 text-right">
								<h3 id="coinRemaining">${user.coin}</h3>
							</div>
						</div>
						<hr>
						<div class="text-right">
							<a class="btn btn-primary" id="tradeBtn">송금 하기</a>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
<%@include file="../include/footer.jsp" %>