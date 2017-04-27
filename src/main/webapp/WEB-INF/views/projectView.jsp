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
		    <li><a href="/home?email=${user.email}"><i class="fa fa-home"></i> Home</a></li>
		    <li class="active">View Project</li>
	     </ol>
     </div>
</div>
<div class="wrapper wrapper-content animated fadeInRight">
	<div class="row m-b-lg m-t-lg no-margins">
		<div class="col-md-12 no-padding">
			<div class="ibox">
		    	<div class="ibox-content">
		        	<div>	
		        		<form role="form" method="post" id="projectForm">
				    		<input type="hidden" id="bNo" name="bNo" value="${board.bNo}">
				    	</form>
                        <a id="pDel1" class="btn btn-white btn-sm pull-right">삭제</a><a href="modifyP?email=${user.email}&bNo=${board.bNo}" class="btn btn-white btn-sm pull-right">수정</a>
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
		                		<td class="text-right no-margins" style="width:160px;">
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
			                </tbody>
			            </table>
		            </div>
		        </div>
		    </div>
		</div>
	</div>
    <div class="row">
    	<div class="col-lg-12">
    		<div class="ibox float-e-margins">
    			<div class="ibox-content">
    				<a href="/activityWrite?email=${user.email}&bNo=${board.bNo}" class="pull-right btn-sm btn btn-white">Activity 생성</a>
		    		<table class="table">
		    			<tr>
		    				<th>상태</th>
		    				<th style="width:150px">액티비티명</th>
		    				<th>매니저</th>
		    				<th style="width:200px">기간</th>
		    				<th>투입시간</th>
		    			</tr>
						<c:forEach items="${list2}" var="board">
							<c:set value="${board.wTimeH}" var="hour"></c:set>
		    				<c:set value="${board.wTimeM}" var="minute"></c:set>
			    			<tr class="activityListTr" value="${board.aNo}">
			    				<td><p class="label activityStatus">${board.aStatus}</p></td>
			    				<td>${board.aName}</td>
			    				<td><img src="${board.photoURL}" class="img-circle"><br><small>${board.aMName}</small></td>
			    				<td>
			    					<strong class="activityDday"></strong><br>
			    					<small class="activityDay">${board.aDate}</small>
		    					</td>
			    				<td>
			    					<c:if test="${hour > 0}">
			    						<strong class="text-info">${board.wTimeH}h</strong>
			    					</c:if>
			    					<c:if test="${minute > 0}">
			    				 		<strong class="text-info">${board.wTimeM}m</strong>
			    				 	</c:if>
			    				 	<c:if test="${hour eq null}">
			    						<strong class="text-info">0h</strong>
			    					</c:if>
			    					<c:if test="${minute eq null}">
			    				 		<strong class="text-info">0m</strong>
			    				 	</c:if>
			    				</td>
			    			</tr>
						</c:forEach>
		    		</table>
		    		<div class="text-center">
						<ul class="pagination">
							<c:if test="${pageMaker.prev}">
								<li class="page-item"><a class="page-link" href="/projectView?email=${user.email}&bNo=<%= request.getParameter("bNo") %>&page=${pageMaker.startPage-1}"><i class="fa fa-chevron-left"></i></a></li>
							</c:if>
							<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
								<li class="page-item" <c:out value="${pageMaker.cri.page} == idx?'class=active':''"/>>
									<a class="page-link" href="/projectView?email=${user.email}&bNo=${board.bNo}&page=${idx}">${idx}</a>
								</li>
							</c:forEach>
							<c:if test="${pageMaker.next && pageMaker.endPage >0}">
								<li class="page-item"><a class="page-link" href="/projectView?email=${user.email}&bNo=${board.bNo}&page=${pageMaker.endPage+1}">&raquo;</a></li>
							</c:if>
						</ul>
					</div>
    			</div>
    		</div>
    	</div>
    </div>
</div>
<%@include file="include/footer.jsp" %>