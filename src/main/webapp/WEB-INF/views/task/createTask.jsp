<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="../include/header.jsp" %>
<div class="row wrapper border-bottom white-bg page-heading">
	<h1>
		<b>Activity 생성</b>
  	</h1>
    <ol class="breadcrumb">
	    <li><a href="/home"><i class="fa fa-home"></i> Home</a></li>
	    <li><a href="/viewActivity?email=${user.email}&bNo=${board.bNo}&aNo=${board.aNo}">activity View</a></li>
	    <li class="active">Task 생성</li>
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
                                        <dt>기간:</dt> <dd> ${board.aDate} </dd>
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
                            <hr>
						<form class="form-horizontal wizard-big" method="post" action="/createT?email=${user.email}&bNo=${board.bNo}&aNo=${board.aNo}">
			              <div class="box-body">
			                <div class="form-group" style="display: none;">
			                  <label for="today" class="col-sm-2 control-label">일자</label>
			                  <div class="col-sm-10">
			                    <input type="text" class="form-control" name="tWriteD" id="todayA" readonly="readonly">
			                  </div>
			                </div>
			                <div class="form-group" style="display: none;">
			                  <label for="writeUser" class="col-sm-2 control-label">작성자</label>
			                  <div class="col-sm-10">
			                    <input type="text" class="form-control" name="tWriteU" id="writeUser" value="${user.email}" readonly="readonly">
			                  </div>
			                </div>
			                <div class="form-group">
		                		<label class="col-sm-2 control-label">Task Name</label>
			                 	<div class="col-sm-10">
			                 		<input type="text" class="form-control" name="tName" required="required">
			                  	</div>
			                </div>
			                <div class="form-group">
								<label for="projectDate" class="col-sm-2 control-label">기간</label>
								<div class="col-sm-10">
									<input type="text" id="aDate" name="tDate" class="form-control" required>
								</div>
			                </div>
			                <div class="form-group">
			                	<label for="projectDate" class="col-sm-2 control-label">상태</label>
			                	<div class="col-sm-10">
									<select class="form-control" name="tStatus">
										<option value="진행중">진행중</option>
										<option value="대기">대기</option>
										<option value="완료">완료</option>
										<option value="보류">보류</option>
									</select>
								</div>
							</div>
			                <div class="form-group">
		                		<label class="col-sm-2 control-label">Task 매니저</label>
			                 	<div class="col-sm-10">
			                 		<select class="form-control" name="tM" style="width: 100%;">
			                 			<c:forEach items="${list2}" var="user">
					                		<option value="${user.email}">${user.username}</option>
					                	</c:forEach>
					                </select>
			                  	</div>
			                </div>
			                <div class="form-group">
		                		<label class="col-sm-2 control-label">설명</label>
			                 	<div class="col-sm-10">
			                 		 <textarea id="aText" name="tText"></textarea>
			                  	</div>
			                </div>
			              </div>
			              <!-- /.box-body -->
			              <div class="box-footer text-right">
			                <button class="btn btn-default" id="cancel">Cancel</button>
			                <button type="submit" class="btn btn-info">Sign in</button>
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