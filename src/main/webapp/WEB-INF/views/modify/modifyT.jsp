<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@include file="../include/header.jsp" %>
	  <div class="row wrapper border-bottom white-bg page-heading">
		<h1>
			<b>수정</b>
	    </h1>
	    <ol class="breadcrumb">
	      <li><a href="/notifyList?email=${user.email}"><i class="fa fa-home"></i> Home</a></li>
	      <li><a href="/task?email=${user.email}">업무관리</a></li>
	      <li class="active">수정</li>
	    </ol>
	  </div>
	<div class="wrapper-content">
	  <div class="wrapper wrapper-content animated fadeInRight">
		<div class="row">
			<div class="col-md-12">
				<div class="ibox">
					<div class="ibox-content">
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="m-b-md">
                                    </div>
                                    <dl class="dl-horizontal">
                                        <dt>상태: </dt> <dd><span class="label label-default">${board.aStatus}</span></dd>
                                    </dl>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-6">
                                    <dl class="dl-horizontal">
                                    	<dt>작성자:</dt> <dd>${board.aWriteU}</dd>
                                        <dt>Activity Name:</dt> <dd> ${board.aName}</dd>
                                    </dl>
                                </div>
                                <div class="col-lg-6" id="cluster_info">
                                    <dl class="dl-horizontal" >
                                        <dt>기간:</dt> <dd id="aDate1"> ${board.aDate} </dd>
                                        <dt>Activity 매니저:</dt> <dd> ${board.aM}</dd>
                                    </dl>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-12">
                                    <dl class="dl-horizontal">
                                        <dt>내용:</dt>
                                        <dd>
                                            <div>
                                            	<p>${board.aText}</p>
                                            </div>
                                        </dd>
                                    </dl>
                                </div>
                            </div>
						</div>
					</div>
				<div class="ibox">
					<div class="ibox-content">
						<form class="form-horizontal wizard-big" method="post" action="/modifyTask?email=${user.email}&bNo=${board.bNo}&aNo=${board.aNo}&tNo=${board.tNo}">
			              <div class="box-body">
			                <div class="form-group">
			                  <label for="status" class="col-sm-2 control-label">상태</label>
			                  <div class="col-sm-10">
			                    <input type="hidden" class="form-control" id="tStatus" value="${board.tStatus}" readonly="readonly">
			                    <select id="tStatusSel" name="tStatus" class="form-control">
			                    	<option value="진행중">진행중</option>
			                    	<option value="완료">완료</option>
			                    	<option value="대기">대기</option>
			                    	<option value="보류">보류</option>
			                    	<option value="기간초과">기간초과</option>
			                    </select>
			                  </div>
			                </div>
			                <div class="form-group">
								<label for="projectDate" class="col-sm-2 control-label">기간</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" value="${board.tDate}" name="tDate" id="projectDate2">
								</div>
			                </div>
			                <div class="form-group">
		                		<label class="col-sm-2 control-label">테스크 명</label>
			                 	<div class="col-sm-10">
			                 		 <input name="tName" type="text" value="${board.tName}" class="form-control">
			                  	</div>
			                </div>
			                <div class="form-group">
		                		<label class="col-sm-2 control-label">설명</label>
			                 	<div class="col-sm-10">
			                 		 <textarea name="tText" id="pText" placeholder="내역을 적어주세요.">${board.tText}</textarea>
			                  	</div>
			                </div>
			                <div class="form-group">
		                		<label class="col-sm-2 control-label">프로젝트 매니저</label>
			                 	<div class="col-sm-10">
			                 		<input type="hidden" class="form-control" id="tM1" value="${board.tM}" readonly="readonly">
			                 		<select class="form-control" id="userSel3" name="tM" style="width: 100%;">
			                 			<c:forEach items="${list1}" var="user">
					                		<option value="${user.email}">${user.username}</option>
					                	</c:forEach>
					                </select>
			                  	</div>
			                </div>
			              </div>
			              <!-- /.box-body -->
			              <div class="box-footer">
			                <button class="btn btn-default">Cancel</button>
			                <button type="submit" class="btn btn-info pull-right">Sign in</button>
			              </div>
			              <!-- /.box-footer -->
			            </form>
					</div>
				</div>
			</div>
		</div>
	</div>
 </div>
<%@include file="../include/footer.jsp" %>
