<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@include file="include/header.jsp" %>
<div class="row wrapper border-bottom white-bg page-heading">
    <div class="col-lg-10">
        <h1>
  			<b>HOME</b>
 	 </h1>
    </div>
</div>
 <div class="wrapper wrapper-content animated fadeInRight">
	<div class="row">
		<div class="col-md-6">
			<div class="ibox">
				<div class="ibox-title">
					<strong class="leftFloat">공지사항</strong>
					<p class="text-right text-primary"><a class="text-info" href="notifyList?email=${user.email}">리스트 보기</a></p>
				</div>
				<div class="ibox-content">
					<table class="homeTable">
						<c:forEach items="${list}" var="notify">
							<tr>
								<td>1</td>
								<td class="text-center"><a class="text-primary" href="notifyView?email=${user.email}&nNo=${notify.nNo}">${notify.nTitle}</a></td>
								<td class="text-right" style="padding-bottom:5px">
									<small>${notify.nDate}</small><br>
									<small>${notify.username}</small>
								</td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
		</div>
		<div class="col-md-6">
			<div class="ibox">
				<div class="ibox-title">
					<strong class="leftFloat">설문조사</strong>
					<p class="text-right text-primary"><a class="text-info" href="voteList?email=${user.email}">리스트 보기</a></p>
				</div>
				<div class="ibox-content">
					<table class="homeTable">
						<c:forEach items="${list2}" var="vote">
							<tr>
								<td>1</td>
								<td class="text-center"><a class="text-primary" href="vote?email=${user.email}&vNo=${vote.vNo}">${vote.vTitle}</a></td>
								<td class="text-right" style="padding-bottom:5px">
									<small>${vote.vDate}</small><br>
									<small>${vote.username}</small>
								</td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
		</div>
		<div class="col-md-12">
			<div class="ibox">
				<div class="ibox-content">
					
				</div>
			</div>
		</div>
	</div>
</div>
<%@include file="include/footer.jsp" %>