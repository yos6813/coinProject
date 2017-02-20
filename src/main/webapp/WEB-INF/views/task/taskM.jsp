<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@include file="../include/header.jsp" %>
<!-- Content Wrapper. Contains page content -->
  <!-- Content Header (Page header) -->
	<div class="row wrapper border-bottom white-bg page-heading">
	     <div class="col-lg-10">
	         <h1>
	   			<b>업무관리</b>
		 	 </h1>
	         <ol class="breadcrumb">
			    <li><a href="/home"><i class="fa fa-home"></i> Home</a></li>
			    <li class="active">업무관리</li>
		     </ol>
	     </div>
	 </div>
<div class="wrapper-content">
	 <div class="wrapper wrapper-content animated fadeInRight">
		<div class="row">
			<div class="col-md-12">
				<div class="ibox float-e-margins">
						<div class="ibox-content">
							<div class="form-group">
								<div class="col-md-2">
									<select id="searchP" name="searchP" class="form-control col-xs-5">
										<option value="pName">프로젝트명</option>
										<option value="pm">프로젝트 매니저</option>
									</select>
								</div>
								<div class="col-md-5">
										<input class="form-control pull-right col-xs-5" type="text" id="searchProject" placeholder="검색">
								</div>
								<div class="col-md-2">
									<a id="searchBtn" class="btn btn-white"><i class="fa fa-search"></i></a>
								</div>
								<div class="col-md-2 pull-right">
									<a href="/taskWrite?email=${user.email}" type="button"  class="btn btn-primary btn-sm">글쓰기</a>
								</div>
							</div>
						<table class="table">
							<tr>
								<th style="width:50px">#</th>
								<th>상태</th>
								<th style="width: 200px">기간</th>
								<th>프로젝트명</th>
								<th>관리자</th>
								<th style="width: 150px">프로젝트 매니저</th>
								<th style="width: 150px">일자</th>
							</tr>
							<c:forEach items="${list}" var="board">
								<tr class="boardList" value="${board.bNo}">
									<td style="width:50px">${board.bNo}</td>
									<td><p class="boardStatus">${board.status}</p></td>
									<td style="width: 200px">${board.projectDate}<br/><small></small></td>
									<td>${board.pName}</td>
									<td style="width: 150px"><img class="img-circle" src="${board.writePhoto}"><br/><small>${board.writeUser}</small> </td>
									<td><img class="img-circle" src="${board.pmPhoto}"><br/><small>${board.pm}</small></td>
									<td style="width: 150px">${board.writeDate}</td>
								</tr>
							</c:forEach>
						</table>
						<jsp:include page="../include/paging.jsp" flush="true">
						    <jsp:param name="firstPageNo" value="${paging.firstPageNo}" />
						    <jsp:param name="prevPageNo" value="${paging.prevPageNo}" />
						    <jsp:param name="startPageNo" value="${paging.startPageNo}" />
						    <jsp:param name="pageNo" value="${paging.pageNo}" />
						    <jsp:param name="endPageNo" value="${paging.endPageNo}" />
						    <jsp:param name="nextPageNo" value="${paging.nextPageNo}" />
						    <jsp:param name="finalPageNo" value="${paging.finalPageNo}" />
						</jsp:include>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<%@include file="../include/footer.jsp" %>