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
		        	<a class="btn btn-default pull-right">글쓰기</a>
			        <div class="ibox-content">
			        	<div class="table-responsive">
				            <table class="table table-striped table-bordered table-hover dataTables-example" >
					            <thead>
					            <tr>
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
					            <tr class="gradeX">
					                <td>Trident</td>
					                <td>Internet
					                    Explorer 4.0
					                </td>
					                <td>Win 95+</td>
					                <td>4</td>
					                <td>X</td>
					                <td>Trident</td>
					                <td>Internet
					                    Explorer 4.0
					                </td>
					                <td>Win 95+</td>
					                <td>4</td>
					                <td>X</td>
					            </tr>
					            </tbody>
					            <tfoot>
					            <tr>
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
<%@include file="../include/footer.jsp" %>