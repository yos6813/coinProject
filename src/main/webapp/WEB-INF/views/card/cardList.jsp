<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="../include/header.jsp" %>
<div class="row wrapper border-bottom white-bg page-heading">
	<div class="col-lg-10">
		<h1>
			<b>법인카드 사용내역 관리</b>
		</h1>
		<ol class="breadcrumb">
			<li><a href="/projectList?email=${user.email}"><i class="fa fa-home"></i> Home</a></li>
			<li class="active">법인카드 사용내역 관리</li>
		</ol>
	</div>
</div>
<div class="wrapper-content">
	<div class="wrapper wrapper-content animated fadeInRight">
	    <div class="row">
	        <div class="col-lg-12">
	        	<div class="tabs-container">
                       <ul class="nav nav-tabs">
                           <li class="active"><a data-toggle="tab" href="#tab-1">Dashboard</a></li>
                           <li class=""><a data-toggle="tab" href="#tab-2">List</a></li>
                       </ul>
                       <div class="tab-content">
                           <div id="tab-1" class="tab-pane active">
                               <div class="panel-body">
                               		<div class="form-inline">
	                               		<div class="form-group col-md-2">
		                               		<select id="chartYear" class="form-control">
		                               			<option value="2017">2017년</option>
		                               		</select>
	                               		</div>
			                            <div class="form-group col-md-4">
			                                <label for="accrueCost">총 누적금액:</label>
			                                <input type="text" class="form-control" id="accrueCost" value="${cost.count}원">
			                            </div>
									</div>
                               		<div id="chart1"></div>
                               		<div style="display:none;">
                               			<table class="table">
                               				<thead>
                               					<tr>
                               						<th>연도</th>
                               						<th>날짜</th>
                               						<th>금액</th>
                               					</tr>
                               				</thead>
                               				<tbody>
                               					<c:forEach items="${list1}" var="card">
                               						<tr class="dateCostTbl">
                               							<td class="concatYear">${card.concatYear}</td>
                               							<td class="concatDate">${card.concatDate}</td>
                               							<td class="sumCost">${card.sumCost}</td>
                               						</tr>
                               					</c:forEach>
                               				</tbody>
                               			</table>
                               		</div>
                               		<hr>
                               		<div class="form-inline">
	                               		<div class="form-group col-md-2">
		                               		<select id="chartMonth" class="form-control">
		                               		</select>
	                               		</div>
									</div>
									<div id="userCostChart"></div>
									<div style="display:none;">
                               			<table class="table">
                               				<thead>
                               					<tr>
                               						<td>날짜</td>
                               						<th>항목</th>
                               						<th>금액</th>
                               					</tr>
                               				</thead>
                               				<tbody>
                               					<c:forEach items="${list3}" var="card">
                               						<tr class="orderByabstract1Tbl">
                               							<td class="abstract1Date" value="${card.concatDate}">${card.concatDate}</td>
                               							<td class="orderByAbstract1">${card.abstract1}</td>
                               							<td class="abstract1SumCost">${card.sumCost}</td>
                               						</tr>
                               					</c:forEach>
                               				</tbody>
                               			</table>
                               		</div>
                               		<hr>
									<div id="userCostGraph"></div>
									<div style="display:none;">
                               			<table class="table">
                               				<thead>
                               					<tr>
                               						<td>날짜</td>
                               						<th>이름</th>
                               						<th>금액</th>
                               					</tr>
                               				</thead>
                               				<tbody>
                               					<c:forEach items="${list2}" var="card">
                               						<tr class="orderByUserTbl">
                               							<td class="userDate" value="${card.concatDate}">${card.concatDate}</td>
                               							<td class="orderByUser">${card.usageUser}</td>
                               							<td class="userSumCost">${card.sumCost}</td>
                               						</tr>
                               					</c:forEach>
                               				</tbody>
                               			</table>
                               		</div>
                               </div>
                           </div>
                           <div id="tab-2" class="tab-pane">
                               <div class="panel-body">
                               	<a data-toggle="modal" data-target="#myModal" class="btn btn-default pull-right">엑셀 데이터 업로드</a>&nbsp;
					        	<a href="/usageWrite?email=${user.email}&abNo=1" class="btn btn-default pull-right">글쓰기</a>
					        	<hr>
					        	<div class="table-responsive">
						            <table class="table table-striped table-bordered table-hover dataTables-example">
							            <thead>
							            <tr>
							            	<th>No</th>
							                <th>이용일자</th>
							                <th>카드구분</th>
							                <th>사용자</th>
							                <th>사용카드</th>
							                <th>매출구분</th>
							                <th>이용가맹점(은행)명</th>
							                <th>이용금액</th>
							                <th>적요1</th>
							                <th>적요2</th>
							                <th>비고</th>
							            </tr>
							            </thead>
							            <tbody>
								            <c:forEach items="${list}" var="card">
									            <tr class="gradeX">
									            	<td>${card.cNo}</td>
									                <td class="listDate" value="${card.usageDate}">${card.usageDate}</td>
									                <td>${card.classifyCard}</td>
									                <td>${card.usageUser}</td>
									                <td>${card.usageCard}</td>
									                <td>${card.sales}</td>
									                <td>${card.memberStore}</td>
									                <td class="listCost">${card.cost}</td>
									                <td>${card.abName}</td>
									                <td>${card.ab2Name}</td>
									                <td>${card.note}</td>
									            </tr>
								            </c:forEach>
							            </tbody>
							            <tfoot>
							            <tr>
							            	<th>No</th>
							               	<th>이용일자</th>
							                <th>카드구분</th>
							                <th>사용자</th>
							                <th>사용카드</th>
							                <th>매출구분</th>
							                <th>이용가맹점(은행)명</th>
							                <th>이용금액</th>
							                <th>적요1</th>
							                <th>적요2</th>
							                <th>비고</th>
							            </tr>
							            </tfoot>
				            		</table>
				            	</div>
                               </div>
                           </div>
                      </div>
                 </div>
	    	</div>
		</div>
	</div>
</div>
<div class="modal inmodal" id="myModal" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
	   	<form id="massiveForm" name="massiveForm" enctype="multipart/form-data" method="post" 
              action= "/massiveWrite?email=${user.email}">
	    	<div class="modal-content animated fadeIn">
	            <div class="modal-header">
	                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
	                <p class="font-bold">파일 업로드</p>
	            </div>
	            <div class="modal-body">
				    <div class="contents">
				        <dl class="vm_name">
			                <dt class="down w90">첨부 파일</dt>
			                <dd><input id="excelFile" type="file" name="excelFile" /></dd>
				        </dl>        
				    </div>
	            </div>
	            <div class="modal-footer">
	                <button type="button" class="btn btn-white" data-dismiss="modal">닫기</button>
	                <button type="submit" id="addExcelImpoartBtn" class="btn btn-primary">업로드</button>
	            </div>
	        </div>
		</form>
    </div>
</div>
<%@include file="../include/footer.jsp" %>