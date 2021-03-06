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
	      <li><a href="home?email=${user.email}"><i class="fa fa-home"></i> Home</a></li>
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
			                		<input type="text" class="form-control" name="pName">
			                		<input type="hidden" value="${user.email}" name="adminUser">
			                  	</div>
			                </div>
			                <div class="form-group">
								<label for="projectDate" class="col-sm-2 control-label">기간</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" name="projectDate" id="projectDate1">
								</div>
			                </div>
			                <div class="form-group">
		                		<label class="col-sm-2 control-label">설명</label>
			                 	<div class="col-sm-10">
			                 		 <textarea name="text" id="pText" placeholder="내역을 적어주세요."></textarea>
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
			                <div class="form-group">
		                		<label class="col-sm-2 control-label">예산</label>
			                 	<div class="col-sm-10">
			                 		 <input name="budget" type="text" class="form-control" value="0">
			                  	</div>
			                </div>
			              </div>
			              <!-- /.box-body -->
			              <div class="box-footer text-right">
			                <a class="cancel btn btn-default">취소</a>
			                <button type="submit" class="btn btn-info">생성하기</button>
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
