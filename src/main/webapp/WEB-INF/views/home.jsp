<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@include file="include/header.jsp" %>
	<section class="content">
		<div class="row">
			<div class="col-md-12">
				<div class="box">
					<div class="box-header text-center with-border">
						<button id="coinbtn" class="btn bg-navy" data-toggle="modal" data-target="#myModal">코인 교환</button>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	  <form role="form" method="post">
      	<input type="hidden" name="email" id="userEmail" />
      </form>
	  <form role="form" method="post" action="/exchange?email=${user.email}">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h5 class="modal-title" id="myModalLabel">코인 교환</h5>
	      </div>
	      <div class="modal-body">
				<div>
					내 코인: <label id="coin4">${user.coin}</label>
				</div>
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
			                  		<input type="checkbox" class="minimal" value="${user.email}">
			                  		<input type="text" style="display: none;" name="email2" value="'${user.email}'" />
			                	</label>
		                	</td>
		      				<td><img src="${user.photoURL}" class="img-circle"></td>
							<td class="username">${user.username}</td>
							<td class="slackID">${user.slackID}</td>
							<td class="coin">${user.coin}</td>
		      			</tr>
	      			</c:forEach>
		      	</table>
				선물 할 코인: <input type="text" id="coin" name="coin" />&nbsp;&nbsp;&nbsp;
				남는 코인: <input id="coin1" name="coin2" />
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
	        <button type="submit" id="exchange2" class="btn btn-primary" data-toggle="modal" data-target="#myModal2">확인</button>
	      </div>
	    </div>
	    </form>
	  </div>
	</div>
</div>
<%@include file="include/footer.jsp" %>