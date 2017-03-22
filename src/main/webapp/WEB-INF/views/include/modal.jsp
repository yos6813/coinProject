<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<form class="form-horizontal">
	<h2>${client.fTitle}</h2>
	<strong>계약내용 </strong><p>${client.fText}</p>
	<strong> 첨부파일:</strong> <a href="resources/img/${client.fName}">${client.fName}</a>
</form>
