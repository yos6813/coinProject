<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@include file="../include/header.jsp" %>
<div class="row wrapper border-bottom white-bg page-heading">
	<div class="col-lg-10">
	    <h1>
	      <b>Project View</b>
	    </h1>
	    <ol class="breadcrumb">
	      <li><a href="/home"><i class="fa fa-home"></i>Home</a></li>
	      <li><a href="/task?email=${user.email}">업무관리</a></li>
	      <li class="active">view</li>
	    </ol>
    </div>
</div>
<div class="wrapper-content">
	<div class="wrapper wrapper-content animated fadeInRight">
	    <div class="row">
	    	<form role="form" method="post">
	    		<input type="hidden" id="bNo" name="bNo" value="${board.bNo}">
	    	</form>
		    <div class="ibox float-e-margins">
               	<a href="/task?email=${user.email}" class="btn btn-white btn-sm pull-right">목록가기</a>
				<div class="ibox-content">
	                <div class="row">
	                    <div class="col-lg-12">
	                        <div class="m-b-md">
	                            <a id="pDel" class="btn btn-white btn-sm pull-right">삭제</a><a id="pMod" class="btn btn-white btn-sm pull-right">수정</a>
	                        </div>
	                        <dl class="dl-horizontal">
	                            <dt>상태: </dt> <dd><span class="boardStatus label">${board.status}</span></dd>
	                        </dl>
	                    </div>
	                </div>
	                <div class="row">
	                    <div class="col-lg-5">
	                        <dl class="dl-horizontal">
	                        	<dt>작성자:</dt> <dd>${board.writeName}</dd>
	                            <dt>프로젝트명:</dt> <dd> ${board.pName}</dd>
	                        </dl>
	                    </div>
	                    <div class="col-lg-7" id="cluster_info">
	                        <dl class="dl-horizontal" >
	                            <dt>프로젝트 기간:</dt> <dd> ${board.projectDate} </dd>
	                            <dt>프로젝트 매니저:</dt> <dd> ${board.pmName}</dd>
	                        </dl>
	                    </div>
	                </div>
	                <div class="row">
	                    <div class="col-lg-12">
	                        <dl class="dl-horizontal">
	                            <dt>내용:</dt>
	                            <dd>
	                                <div>
	                                	<p>${board.text}</p>
	                                </div>
	                            </dd>
	                        </dl>
	                    </div>
	                </div>
	                </div>
                </div>
                <div class="ibox">
					<div class="ibox-content">
						Activity
						<a href="/activityWrite?email=${user.email}&bNo=${board.bNo}" class="pull-right btn-sm btn btn-white">Activity 생성</a>
						<table class="table">
							<tr>
								<th style="width:100px">#</th>
								<th style="width: 300px">기간</th>
								<th>액티비티명</th>
								<th style="width: 250px">액티비티 매니저</th>
								<th style="width: 150px">일자</th>
							</tr>
							<c:forEach items="${list2}" var="board">
								<tr class="activityList1" value="${board.aNo}">
									<td>${board.aNo}</td>
									<td>${board.aDate }</td>
									<td>${board.aName}</td>
									<td>${board.aMName}</td>
									<td>${board.aWriteD}</td>
								</tr>
							</c:forEach>
						</table>
						<div class="text-center">
							<ul class="pagination">
								<c:if test="${pageMaker.prev}">
									<li class="page-item"><a class="page-link" href="/viewTask?email=${user.email}&bNo=${board.bNo}&page=${pageMaker.startPage-1}"><i class="fa fa-chevron-left"></i></a></li>
								</c:if>
								<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
									<li class="page-item" <c:out value="${pageMaker.cri.page} == idx?'class=active':''"/>>
										<a class="page-link" href="/viewTask?email=${user.email}&bNo=${board.bNo}&page=${idx}">${idx}</a>
									</li>
								</c:forEach>
								<c:if test="${pageMaker.next && pageMaker.endPage >0}">
									<li class="page-item"><a class="page-link" href="/viewTask?email=${user.email}&bNo=${board.bNo}&page=${pageMaker.endPage+1}">&raquo;</a></li>
								</c:if>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<%@include file="../include/footer.jsp" %>
