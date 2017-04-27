<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@include file="../include/header.jsp" %>
<div class="row wrapper border-bottom white-bg page-heading">
    <div class="col-lg-10">
        <h1>
  			<b>연차 관리</b>
 	 	</h1>
        <ol class="breadcrumb">
		    <li><a href="/home?email=${user.email}"><i class="fa fa-home"></i> Home</a></li>
		    <li class="active">연차 관리</li>
     	</ol>
    </div>
</div>
<div class="wrapper wrapper-content animated fadeInRight">
	<div class="col-lg-12">
		<div class="row m-b-lg m-t-lg no-margins">
			<div class="col-md-6">	
				<div class="ibox">
					<div class="ibox-title">
						연차 관리
					</div>
					<div class="ibox-content">
						<table class="table">
							<tr>
								<th>이름</th>
								<th>연차일수</th>
							</tr>
							<c:forEach items="${list}" var="admit">
								<tr class="annualList" value="${admit.id}">
									<td>${admit.username}</td>
									<td>${admit.annualNum}</td>
								</tr>
							</c:forEach>
						</table>
						<div class="text-right">
							<button type="button" class="btn btn-warning" data-toggle="modal" data-target="#myModal1">수정</button>
		                 	<button type="button" class="btn btn-success" data-toggle="modal" data-target="#myModal">추가</button>
						</div>
					</div>
				</div>
			</div>
			<div class="modal inmodal" id="myModal" tabindex="-1" role="dialog" aria-hidden="true">
	            <div class="modal-dialog">
	            <div class="modal-content animated fadeIn">
	                    <div class="modal-header">
	                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
	                    </div>
	                   	<form class="form-horizontal ng-pristine ng-valid" action="/annualWrite?email=${param.email}" method="post">
		                    <div class="modal-body">
								<div class="form-group">
						 			<label class="col-sm-2 control-label">구분</label>
						 			<div class="col-sm-10">
										<select name="email1" class="form-control">
											<option>선택</option>
											<c:forEach items="${list2}" var="user">
												<option value="${user.email}">${user.username}</option>
											</c:forEach>
										</select>
						 			</div>
						 		</div>
						 		<div class="form-group">
						 			<label class="col-sm-2 control-label">추가 일자</label>
						 			<div class="col-sm-10">
										<input type="text" class="form-control" name="annualNum">
						 			</div>
						 		</div>
		                    </div>
		                    <div class="modal-footer">
		                        <a type="button" class="btn btn-white" data-dismiss="modal">닫기</a>
		                        <button type="submit" class="btn btn-success">추가</button>
		                    </div>
						</form>
	                </div>
	            </div>
	        </div>
        </div>
        <div class="modal inmodal" id="myModal1" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog">
            <div class="modal-content animated fadeIn">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    </div>
                   	<form class="form-horizontal ng-pristine ng-valid" action="/modAnnual?email=${param.email}" method="post">
	                    <div class="modal-body">
							<div class="form-group">
					 			<label class="col-sm-2 control-label">구분</label>
					 			<div class="col-sm-10">
									<select name="email1" class="form-control">
										<option>선택</option>
										<c:forEach items="${list2}" var="user">
											<option value="${user.email}">${user.username}</option>
										</c:forEach>
									</select>
					 			</div>
					 		</div>
					 		<div class="form-group">
					 			<label class="col-sm-2 control-label">추가 일자</label>
					 			<div class="col-sm-10">
									<input type="text" class="form-control" name="annualNum">
					 			</div>
					 		</div>
	                    </div>
	                    <div class="modal-footer">
	                        <a type="button" class="btn btn-white" data-dismiss="modal">닫기</a>
	                        <button type="submit" class="btn btn-success">수정</button>
	                    </div>
					</form>
                </div>
            </div>
        </div>
	</div>
</div>
<%@include file="../include/footer.jsp" %>