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
        <li><a href="/"><i class="fa fa-home"></i>Home</a></li>
        <li class="active">admit</li>
      </ol>
</div>
   <div class="wrapper-content">
    <div class="wrapper wrapper-content animated fadeInRight">
		<div class="row">
			<!-- 적요1 -->	
			<div class="col-md-6">
				<div class="ibox">
					<div class="ibox-title"><b>리스트</b></div>
					<div class="ibox-content">
						<div class="form-group">
							<table id="admitAbstract1" class="table">
								<tr>
				                  <th style="width:100px">#</th>
				                  <th>적요1</th>
				                </tr>
								<c:forEach items="${list3}" var="admit">
					                <tr class="admitAbstract1" value="${admit.abNo}">
					                	<td>${admit.abNo}</td>
					                	<td>${admit.abName}</td>
					                </tr>
								</c:forEach>
							</table>
							<div class="text-center">
								<ul class="pagination">
									<c:if test="${pageMaker.prev}">
										<li class="page-item"><a class="page-link" href="/abstractPage?email=${user.email}&abNo=${admit.abNo}&page=${pageMaker.startPage-1}"><i class="fa fa-chevron-left"></i></a></li>
									</c:if>
									<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
										<li class="page-item" <c:out value="${pageMaker.cri.page} == idx?'class=active':''"/>>
											<a class="page-link" href="/abstractPage?email=${user.email}&abNo=${admit.abNo}&page=${idx}">${idx}</a>
										</li>
									</c:forEach>
									<c:if test="${pageMaker.next && pageMaker.endPage >0}">
										<li class="page-item"><a class="page-link" href="/abstractPage?email=${user.email}&abNo=${admit.abNo}&page=${pageMaker.endPage+1}">&raquo;</a></li>
									</c:if>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<div class="ibox">
					<div class="ibox-title"><b>등록</b></div>
					<div class="ibox-content">
						<form role="form" method="post" action="/registAbstract?email=${user.email}&abNo=1&page=1">
							<div class="form-group col-md-8">
								<input class="form-control" name="abName" type="text" id="sample3" placeholder="텍스트 입력">
							</div>
							<button type="submit" class="btn btn-default">등록</button>
						</form>
					</div>
				</div>
			</div>
			<!-- 적요2 -->
			<div class="col-md-6">
				<div class="ibox">
					<div class="ibox-title"><b>리스트</b></div>
					<div class="ibox-content">
						<div class="form-group">
							<table id="admitAbstract2" class="table">
								<tr>
				                  <th>#</th>
				                  <th>적요1</th>
				                  <th>적요2</th>
				                </tr>
								<c:forEach items="${list2}" var="admit">
					                <tr class="admitAbstract2" value="${admit.ab2No}">
					                	<td>${admit.ab2No}</td>
					                	<td>${admit.abName}</td>
					                	<td>${admit.ab2Name}</td>
					                </tr>
								</c:forEach>
							</table>
						</div>
					</div>
				</div>
				<div class="ibox">
					<div class="ibox-title"><b>등록</b></div>
					<div class="ibox-content">
						<form role="form" method="post" class="form-inline" action="/registAbstract2?email=${user.email}&page=1">
                            <div class="form-group">
                                <label for="abstractNo">적요:</label>
                                <input type="text" class="form-control" id="abstractNo" name="abNo">
                            </div>
                            <div class="form-group">
                                <input type="text" class="form-control" id="ab2Name" name="ab2Name" placeholder="텍스트 입력">
                            </div>
							<button type="submit" class="btn btn-default">등록</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<%@include file="../include/footer.jsp" %>