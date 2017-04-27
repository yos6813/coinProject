<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@include file="../include/header.jsp" %>
<div class="row wrapper border-bottom white-bg page-heading">
    <div class="col-lg-10">
        <h1>
  			<b>인별 현황 보기</b>
 	 	</h1>
        <ol class="breadcrumb">
	    <li><a href="/home?email=${user.email}"><i class="fa fa-home"></i> Home</a></li>
	    <li><a href="/calendar?email=${user.email}"><i class="fa fa-calendar"></i>휴직관리</a></li>
	    <li class="active">인별 현황 보기</li>
     </ol>
    </div>
</div>
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="ibox">
			<div class="ibox-title">
				<div class="row">
					<div class="col-md-9"><h4 style="margin-top:5px; margin-bottom:0px;">휴가/휴직 현황</h4></div>
					<div class="col-md-3 text-right">
						<a class="btn btn-white btn-sm" href="/calendar?email=${user.email}"style="margin-bottom:5px;">
							달력 보기
						</a>
					</div>
				</div>
			</div>
			<div class="ibox-content">
				<div class="row">
					<table class="annualTable table-hover">
						<c:forEach items="${list}" var="calendar">
							<tr>
								<td class="text-center" style="width:150px">
									<img src="${calendar.photoURL}" class="img-circle"><br>
									<small class="text-muted">${calendar.username}</small>
								</td>
								<td class="text-right" style="width:150px">
									<small>입사일</small><br>
									<h3>${calendar.joinDate}</h3>
								</td>
								<td class="text-right" style="width:150px">
									<small>부여연차</small><br>
									<h3>${calendar.annual}개</h3>
								</td>
								<td class="text-right" style="width:150px">
									<small>사용연차</small><br>
									<h3>${calendar.useAnnual}개</h3>
								</td>
								<td class="text-right" style="width:150px">
									<small>잔여연차</small><br>
									<h3 class="text-info">${calendar.annualNum}개</h3>
								</td>
								<td class="text-right" style="width:150px;">
									<a class="btn-sm btn btn-white modUserAnnual" value="${calendar.id}" style="margin-right:5px;">수정</a>
								</td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
		<div class="modal inmodal" id="myModal" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog">
           		<div class="modal-content animated fadeIn">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    </div>
                   	<form class="form-horizontal ng-pristine ng-valid" action="/modUserAnnual?email=${param.email}" method="post">
	                    <div class="modal-body" id="modalAnnual">
	                    	
	                    </div>
	                    <div class="modal-footer">
	                        <button type="button" class="btn btn-white" data-dismiss="modal">닫기</button>
	                        <button type="submit" class="btn btn-primary">완료</button>
	                    </div>
					</form>
                </div>
            </div>
        </div>
	</div>
</div>
<%@include file="../include/footer.jsp" %>