<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@include file="../include/header.jsp" %>
	  <div class="row wrapper border-bottom white-bg page-heading">
		<h1>
			<b>수정</b>
	    </h1>
	    <ol class="breadcrumb">
	      <li><a href="home?email=${user.email}"><i class="fa fa-home"></i> Home</a></li>
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
						<form class="form-horizontal wizard-big" method="post" action="/modifyBoard?email=${user.email}&bNo=${board.bNo}">
			              <div class="box-body">
			              	<div class="form-group">
		                		<label class="col-sm-2 control-label">프로젝트명</label>
			                 	<div class="col-sm-10">
			                 	<input type="hidden" class="form-control" name="pNo" value="${board.pNo}">
			                		<input type="text" class="form-control" name="pName" value="${board.pName}">
			                  	</div>
			                </div>
			                <div class="form-group">
								<label for="projectDate" class="col-sm-2 control-label">기간</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" value="${board.projectDate}" name="projectDate" id="projectDate1">
								</div>
			                </div>
			                <div class="form-group">
		                		<label class="col-sm-2 control-label">설명</label>
			                 	<div class="col-sm-10">
			                 		 <textarea name="text" id="pText" placeholder="내역을 적어주세요.">${board.text}</textarea>
			                  	</div>
			                </div>
			                <div class="form-group">
		                		<label class="col-sm-2 control-label">프로젝트 매니저</label>
			                 	<div class="col-sm-10">
			                 		<input type="hidden" class="form-control" id="pM1" value="${board.pm}" readonly="readonly">
			                 		<select class="form-control" id="userSel1" name="pm" style="width: 100%;">
			                 			<c:forEach items="${list1}" var="user">
					                		<option value="${user.email}">${user.username}</option>
					                	</c:forEach>
					                </select>
			                  	</div>
			                </div>
			                <div class="form-group">
		                		<label class="col-sm-2 control-label">예산</label>
			                 	<div class="col-sm-10">
			                 		 <input name="budget" type="text" value="${board.budget}" class="form-control" placeholder="필요 시 작성">
			                  	</div>
			                </div>
			              </div>
			              <!-- /.box-body -->
			              <div class="box-footer text-right">
			                <button class="btn btn-default">취소</button>
			                <button type="submit" class="btn btn-info">수정</button>
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
