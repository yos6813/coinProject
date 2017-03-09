<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="../include/header.jsp" %>
<div class="row wrapper border-bottom white-bg page-heading">
	<div class="col-lg-10">
		<h1>
			<b>법인카드 사용내역 쓰기</b>
		</h1>
		<ol class="breadcrumb">
			<li><a href="/projectList?email=${user.email}"><i class="fa fa-home"></i> Home</a></li>
			<li><a href="/cardList?email=${user.email}">법인카드 사용내역 관리</a></li>
			<li class="active">법인카드 사용내역 쓰기</li>
		</ol>
	</div>
</div>
<div class="wrapper-content">
	<div class="ibox float-e-margins">
       	<div class="ibox-content">
			<form class="form-horizontal wizard-big" method="post" action="/cWrite?email=${user.email}">
              <div class="box-body">
                <div class="form-group">
                  <label for="today" class="col-sm-2 control-label">이용일자</label>
                  <div class="col-sm-10">
                    <input type="text" id="totalDate" name="usageDate" class="form-control">
                  </div>
                </div>
                <div class="form-group">
                  <label for="writeUser" class="col-sm-2 control-label">카드구분</label>
                  <div class="col-sm-10">
                    <select class="form-control" name="classifyCard">
						<option value="체크공용">체크공용</option>
					</select>
                  </div>
                </div>
                <div class="form-group">
               		<label class="col-sm-2 control-label">사용자</label>
                 	<div class="col-sm-10">
                 		<input type="text" id="usageUser" name="usageUser" class="form-control" required="required">
                  	</div>
                </div>
                <div class="form-group">
					<label for="projectDate" class="col-sm-2 control-label">사용카드</label>
					<div class="col-sm-10">
						<input type="text" name="usageCard" class="form-control" required>
					</div>
                </div>
                <div class="form-group">
                	<label for="projectDate" class="col-sm-2 control-label">매출구분</label>
                	<div class="col-sm-10">
						<select class="form-control" name="sales">
							<option value="국내체크">국내체크</option>
							<option value="해외체크">해외체크</option>
						</select>
					</div>
				</div>
                <div class="form-group">
               		<label class="col-sm-2 control-label">이용가맹점(은행)명</label>
                 	<div class="col-sm-10">
                 		<input type="text" name="memberStore" class="form-control" required>
                  	</div>
                </div>
                <div class="form-group">
               		<label class="col-sm-2 control-label">이용금액</label>
                 	<div class="col-sm-10">
                 		 <input type="text" name="cost" class="form-control" required>
                  	</div>
                </div>
                <div class="form-group">
               		<label class="col-sm-2 control-label">적요1</label>
                 	<div class="col-sm-10">
                 		 <select class="form-control" id="abstract1" name="abstract1">
	                 		 <c:forEach items="${list2}" var="admit">
								<option value="${admit.abNo}">${admit.abName}</option>
	                 		 </c:forEach>
						</select>
                  	</div>
                </div>
                <div class="form-group" id="abstract2box">
               		<label class="col-sm-2 control-label">적요2</label>
                 	<div class="col-sm-10">
                 		 <select class="form-control" id="abstract2" name="abstract2">
	                 		 <c:forEach items="${list3}" var="admit">
								<option value="${admit.ab2No}">${admit.ab2Name}</option>
	                 		 </c:forEach>
						</select>
                  	</div>
                </div>
                <div class="form-group">
               		<label class="col-sm-2 control-label">비고</label>
                 	<div class="col-sm-10">
                 		 <textarea class="form-control" name="note" id="card"></textarea>
                  	</div>
                </div>
              </div>
              <!-- /.box-body -->
              <div class="box-footer text-right">
                <button class="btn btn-default" id="cancel">Cancel</button>
                <button type="submit" class="btn btn-info">Sign in</button>
              </div>
          </form>
       </div>
	</div>
</div>
<%@include file="../include/footer.jsp" %>