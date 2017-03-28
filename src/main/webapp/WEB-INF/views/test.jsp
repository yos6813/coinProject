<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@include file="include/header.jsp" %>
<div class="row wrapper border-bottom white-bg page-heading">
     <div class="col-lg-10">
         <h1>
   			<b>스케쥴표</b>
	 	 </h1>
         <ol class="breadcrumb">
		    <li><a href="/home?email=${user.email}"><i class="fa fa-home"></i> Home</a></li>
		    <li class="active">스케쥴표</li>
	     </ol>
     </div>
 </div>
<div class="col-lg-12">
	<div class="wrapper wrapper-content animated fadeInRight">
    	<div class="ibox">
	    	<div class="ibox-content">
				<form class="form-horizontal ng-pristine ng-valid" action="/testWrite?email=${param.email}" method="post">
					<div class="form-group">
			 			<label class="col-sm-2 control-label">스케쥴명</label>
			 			<div class="col-sm-10">
			 				<input type="text" class="form-control" name="title">
			 			</div>
			 		</div>
			 		<div class="form-group">
			 			<label class="col-sm-2 control-label">시작일</label>
			 			<div class="col-sm-10">
			 				<input type="text" class="form-control" name="start" id="startPicker">
			 			</div>
			 		</div>
			 		<div class="form-group">
			 			<label class="col-sm-2 control-label">종료일</label>
			 			<div class="col-sm-10">
			 				<input type="text" class="form-control" name="end" id="endPicker">
			 			</div>
			 		</div>
			 		<div class="text-right">
			 			<button type=submit class="btn btn-primary">저장</button>
			 		</div>
				</form>
	    	</div>
    	</div>
       <div class="ibox float-e-margins">
           <div class="ibox-content">
               <div id="calendar"></div>
           </div>
       </div>
    </div>
</div>
<%@include file="include/footer.jsp" %>