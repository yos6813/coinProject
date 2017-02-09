<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@include file="include/header.jsp" %>
	<section class="content">
		<div class="row">
			<div class="col-md-12">
				<div class="box">
					<div class="box-header text-center with-border">
						<button id="coin" class="btn bg-navy" data-toggle="modal" data-target="#myModal">코인 교환</button>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h5 class="modal-title" id="myModalLabel">코인 교환</h5>
	      </div>
	      <div class="modal-body">
	      	<table class="text-center table table-bordered">
	      		<tr>
	      			<th></th>
	      			<th></th>
	      			<th>이름</th>
	      			<th>slackID</th>
	      			<th>보유 코인</th>
	      		</tr>
      			<c:forEach items="${list}" var="user">
	      			<tr>
	      				<td>
		      				<label>
		                  		<input type="radio" name="r1" class="minimal" value="${user.email}">
		                	</label>
	                	</td>
	      				<td><img src="${user.photoURL}" class="img-circle"></td>
						<td class="username">${user.username}</td>
						<td class="slackID">${user.slackID}</td>
						<td class="coin">${user.coin}</td>
	      			</tr>
      			</c:forEach>
	      	</table>
	      	<div>
				교환 할 코인: <select id="minusCoin">
					<option value="100">100</option>
					<option value="200">200</option>
					<option value="300">300</option>
				</select>
	      	</div>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
	        <button type="button" id="exchange" class="btn btn-primary" data-toggle="modal" data-target="#myModal2">교환</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	<!-- Modal2 -->
	<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">Modal title</h4>
	      </div>
	      <div class="modal-body">
	      	<form role="form" method="post">
				<div class="form-group has-feedback">
					<input type="text" style="display: none;" class="form-control" name="email" id="sendEmail" readonly="readonly">
				</div>
	      		<div class="col-sm-4">받는 사람: </div>
	      		<div class="col-sm-8 form-group has-feedback">
					<input type="text" class="form-control" id="sendUsername" name="username" readonly="readonly">
				</div>
	      		<div class="col-sm-4">남는 코인: </div>
				<div class="col-sm-8 form-group has-feedback">
					<input type="text" class="form-control" name="coin" id="coin1" readonly="readonly">
				</div>
	      	</form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	        <button type="button" class="btn btn-primary">Save changes</button>
	      </div>
	    </div>
	  </div>
	</div>
</div>
<%@include file="include/footer.jsp" %>