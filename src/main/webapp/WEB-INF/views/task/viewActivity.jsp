<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@include file="../include/header.jsp" %>
<!-- Content Wrapper. Contains page content -->
  <!-- Content Header (Page header) -->
	<div class="row wrapper border-bottom white-bg page-heading">
		<div class="col-lg-10">
		    <h1>
		      <b>Activity View</b>
		    </h1>
		    <ol class="breadcrumb">
		      <li><a href="/home"><i class="fa fa-home"></i>Home</a></li>
		      <li><a href="/viewTask?email=${user.email}&bNo=${board.bNo}">project view</a></li>
		      <li class="active">activity view</li>
		    </ol>
	    </div>
	</div>
<div class="wrapper-content">
	<div class="wrapper wrapper-content animated fadeInRight">
	    <div class="row">
	    	<div class="col-md-12">
				<div class="ibox float-e-margins">
						<div class="ibox-content">
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="m-b-md">
                                        <a href="/viewTask?email=${user.email}&bNo=${board.bNo}" class="btn btn-white btn-sm pull-right">목록가기</a>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-5">
                                    <dl class="dl-horizontal">
                                    	<dt>작성자:</dt> <dd>${board.aWriteU}</dd>
                                        <dt>액티비티명:</dt> <dd> ${board.aName}</dd>
                                    </dl>
                                </div>
                                <div class="col-lg-7" id="cluster_info">
                                    <dl class="dl-horizontal" >
                                        <dt>기간:</dt> <dd> ${board.aDate} </dd>
                                        <dt>액티비티 매니저:</dt> <dd> ${board.aM}</dd>
                                    </dl>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-12">
                                    <dl class="dl-horizontal">
                                        <dt>내용:</dt>
                                        <dd>
                                            <div>
                                            	<p>${board.aText}</p>
                                            </div>
                                        </dd>
                                    </dl>
                                </div>
                            </div>
                        </div>
					</div>
		    	</div>
	     	</div>
     	</div>
	</div>
<%@include file="../include/footer.jsp" %>
