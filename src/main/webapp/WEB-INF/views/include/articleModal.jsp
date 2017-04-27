<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<table class="table">
	<c:forEach items="${list3}" var="admit">
		<c:set value="${admit.acceptcheck}" var="acceptCheck"></c:set>
			<tr class="articleRequestTable">
				<td style="width:150px;" class="text-center">${admit.requestDate}</td>
			<td style="width:150px;" class="text-center">${admit.username}</td>
			<td>
				<a class="articleInfo text-primary" onclick="articleInfo(${admit.id})">
					${admit.name}<br><small>${admit.price}</small>
				</a>
			</td>
			<c:if test="${acceptCheck eq '승인대기'}">
				<td style="width:150px;" class="text-center">
					<a class="btn btn-white btn-sm articleCheck" value="${admit.id}">승인</a>
					<a class="btn btn-warning btn-sm articleDeny" value="${admit.id}">반려</a>
				</td>
			</c:if>
			<c:if test="${acceptCheck eq '승인'}">
				<td style="width:150px;" class="text-center">
					<p class="text-success">승인</p>
				</td>
			</c:if>
			<c:if test="${acceptCheck eq '거절'}">
				<td style="width:150px;" class="text-center">
					<p class="text-danger">반려</p>
				</td>
			</c:if>
		</tr>
	</c:forEach>
</table>  

