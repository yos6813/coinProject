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
		    <li><a href="/notifyList?email=${user.email}"><i class="fa fa-home"></i> Home</a></li>
		    <li class="active">View Project</li>
	     </ol>
     </div>
</div>
<div class="wrapper wrapper-content animated fadeInRight">
	<div class="row m-b-lg m-t-lg no-margins">
		<div class="col-md-9 no-padding">
			<div class="ibox">
		    	<div class="ibox-content">
		        	<div>	
		        		<form role="form" method="post">
				    		<input type="hidden" id="bNo" name="bNo" value="${board.bNo}">
				    	</form>
                        <a id="pDel1" class="btn btn-white btn-sm pull-right">삭제</a><a id="pMod1" class="btn btn-white btn-sm pull-right">수정</a>
				        <h3 style="float: left;" class="topmargin label" id="boardStatus">${board.status}</h3>
			            <h3 class="no-margin">
			                <strong>${board.pName}</strong>
			         	</h3>
			         	<h3 class="no-margin"><strong id="projectDday"></strong></h3>
			         	<div style="height: 40px; margin-left:65px;clear:both;">
				         	<p style="font-size: small;">${board.text}</p>
			         	</div>
		                <table class="table projectTbl">
			                <tbody>
		                	<tr>
		                		<td class="text-right  no-margins">
									프로젝트 매니저:
			                    </td>
			                    <td class="text-left  no-margins">
									<strong>${board.pmName}</strong>
			                    </td>
			                    <td class="text-right  no-margins">
									기간: 
			                    </td>
			                   	<td class=" no-margins">
									<strong id="projectPday">${board.projectDate}</strong>
			                    </td>
		                    </tr>
		                    <tr>
		                    	<td colspan="1" class="text-right no-margins" style="padding-top: 0;">
									액티비티 매니저:
			                    </td>
			                    <td colspan="3" class="text-left  no-margins" style="padding-top: 0;">
									<strong class=" no-margins">${board.aMName}</strong>
			                    </td>
			                </tr>
			                </tbody>
			            </table>
		            </div>
		        </div>
		    </div>
		</div>
        <div class="col-md-3" style="padding-right: 0;">
        	<div class="ibox">
		    	<div class="ibox-content" style="padding-bottom: 14px;">
			    	<table class="table projectTbl">
			    		<tr class="activity">
						<td class="text-right no-padding1 no-margins"><h3>전체:</h3></td>
						<td class="text-right no-padding1 no-margins">
							<h3 id="totalStatus"></h3>
						</td>
						</tr>
						<tr class="activity">
							<td class="text-info onlybottompadding text-right">진행:</td>
							<td class="text-right onlybottompadding" id="ongoing" value="${list3.size()}">${list3.size()}&nbsp;</td>
						</tr>
						<tr class="activity">
							<td class="text-success onlybottompadding text-right">완료:</td>
							<td class="text-right onlybottompadding" id="c​omplete" value="${list5.size()}">${list5.size()}&nbsp;</td>
						</tr>
						<tr class="activity">
							<td class="text-muted onlybottompadding text-right">대기:</td>
							<td class="text-right onlybottompadding" id="standby" value="${list4.size()}">${list4.size()}&nbsp;</td>
						</tr>
						<tr class="activity">
							<td class="text-warning onlybottompadding text-right">보류:</td>
							<td class="text-right onlybottompadding" id="defer" value="${list6.size()}">${list6.size()}&nbsp;</td>
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
                    <li class="active"><a data-toggle="tab" href="#tab-1">Task List</a></li>
                    <li class=""><a data-toggle="tab" href="#tab-2">인별 List</a></li>
                </ul>
                <div class="tab-content">
                    <div id="tab-1" class="tab-pane active">
                        <div class="panel-body">
                        	<div class="text-right pull-right">
	                       		<a href="/createTask?email=${user.email}&bNo=${board.bNo}" class="btn-sm btn btn-white" style="margin-bottom: 5px;">task 생성</a>
                        	</div>
                        	<div class="text-left" style="margin-top: 5px;">
	                        	Active: <label id="activeTitle">${board.aName}</label>
                        	</div>
							<table class="table">
								<tr>
									<th class="text-center"><small>상태</small></th>
									<th class="text-center"><small>D-day</small></th>
									<th class="text-center"><small>Task</small></th>
									<th class="text-center"><small>매니저</small></th>
								</tr>
								<c:forEach items="${list7}" var="board">
									<tr class="taskC" value="${board.tNo}">
										<td class="text-center"><p class="label projectTStatus">${board.tStatus}</p></td>
										<td class="text-center tDdayText"></td>
										<td style="padding-right:0;">
											<p class="no-padding no-margins">${board.tName}</p>
											<small class="tDateText">${board.tDate}</small>
											<small class="dayGap"></small>
										</td>
										<td class="text-center">${board.tMName}</td>
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