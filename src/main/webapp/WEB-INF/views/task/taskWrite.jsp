<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@include file="../include/header.jsp" %>
	  <!-- Content Header (Page header) -->
	  <div class="row wrapper border-bottom white-bg page-heading">
		<h1>
			<b>글쓰기</b>
	    </h1>
	    <ol class="breadcrumb">
	      <li><a href="/home"><i class="fa fa-home"></i> Home</a></li>
	      <li><a href="/task">업무관리</a></li>
	      <li class="active">글쓰기</li>
	    </ol>
	  </div>
	<div class="wrapper-content">
	  <div class="wrapper wrapper-content animated fadeInRight">
		<div class="row">
			<div class="col-md-12">
				<div class="ibox">
					<div class="ibox-content">
						<form class="form-horizontal wizard-big" method="post" action="/taskWriteP?email=${user.email}">
			              <div class="box-body">
			                <div class="form-group" style="display: none;">
			                  <label for="today" class="col-sm-2 control-label">일자</label>
			                  <div class="col-sm-10">
			                    <input type="text" class="form-control" name="writeDate" id="today" readonly="readonly">
			                  </div>
			                </div>
			                <div class="form-group" style="display: none;">
			                  <label for="writeUser" class="col-sm-2 control-label">작성자</label>
			                  <div class="col-sm-10">
			                    <input type="text" class="form-control" id="writeUser" name="writeUser" value="${user.email}" readonly="readonly">
			                  </div>
			                </div>
			                <div class="form-group">
		                		<label class="col-sm-2 control-label">프로젝트명</label>
			                 	<div class="col-sm-10">
			                 		<select class="form-control" id="projectName" name="pNo" style="width: 100%;">
			                 				<option id="select">선택</option>	
			                 			<c:forEach items="${list}" var="project">
					                		<option value="${project.pNo}">${project.pName}</option>
					                	</c:forEach>
					                </select>
			                  	</div>
			                </div>
			                <div class="form-group">
			                  <label for="status" class="col-sm-2 control-label">상태</label>
			                  <div class="col-sm-10">
			                    <input type="text" class="form-control" id="status" name="status" value="${project.status}" readonly="readonly">
			                  </div>
			                </div>
			                <div class="form-group" id="startDateForm">
								<label for="projectDate" class="col-sm-2 control-label">기간</label>
								<div class="col-sm-10">
									<c:if test="${project.pNo>0}">
										<input type="text" class="form-control" value="${project.projectDate}" name="projectDate" id="projectDate1" readonly="readonly">
									</c:if>
								</div>
			                </div>
			                <div class="form-group">
		                		<label class="col-sm-2 control-label">설명</label>
			                 	<div class="col-sm-10">
			                 		 <textarea name="text" id="pText" placeholder="내역을 적어주세요."></textarea>
			                  	</div>
			                </div>
			                <div class="form-group">
		                		<label class="col-sm-2 control-label">예산</label>
			                 	<div class="col-sm-10">
			                 		 <input name="budget" type="text" class="form-control">
			                  	</div>
			                </div>
			                <div class="form-group">
		                		<label class="col-sm-2 control-label">프로젝트 매니저</label>
			                 	<div class="col-sm-10">
			                 		<select class="form-control" id="userSel" name="pm" style="width: 100%;">
			                 			<c:forEach items="${list2}" var="user">
					                		<option value="${user.email}">${user.username}</option>
					                	</c:forEach>
					                </select>
			                  	</div>
			                </div>
			              </div>
			              <!-- /.box-body -->
			              <div class="box-footer">
			                <a class="cancel btn btn-default">Cancel</a>
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
