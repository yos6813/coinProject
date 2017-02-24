<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@include file="include/header.jsp" %>

<div class="row wrapper border-bottom white-bg page-heading">
    <div class="col-lg-10">
         <h1>
   			<b>View Project</b>
	 	 </h1>
         <ol class="breadcrumb">
		    <li><a href="/projectView?email=${user.email}"><i class="fa fa-home"></i> Home</a></li>
		    <li class="active">View Project</li>
	     </ol>
     </div>
</div>
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-lg-3">
            <div class="ibox">
                <div class="ibox-content">
                   	<h2>${board.pName }</h2>
                    <p class="small">
                        ${board.text}
                    </p>
                  	<a href=""><img alt="image" class="img-circle" src="${board.pmPhoto}"></a>
                    <p class="small font-bold">
                        <span>${board.pm}</span>
                    </p>
                </div>
            </div>
            <div class="ibox">
                <div class="ibox-content">
                    <h3>Status Chart</h3>
                    <div class="user-friends">
                        <div id="pie"></div>
                    </div>
                </div>
            </div>
            <div class="ibox">
                <div class="ibox-content">
                    <h3>Activity Status</h3>
                    <table class="table">
						<tr class="activity">
							<td>진행중</td>
							<td id="ongoing" value="${list3.size()}">${list3.size()}</td>
						</tr>
						<tr class="activity">
							<td>완료</td>
							<td id="c​omplete" value="${list5.size()}">${list5.size()}</td>
						</tr>
						<tr class="activity">
							<td>대기</td>
							<td id="standby" value="${list4.size()}">${list4.size()}</td>
						</tr>
						<tr class="activity">
							<td>보류</td>
							<td id="defer" value="${list6.size()}">${list6.size()}</td>
						</tr>
						<tr class="activity">
							<td>기간초과</td>
							<td id="excess" value="0">0</td>
						</tr>
                    </table>
                </div>
            </div>
        </div>
        <h3>Activity Graph</h3>
        <div class="col-lg-6">
        	<div class="social-feed-box">
                <div class="social-avatar">
                    <div class="media-body">
                    </div>
                </div>
                <div id="chart">
                </div>
            </div>
            <div class="ibox" style="display: none;">
                <div class="ibox-content">
                    <h3>
                    	Activity List
                    </h3>
                    <table class="table">
                    	<tr class="activity">
							<th>액티비티명</th>
							<th>진행중</th>
							<th>대기</th>
							<th>완료</th>
							<th>보류</th>
							<th>기간초과</th>
						</tr>
						<c:forEach items="${list1}" var="board">
						<tr class="activeC">
							<td value="${board.aNo}">${board.aName}</td>
							<td value="${board.aStatus}">${board.aStatus}</td>
							<td value="${board.aM}">${board.aM}</td>
							<td value="${board.ongoing}">${board.ongoing}</td>
							<td value="${board.standby}">${board.standby}</td>
							<td value="${board.complete}">${board.complete}</td>
							<td value="${board.defer}">${board.defer}</td>
							<td>0</td>
						</tr>
						</c:forEach>
              		</table>
                </div>
            </div>
        </div>
        <h3><b>Task List</b></h3>
        <div class="col-lg-3 m-b-lg">
           	<div>
            	<c:forEach items="${list7}" var="board">
	                <div class="ibox">
	                	<div class="ibox-content">
	                		<p class="tStatus label">${board.tStatus}</p>
	                        <h3>${board.tName}</h3>
	                        <p>${board.tText}</p>
	                        <p class="text text-warning">${board.tMName}</p>
                            <span class="vertical-date">
                            	${board.tDate}
                            </span>
	                    </div>
	                </div>
            	</c:forEach>
            </div>
        </div>
    </div>
</div>
<%@include file="include/footer.jsp" %>