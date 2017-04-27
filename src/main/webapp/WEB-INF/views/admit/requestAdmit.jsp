<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@include file="../include/header.jsp" %>
<div class="row wrapper border-bottom white-bg page-heading">
    <div class="col-lg-10">
        <h1>
  			<b>결재 관리</b>
 	 </h1>
        <ol class="breadcrumb">
	    <li><a href="/home?email=${user.email}"><i class="fa fa-home"></i> Home</a></li>
	    <li class="active">결재 요청 현황</li>
     </ol>
    </div>
</div>
<div class="col-lg-12" id="requestDiv">
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="row">
			<div class="tabs-container">
                <ul class="nav nav-tabs">
                    <li class="active"><a data-toggle="tab" href="#tab-1">휴가/휴직</a></li>
                    <li class=""><a data-toggle="tab" href="#tab-2">도서</a></li>
                    <li class=""><a data-toggle="tab" href="#tab-3">물품</a></li>
                </ul>
                <div class="tab-content">
                    <div id="tab-1" class="tab-pane active">
	                    <div class="panel-body col-lg-12">
	                    	<div class="col-sm-12">
	                    		<div class="btn-group">
									<button class="btn-sm btn btn-white annualBtn" value="전체">전체</button>
									<button class="btn-sm btn btn-white annualBtn" value="승인대기">승인대기</button>
									<button class="btn-sm btn btn-white annualBtn" value="승인">승인</button>
									<button class="btn-sm btn btn-white annualBtn" value="거절">반려</button>
	                    		</div>
							</div>
							<div class="col-sm-12" style="padding-top:10px;" id="annualRequestTbl">
								<table class="table">
									<c:forEach items="${list}" var="admit">
										<c:set value="${admit.acceptcheck}" var="acceptCheck"></c:set>
											<tr class="requestListTable">
												<td style="width:150px;" class="text-center">${admit.requestDate}</td>
												<td style="width:150px;" class="text-center">${admit.username}</td>
												<td>	
													<a class="annualInfo text-primary" value="${admit.id}">
														${admit.division}<br><small>${admit.start}~${admit.end}(${admit.annualNum}일)</small>
													</a>
												</td>
											<c:if test="${acceptCheck eq '승인대기'}">
												<td style="width:150px;" class="text-center">
													<a class="btn btn-white btn-sm annualCheck" value="${admit.id}">승인</a>
													<input type="text" value="${admit.slackID}" class="hidden requestUser">
													<a class="btn btn-warning btn-sm annualDel" value="${admit.id}">반려</a>
												</td>
											</c:if>
											<c:if test="${acceptCheck eq '승인'}">
												<td style="width:150px;" class="text-center">
													<p class="text-success">승인</p>
												</td>
											</c:if>
											<c:if test="${acceptCheck eq '거절'}">
												<td style="width:150px;" class="text-center">
													<p class="text-danger">반려</p>
												</td>
											</c:if>
										</tr>
									</c:forEach>
								</table>
							</div>
							<button class="btn-white btn btn-sm col-sm-12" id="moreRTenShow">10개 더보기</button>
	                    </div>
                    </div>
                    <div id="tab-2" class="tab-pane">
                   		<div class="panel-body col-lg-12">
	                    	<div class="col-sm-12">
	                    		<div class="btn-group">
									<button class="btn-sm btn btn-white bookBtn" value="전체">전체</button>
									<button class="btn-sm btn btn-white bookBtn" value="승인대기">승인대기</button>
									<button class="btn-sm btn btn-white bookBtn" value="승인">승인</button>
									<button class="btn-sm btn btn-white bookBtn" value="거절">반려</button>
	                    		</div>
							</div>
							<div class="col-sm-12" style="padding-top:10px;" id="bookRequestTbl">
								<table class="table">
									<c:forEach items="${list2}" var="admit">
									<c:set value="${admit.acceptcheck}" var="acceptCheck"></c:set>
										<tr class="bookRequestTable">
											<td style="width:150px;" class="text-center">${admit.requestDate}</td>
											<td style="width:150px;" class="text-center">
												${admit.username}
											</td>
											<td>
												<a class="bookInfo text-primary" value="${admit.id}">
													${admit.bookName}<br><small>${admit.writer}</small>
												</a>
											</td>
											<c:if test="${acceptCheck eq '승인대기'}">
												<td style="width:150px;" class="text-center">
													<a class="btn btn-white btn-sm bookCheck" value="${admit.id}">승인</a>
													<input type="text" value="${admit.slackID}" class="hidden bookRequestUser">
													<a class="btn btn-warning btn-sm bookDeny" value="${admit.id}">반려</a>
												</td>
											</c:if>
											<c:if test="${acceptCheck eq '승인'}">
												<td style="width:150px;" class="text-center">
													<p class="text-success">승인</p>
												</td>
											</c:if>
											<c:if test="${acceptCheck eq '거절'}">
												<td style="width:150px;" class="text-center">
													<p class="text-danger">반려</p>
												</td>
											</c:if>
										</tr>
									</c:forEach>
								</table>
							</div>
							<button class="btn-white btn btn-sm col-sm-12" id="moreBTenShow">10개 더보기</button>
	                    </div>
                    </div>
                    <div id="tab-3" class="tab-pane">
                   		<div class="panel-body col-lg-12">
	                    	<div class="col-sm-12">
	                    		<div class="btn-group">
									<button class="btn-sm btn btn-white articleBtn" value="전체">전체</button>
									<button class="btn-sm btn btn-white articleBtn" value="승인대기">승인대기</button>
									<button class="btn-sm btn btn-white articleBtn" value="승인">승인</button>
									<button class="btn-sm btn btn-white articleBtn" value="거절">반려</button>
	                    		</div>
							</div>
							<div class="col-sm-12" style="padding-top:10px;" id="articleRequestTbl">
								<table class="table">
									<c:forEach items="${list3}" var="admit">
									<c:set value="${admit.acceptcheck}" var="acceptCheck"></c:set>
										<tr class="articleRequestTable">
											<td style="width:150px;" class="text-center">${admit.requestDate}</td>
											<td style="width:150px;" class="text-center">${admit.username}</td>
											<td>
												<a class="articleInfo text-primary" value="${admit.id}">
													${admit.name}<br><small>${admit.price}</small>
												</a>
											</td>
											<c:if test="${acceptCheck eq '승인대기'}">
												<td style="width:150px;" class="text-center">
													<a class="btn btn-white btn-sm articleCheck" value="${admit.id}">승인</a>
													<input type="text" value="${admit.slackID}" class="hidden articleRequestUser">
													<a class="btn btn-warning btn-sm articleDeny" value="${admit.id}">반려</a>
												</td>
											</c:if>
											<c:if test="${acceptCheck eq '승인'}">
												<td style="width:150px;" class="text-center">
													<p class="text-success">승인</p>
												</td>
											</c:if>
											<c:if test="${acceptCheck eq '거절'}">
												<td style="width:150px;" class="text-center">
													<p class="text-danger">반려</p>
												</td>
											</c:if>
										</tr>
									</c:forEach>
								</table>
							</div>
							<button class="btn-white btn btn-sm col-sm-12" id="moreATenShow">10개 더보기</button>
	                    </div>
                    </div>
                </div>
            </div>
            <div class="modal inmodal" id="myModal" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog modal-sm">
            <div class="modal-content animated fadeIn">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    </div>
                    <div class="modal-body col-lg-12" id="requestModal">
                    	
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-white" data-dismiss="modal">닫기</button>
                    </div>
                </div>
            </div>
        </div>
		</div>
	</div>
</div>
<%@include file="../include/footer.jsp" %>