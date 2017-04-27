<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@include file="../include/header.jsp" %>
<div class="row wrapper border-bottom white-bg page-heading">
     <div class="col-lg-10">
         <h1>
   			<b>스케쥴표</b>
	 	 </h1>
         <ol class="breadcrumb">
		    <li><a href="/home?email=${user.email}"><i class="fa fa-home"></i> Home</a></li>
		    <li class="active">스케쥴표</li>
	     </ol>
     </div>
 </div>
<div class="col-lg-12" style="height:100%">
	<c:forEach items="${list1}" var="calendar">
		<input type="text" class="hidden annualManagerEmail" value="${calendar.email}">
		<input type="text" class="hidden annualManagerSlack" value="${calendar.slackID}">
	</c:forEach>
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="ibox">
    		<div class="ibox-title">
    			<div class="row">
    				<div class="col-sm-9">
		       			<h4 style="margin-top:5px; margin-bottom:5px;">휴가/휴직 현황</h4>
    				</div>
					<c:set value="${user.grade}" var="grade"></c:set>
					<c:if test="${grade > 1 }">
		       			<div class="text-right col-sm-3">
			       			<a class="btn btn-white btn-sm" href="/userAnnual?email=${param.email}">연별현황 보기</a>
		       			</div>
					</c:if>
    			</div>
       		</div>
           <div class="ibox-content">
           	<div class="row ibox1">
           		<div class="col-sm-2">
		           <p>부여연차: <strong class="text-success">${calendar.annual}</strong>개</p>
		        </div>
		        <div class="col-sm-2">
				   <p>사용연차: <strong class="text-success">${calendar.useAnnual}</strong>개</p>
		        </div>
		        <div class="col-sm-2">
				  <p>잔여연차: <strong class="text-success">${calendar.annualNum }</strong>개</p>
	           </div>
	           <div class="text-right col-sm-6">
		           <button class="btn btn-success" data-toggle="modal" data-target="#myModal" type="button">휴가 신청하기</button>
	           </div>
           	</div>
            <div id="calendar"></div>
         </div>
       </div>
       <div class="modal inmodal" id="myModal" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog">
            <div class="modal-content animated fadeIn">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    </div>
                   	<form class="form-horizontal ng-pristine ng-valid" id="requestForm" action="/requestAnnual?email=${param.email}" method="post">
	                    <div class="modal-body">
							<div class="form-group">
					 			<label class="col-sm-3 control-label">구분</label>
					 			<div class="col-sm-9">
									<select name="division" class="form-control">
										<option value="">선택</option>
										<option value="연차">연차</option>
									</select>
					 			</div>
					 		</div>
					 		<div class="form-group">
					 			<label class="col-sm-3 control-label">시작일</label>
					 			<div class="col-sm-9">
					 				<input type="text" class="hidden" name="requestDate" id="requestDate">
					 				<input type="text" name="start" class="form-control" id="startPicker">
					 			</div>
					 		</div>
					 		<div class="form-group">
					 			<label class="col-sm-3 control-label">종료일</label>
					 			<div class="col-sm-9">
					 				<input type="text" name="end" class="form-control" id="endPicker">
					 			</div>
					 		</div>
	                    	<div class="form-group">
					 			<label class="col-sm-3 control-label">잔여연차</label>
					 			<div class="col-sm-9">
					 				<input type="text" class="form-control" id="userAnnual" value="${calendar.annualNum}" readonly="readonly">
					 			</div>
					 		</div>
					 		<div class="form-group">
					 			<label class="col-sm-3 control-label">사용연차</label>
					 			<div class="col-sm-9">
					 				<input type="text" name="annualNum" class="form-control" id="useAnnual1" readonly="readonly">
					 			</div>
					 		</div>
					 		<div class="form-group">
					 			<label class="col-sm-3 control-label">예상잔여연차</label>
					 			<div class="col-sm-9">
					 				<input type="text" class="form-control" id="annualNum" readonly="readonly">
					 				<input type="text" class="hidden" id="requestUserName" value="${user.username}">
					 			</div>
					 		</div>
	                    </div>
	                    <div class="modal-footer">
	                        <button type="button" class="btn btn-white" data-dismiss="modal">닫기</button>
	                        <button type="submit" id="annualRequest" class="btn btn-primary">신청</button>
	                    </div>
					</form>
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="../include/footer.jsp" %>