<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <title>Home</title>

    <link href="resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="resources/font-awesome/css/font-awesome.css" rel="stylesheet">

    <!-- Toastr style -->
    <link href="resources/css/plugins/toastr/toastr.min.css" rel="stylesheet">

    <!-- Gritter -->
    <link href="resources/js/plugins/gritter/jquery.gritter.css" rel="stylesheet">

    <link href="resources/css/animate.css" rel="stylesheet">
    <link href="resources/css/style.css" rel="stylesheet">
    <link href="resources/css/datepicker/bootstrap-datepicker.css" rel="stylesheet">
    <link href="resources/css/plugins/daterangepicker/daterangepicker-bs3.css" rel="stylesheet">
    <link href="resources/css/plugins/dataTables/datatables.min.css" rel="stylesheet">
    <link href="resources/css/plugins/awesome-bootstrap-checkbox/awesome-bootstrap-checkbox.css" rel="stylesheet">
    <link href="resources/css/plugins/iCheck/custom.css" rel="stylesheet">
    <link href="resources/css/plugins/chosen/bootstrap-chosen.css" rel="stylesheet">
    <link href="resources/css/plugins/summernote/summernote.css" rel="stylesheet">
    <link href="resources/css/plugins/fullcalendar/fullcalendar.css" rel="stylesheet">
    <link href="resources/css/plugins/fullcalendar/fullcalendar.print.css" rel="stylesheet"  media="print">
</head>

<body>
    <div id="wrapper">
        <nav class="navbar-default navbar-static-side" role="navigation">
            <div class="sidebar-collapse">
                <ul class="nav metismenu" id="side-menu">
                    <li class="nav-header">
                        <div class="dropdown profile-element"> <span>
                            <img alt="image" class="img-circle" src="${user.photoURL}" />
                             </span>
                            <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                            <span class="clear"> <span class="block m-t-xs"> <strong class="font-bold">${user.username}</strong>
                             </span> <span class="text-muted text-xs block">${user.email}</span> </span> </a>
                        </div>
                        <div class="logo-element">
                            F
                        </div>
                    </li>
                    <li><a href="/home?email=${user.email}"><i class="fa fa-home"></i><span>HOME</span></a></li>
                    <li><a href="/notifyList?email=${user.email}"><i class="fa fa-bell-o"></i><span>공지사항</span></a></li>
                    <li><a href="/voteList?email=${user.email}"><i class="fa fa-bar-chart-o"></i><span>설문조사</span></a></li>
                    <li><a href="/projectList?email=${user.email}"><i class="fa fa-home"></i><span>업무관리</span></a></li>
		            <li><a href="/cardList?email=${user.email}"><i class="fa fa-credit-card"></i> <span>법인카드사용내역관리</span></a></li>
		            <li>
                        <a><i class="fa fa-calendar"></i> <span>휴가</span></a>
                        <ul class="nav nav-second-level collapse">
                            <li>
                                <a href="/calendar?email=${user.email}">휴직관리</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a><i class="fa fa-pencil-square"></i> <span>각종신청</span></a>
                        <ul class="nav nav-second-level collapse">
                            <li>
                                <a href="/book?email=${user.email}">도서 구매 신청</a>
                            </li>
                            <li>
                                <a href="/article?email=${user.email}">물품 구매 신청</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a><i class="fa fa-krw"></i> <span>코인관리</span></a>
                        <ul class="nav nav-second-level collapse">
                            <li>
                                <a href="/coinmall?email=${user.email}">코인몰</a>
                            </li>
                            <li>
                                <a href="/coinTrade?email=${user.email}">코인송금</a>
                            </li>
                            <li>
                                <a href="/myCoin?email=${user.email}">나의 코인현황</a>
                            </li>
                        </ul>
                    </li>
                    <c:set value="${user.grade}" var="grade"></c:set>
					<c:if test="${grade > 1 }">
	                    <li>
	                        <a><i class="fa fa-table"></i> <span>관리페이지</span></a>
	                        <ul class="nav nav-second-level collapse">
<!-- 	                            <li> -->
<%-- 	                                <a href="/admit?email=${user.email}">프로젝트</a> --%>
<!-- 	                            </li> -->
	                            <li>
	                                <a href="/abstractPage?email=${user.email}&abNo=1&page=1">적요</a>
	                            </li>
	                            <li>
	                                <a href="/clientList?email=${user.email}">고객관리</a>
	                            </li>
	                            <li>
	                                <a href="/annual?email=${user.email}">연차관리</a>
	                            </li>
	                            <li>
	                                <a href="/requestAdmit?email=${user.email}">결재 요청 현황</a>
	                            </li>
	                            <li>
	                                <a href="/managers?email=${user.email}">담당자관리</a>
	                            </li>
	                        </ul>
	                    </li>
                    </c:if>
                </ul>
            </div>
        </nav>
        <div id="page-wrapper" class="gray-bg dashbard-1 body">
        <div class="row border-bottom">
        <nav class="navbar navbar-static-top" role="navigation" style="margin-bottom: 0;">
        <div class="navbar-header">
            <a class="navbar-minimalize minimalize-styl-2 btn btn-primary " href="#"><i class="fa fa-bars"></i> </a>
        </div>
            <ul class="nav navbar-top-links navbar-right">
                <li>
                    <a id="signout">
                        <i class="fa fa-sign-out"></i> Logout
                    </a>
                </li>
            </ul>
        </nav>
        </div>