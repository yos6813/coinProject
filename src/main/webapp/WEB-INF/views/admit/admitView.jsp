<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@include file="../include/header.jsp" %>
<!-- Content Wrapper. Contains page content -->
 <div class="row wrapper border-bottom white-bg page-heading">
      <h1>
		<b>관리자 페이지</b>
      </h1>
      <ol class="breadcrumb">
        <li><a href="home?email=${user.email}"><i class="fa fa-home"></i>Home</a></li>
        <li class="active">admit</li>
      </ol>
</div>
   <div class="wrapper-content">
    <div class="wrapper wrapper-content animated fadeInRight">
		<div class="row">
			<!-- 프로젝트 -->	
			<div class="col-md-6">
				<div class="ibox">
					<h3 class="box-title"><b>프로젝트 리스트</b></h3>
					<div class="ibox-content">
						<div class="form-group">
							<table id="projectTbl" class="table">
								<tr>
				                  <th>#</th>
				                  <th>프로젝트명</th>
				                  <th>기간</th>
				                </tr>
								<c:forEach items="${list}" var="project">
					                <tr class="project" value="${project.pNo}">
					                	<td>${project.pNo}</td>
					                	<td>${project.pName}</td>
					                	<td>${project.projectDate}</td>
					                </tr>
								</c:forEach>
							</table>
						</div>
					</div>
				</div>
				<div class="ibox">
					<h3 class="box-title"><b>프로젝트 등록</b></h3>
					<div class="ibox-content">
						<form role="form" method="post" action="/registProject?email=${user.email}">
								<div class="form-group col-md-4">
									<select class="form-control" name="status">
										<option value="진행중">진행중</option>
										<option value="대기">대기</option>
										<option value="완료">완료</option>
										<option value="보류">보류</option>
									</select>
								</div>
								<div class="form-group col-md-8">
									<input class="form-control" name="pName" type="text" id="sample3" placeholder="프로젝트명 입력">
								</div>
								<div class="form-group col-md-8">
	    							<div class="input-group">
					                  <div class="input-group-addon">
					                    <i class="fa fa-clock-o"></i>
					                  </div>
					                  <input type="text" class="form-control pull-right" name="projectDate" id="projectDate">
					                </div>
								</div>
								<div class="form-group" style="display: none;">
	   								<input class="form-control" type="text" value="${user.email}" name="adminUser">
								</div>
								<button type="submit" class="btn bg-navy">등록</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<%@include file="../include/footer.jsp" %>