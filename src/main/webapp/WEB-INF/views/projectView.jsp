<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@include file="include/header.jsp" %>

<div class="row wrapper border-bottom white-bg page-heading">
    <div class="col-lg-10">
         <h1>
   			<b>View Project</b>
	 	 </h1>
         <ol class="breadcrumb">
		    <li><a href="/projectView?email=${user.email}"><i class="fa fa-home"></i> Home</a></li>
		    <li class="active">View Project</li>
	     </ol>
     </div>
</div>
<div class="wrapper wrapper-content animated fadeInRight">
	<div class="row m-b-lg m-t-lg">
		<div class="col-md-8">
			<div class="ibox">
		    	<div class="ibox-content">
		        	<div>	
		        		<form role="form" method="post">
				    		<input type="hidden" id="bNo" name="bNo" value="${board.bNo}">
				    	</form>
				        <p class="label" id="boardStatus">${board.status}</p>
		        		<div class="m-b-md">
                            <a id="pDel1" class="btn btn-white btn-sm pull-right">삭제</a><a id="pMod1" class="btn btn-white btn-sm pull-right">수정</a>
                        </div>
			            <h2 class="no-margins">
			                ${board.pName}
			         	</h2><br>
		             	<p>${board.text}</p><br><br><br>
		                <table class="table small m-b-xs">
			                <tbody>
			                <tr>
			                    <td>
									매니저 <strong>${board.pmName}</strong>
			                    </td>
			                    <td>
									참여인원  <strong>${board.joinUser}</strong> 
			                    </td>
			                   	<td>
									기간 <strong id="projectPday">${board.projectDate }</strong>
			                    </td>
			                    <td>
									D<strong id="projectDday"></strong>
			                    </td>
			                </tr>
			                </tbody>
			            </table>
		            </div>
		        </div>
		    </div>
		</div>
        <div class="col-md-4">
        	<div class="ibox">
		    	<div class="ibox-content">
			    	<h3>Activity Status</h3>
			    	<table class="table">
			    		<tr class="activity">
						<td class="text-primary">전체</td>
						<td id="totalStatus">
							
						</td>
						</tr>
						<tr class="activity">
							<td class="text-info">진행중</td>
							<td id="ongoing" value="${list3.size()}">${list3.size()}&nbsp;</td>
						</tr>
						<tr class="activity">
							<td class="text-success">완료</td>
							<td id="c​omplete" value="${list5.size()}">${list5.size()}&nbsp;</td>
						</tr>
						<tr class="activity">
							<td class="text-muted">대기</td>
							<td id="standby" value="${list4.size()}">${list4.size()}&nbsp;</td>
						</tr>
						<tr class="activity">
							<td class="text-warning">보류</td>
							<td id="defer" value="${list6.size()}">${list6.size()}&nbsp;</td>
						</tr>
			      	</table>
		      	</div>
	      	</div>
       </div>
	</div>
    <div class="row">
        <div class="col-lg-6">
        	<div class="social-feed-box">
                <div class="social-avatar">
                    <div class="media-body">
                    	<a href="/activityWrite?email=${user.email}&bNo=${board.bNo}" class="pull-right btn-sm btn btn-white">Activity 생성</a>
                    </div>
                </div>
                <div id="chart"></div>
            </div>
            <div class="ibox" style="display: none;">
                <div class="ibox-content">
                    <table class="table">
                    	<tr class="activity">
							<th>액티비티명</th>
							<th>기간</th>
							<th>상태</th>
							<th>매니저</th>
							<th>진행중</th>
							<th>대기</th>
							<th>완료</th>
							<th>보류</th>
						</tr>
						<c:forEach items="${list1}" var="board">
						<tr class="activeC">
							<td value="${board.aNo}">${board.aName}</td>
							<td value="${board.aDate}">${board.aDate}</td>
							<td value="${board.aStatus}">${board.aStatus}</td>
							<td value="${board.aM}">${board.aMName}</td>
							<td value="${board.ongoing}">${board.ongoing}</td>
							<td value="${board.standby}">${board.standby}</td>
							<td value="${board.complete}">${board.complete}</td>
							<td value="${board.defer}">${board.defer}</td>
						</tr>
						</c:forEach>
              		</table>
                </div>
            </div>
        </div>
        <div class="col-lg-6 m-b-lg">
        	<div class="tabs-container">
                <ul class="nav nav-tabs">
                    <li class="active"><a data-toggle="tab" href="#tab-1"> 테스크 리스트</a></li>
                    <li class=""><a data-toggle="tab" href="#tab-2">인별 테스크 통계</a></li>
                </ul>
                <div class="tab-content">
                    <div id="tab-1" class="tab-pane active">
                        <div class="panel-body">
                        	<a href="/createTask?email=${user.email}&bNo=${board.bNo}" class="pull-right btn-sm btn btn-white">task 생성</a>
							<table class="table">
								<tr>
									<th>#</th>
									<th>기간</th>
									<th>테스크명</th>
									<th>테스크 매니저</th>
									<th>일자</th>
								</tr>
								<c:forEach items="${list7}" var="board">
									<tr value="${board.tNo}">
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
										<li class="page-item"><a class="page-link" href="/projectView?email=${user.email}&bNo=<%= request.getParameter("aNo") %>&aNo=${board.aNo}&page=${pageMaker.startPage-1}"><i class="fa fa-chevron-left"></i></a></li>
									</c:if>
									<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
										<li class="page-item" <c:out value="${pageMaker.cri.page} == idx?'class=active':''"/>>
											<a class="page-link" href="/projectView?email=${user.email}&bNo=${board.bNo}&aNo=<%= request.getParameter("aNo") %>&page=${idx}">${idx}</a>
										</li>
									</c:forEach>
									<c:if test="${pageMaker.next && pageMaker.endPage >0}">
										<li class="page-item"><a class="page-link" href="/projectView?email=${user.email}&bNo=${board.bNo}&aNo=<%= request.getParameter("aNo") %>&page=${pageMaker.endPage+1}">&raquo;</a></li>
									</c:if>
								</ul>
							</div>
                        </div>
                    </div>
                    <div id="tab-2" class="tab-pane">
                        <div class="panel-body">
                        	<table class="table">
								<tr>
									<th>테스크 매니저</th>
									<th>전체</th>
									<th>진행중</th>
									<th>대기</th>
									<th>완료</th>
									<th>보류</th>
								</tr>
								<c:forEach items="${list10}" var="board">
									<tr>
										<td><img class="img-circle" src="${board.tMPhoto}"><br><small>${board.tMName}</small></td>
										<td>${board.count}</td>
										<td>${board.ongoing}</td>
										<td>${board.standby}</td>
										<td>${board.complete}</td>
										<td>${board.defer}</td>
									</tr>
								</c:forEach>
							</table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="include/footer.jsp" %>