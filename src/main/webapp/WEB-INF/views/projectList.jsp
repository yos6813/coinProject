<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@include file="include/header.jsp" %>
<!-- Content Wrapper. Contains page content -->
  <!-- Content Header (Page header) -->
	<div class="row wrapper border-bottom white-bg page-heading">
	     <div class="col-lg-10">
	         <h1>
	   			<b>Project List</b>
		 	 </h1>
	         <ol class="breadcrumb">
			    <li><a href="/home"><i class="fa fa-home"></i> Home</a></li>
			    <li class="active">Project List</li>
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
								<tr class="projectList" value="${board.bNo}">
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
						<div class="text-center">
							<ul class="pagination">
								<c:if test="${pageMaker.prev}">
									<li class="page-item"><a class="page-link" href="/projectList?email=${user.email}&page=${pageMaker.startPage-1}"><i class="fa fa-chevron-left"></i></a></li>
								</c:if>
								<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
									<li class="page-item" <c:out value="${pageMaker.cri.page} == idx?'class=active':''"/>>
										<a class="page-link" href="/projectList?email=${user.email}&page=${idx}">${idx}</a>
									</li>
								</c:forEach>
								<c:if test="${pageMaker.next && pageMaker.endPage >0}">
									<li class="page-item"><a class="page-link" href="/projectList?email=${user.email}&page=${pageMaker.endPage+1}">&raquo;</a></li>
								</c:if>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<%@include file="include/footer.jsp" %>