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
		        <div class="ibox float-e-margins">
		        	<a data-toggle="modal" data-target="#myModal" class="btn btn-default pull-right">엑셀 데이터 업로드</a>&nbsp;
		        	<a href="/usageWrite?email=${user.email}" class="btn btn-default pull-right">글쓰기</a>
			        <div class="ibox-content">
			        	<div class="table-responsive">
				            <table class="table table-striped table-bordered table-hover dataTables-example" >
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
							                <td>${card.usageDateY}/${card.usageDateM}/${card.usageDateD}</td>
							                <td>${card.classifyCard}</td>
							                <td>${card.usageUser}</td>
							                <td>${card.usageCard}</td>
							                <td>${card.sales}</td>
							                <td>${card.memberStore}</td>
							                <td>${card.cost}</td>
							                <td>${card.abstract1}</td>
							                <td>${card.abstract2}</td>
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
<div class="modal inmodal" id="myModal" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
    <div class="modal-content animated fadeIn">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <p class="font-bold">파일 업로드</p>
            </div>
            <div class="modal-body">
            	<form id="excelUpForm" method="post" action="" role="form" enctype="multipart/form-data">
	                <div class="form-group">
		                <label>파일 선택</label>
		                <input id="excel" name="excel" class="file" type="file" multiple data-show-upload="false" data-show-caption="true">
	                </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-white" data-dismiss="modal">Close</button>
                <button type="button" id="excelUp" onclick="check()" class="btn btn-primary">Save changes</button>
            </div>
        </div>
    </div>
</div>
<%@include file="../include/footer.jsp" %>