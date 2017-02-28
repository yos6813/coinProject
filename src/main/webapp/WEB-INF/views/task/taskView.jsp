<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@include file="../include/header.jsp" %>
<!-- Content Wrapper. Contains page content -->
  <!-- Content Header (Page header) -->
	<div class="row wrapper border-bottom white-bg page-heading">
		<div class="col-lg-10">
		    <h1>
		      <b>Task View</b>
		    </h1>
		    <ol class="breadcrumb">
		      <li><a href="/home"><i class="fa fa-home"></i>Home</a></li>
		      <li><a href="/viewActivity?email=${user.email}&bNo=${board.bNo}&aNo=${board.aNo}">project view</a></li>
		      <li class="active">task view</li>
		    </ol>
	    </div>
	</div>
<div class="wrapper-content">
	<div class="wrapper wrapper-content animated fadeInRight">
	    <div class="row">
	    	<div class="col-md-12">
				<div class="ibox float-e-margins">
				<h2><b>Project</b></h2>
				<div class="ibox-content">
                          <div class="row">
                              <div class="col-lg-12">
                              	<div class="m-b-md">
			                    	<a href="/viewActivity?email=${user.email}&bNo=${board.bNo}&aNo=${board.aNo}" class="btn btn-white btn-sm pull-right">목록가기</a>
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
				<h2><b>Activity</b></h2>
				<div class="ibox float-e-margins">
						<div class="ibox-content">
                            <div class="row">
                                <div class="col-lg-12">
                                    <dl class="dl-horizontal">
                                        <dt>상태: </dt> <dd><span class="aStatus label">${board.aStatus}</span></dd>
                                    </dl>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-5">
                                    <dl class="dl-horizontal">
                                    	<dt>작성자:</dt> <dd>${board.aWriteU}</dd>
                                        <dt>액티비티명:</dt> <dd> ${board.aName}</dd>
                                    </dl>
                                </div>
                                <div class="col-lg-7" id="cluster_info">
                                    <dl class="dl-horizontal" >
                                        <dt>기간:</dt> <dd> ${board.aDate} </dd>
                                        <dt>액티비티 매니저:</dt> <dd> ${board.aM}</dd>
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
					<h2><b>Task</b></h2>
					<div class="ibox float-e-margins">
						<div class="ibox-content">
                            <div class="row">
                            	<form id="tForm" role="form" method="post">
						    		<input type="hidden" name="tNo" value="${board.tNo}">
						    	</form>
                                <div class="col-lg-12">
                                	<div class="m-b-md">
			                    		<a id="tDel" class="btn btn-white btn-sm pull-right">삭제</a><a id="tMod" class="btn btn-white btn-sm pull-right">수정</a>
			               			</div>
                                    <dl class="dl-horizontal">
                                        <dt>상태: </dt> <dd><span class="tStatus label">${board.tStatus}</span></dd>
                                    </dl>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-5">
                                    <dl class="dl-horizontal">
                                    	<dt>작성자:</dt> <dd>${board.tWriteName}</dd>
                                        <dt>테스크명:</dt> <dd> ${board.tName}</dd>
                                    </dl>
                                </div>
                                <div class="col-lg-7" id="cluster_info">
                                    <dl class="dl-horizontal" >
                                        <dt>기간:</dt> <dd> ${board.tDate} </dd>
                                        <dt>테스크 매니저:</dt> <dd> ${board.tMName}</dd>
                                    </dl>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-12">
                                    <dl class="dl-horizontal">
                                        <dt>내용:</dt>
                                        <dd>
                                            <div>
                                            	<p>${board.tText}</p>
                                            </div>
                                        </dd>
                                    </dl>
                                </div>
                            </div>
                        </div>
					</div>
					<div class="ibox">
						<div class="ibox-content">
							Task List
							<a href="/createTask?email=${user.email}&bNo=${board.bNo}&aNo=${board.aNo}" class="pull-right btn-sm btn btn-white">task 생성</a>
							<table class="table">
								<tr>
									<th style="width:100px">#</th>
									<th style="width: 300px">기간</th>
									<th>Task Name</th>
									<th style="width: 250px">Task 매니저</th>
									<th style="width: 150px">일자</th>
								</tr>
								<c:forEach  items="${list}" var="board">
									<tr class="taskList" value="${board.tNo}">
										<td>${board.tNo}</td>
										<td>${board.tDate}</td>
										<td>${board.tName}</td>
										<td>${board.tMName}</td>
										<td>${board.tWriteD}</td>
									</tr>
								</c:forEach>
							</table>
							<div class="text-center">
							<ul class="pagination">
								<c:if test="${pageMaker.prev}">
									<li class="page-item"><a class="page-link" href="/viewActivity?email=${user.email}&bNo=${board.bNo}&aNo=${board.aNo}&page=${pageMaker.startPage-1}"><i class="fa fa-chevron-left"></i></a></li>
								</c:if>
								<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
									<li class="page-item" <c:out value="${pageMaker.cri.page} == idx?'class=active':''"/>>
										<a class="page-link" href="/viewActivity?email=${user.email}&bNo=${board.bNo}&aNo=${board.aNo}&page=${idx}">${idx}</a>
									</li>
								</c:forEach>
								<c:if test="${pageMaker.next && pageMaker.endPage >0}">
									<li class="page-item"><a class="page-link" href="/viewActivity?email=${user.email}&bNo=${board.bNo}&aNo=${board.aNo}&page=${pageMaker.endPage+1}">&raquo;</a></li>
								</c:if>
							</ul>
						</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<%@include file="../include/footer.jsp" %>
