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
							<td id="excess" value="${list7.size()}">${list7.size()}</td>
						</tr>
                    </table>
                </div>
            </div>
        </div>
        <div class="col-lg-5">
            <div class="ibox">
                <div class="ibox-content">
                    <h3>
                    	Activity List
                    </h3>
                    <table class="table">
                    	<tr class="activity">
							<th>액티비티명</th>
							<th>기간</th>
						</tr>
		                <c:forEach items="${list2}" var="board">
							<tr class="activityList">
								<td value="${board.aName}">${board.aName}</td>
								<td value="${board.aDate}">${board.aDate}</td>
							</tr>
		                </c:forEach>
              		</table>
                </div>
            </div>
            <div class="social-feed-box">
                <div class="social-avatar">
                    <div class="media-body">
                        <h3>
                        	Activity Graph
                        </h3>
                    </div>
                </div>
                <div id="chart" class="social-body">
                </div>
            </div>
        </div>
        <div class="col-lg-4 m-b-lg">
            <div id="vertical-timeline" class="vertical-container light-timeline no-margins">
                <div class="vertical-timeline-block">
                    <div class="vertical-timeline-icon navy-bg">
                        <i class="fa fa-briefcase"></i>
                    </div>

                    <div class="vertical-timeline-content">
                        <h2>Meeting</h2>
                        <p>Conference on the sales results for the previous year. Monica please examine sales trends in marketing and products. Below please find the current status of the sale.
                        </p>
                        <a href="#" class="btn btn-sm btn-primary"> More info</a>
                            <span class="vertical-date">
                                Today <br>
                                <small>Dec 24</small>
                            </span>
                    </div>
                </div>

                <div class="vertical-timeline-block">
                    <div class="vertical-timeline-icon blue-bg">
                        <i class="fa fa-file-text"></i>
                    </div>

                    <div class="vertical-timeline-content">
                        <h2>Send documents to Mike</h2>
                        <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since.</p>
                        <a href="#" class="btn btn-sm btn-success"> Download document </a>
                            <span class="vertical-date">
                                Today <br>
                                <small>Dec 24</small>
                            </span>
                    </div>
                </div>

                <div class="vertical-timeline-block">
                    <div class="vertical-timeline-icon lazur-bg">
                        <i class="fa fa-coffee"></i>
                    </div>

                    <div class="vertical-timeline-content">
                        <h2>Coffee Break</h2>
                        <p>Go to shop and find some products. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's. </p>
                        <a href="#" class="btn btn-sm btn-info">Read more</a>
                        <span class="vertical-date"> Yesterday <br><small>Dec 23</small></span>
                    </div>
                </div>

                <div class="vertical-timeline-block">
                    <div class="vertical-timeline-icon yellow-bg">
                        <i class="fa fa-phone"></i>
                    </div>

                    <div class="vertical-timeline-content">
                        <h2>Phone with Jeronimo</h2>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Iusto, optio, dolorum provident rerum aut hic quasi placeat iure tempora laudantium ipsa ad debitis unde? Iste voluptatibus minus veritatis qui ut.</p>
                        <span class="vertical-date">Yesterday <br><small>Dec 23</small></span>
                    </div>
                </div>

                <div class="vertical-timeline-block">
                    <div class="vertical-timeline-icon navy-bg">
                        <i class="fa fa-comments"></i>
                    </div>

                    <div class="vertical-timeline-content">
                        <h2>Chat with Monica and Sandra</h2>
                        <p>Web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like). </p>
                        <span class="vertical-date">Yesterday <br><small>Dec 23</small></span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="include/footer.jsp" %>