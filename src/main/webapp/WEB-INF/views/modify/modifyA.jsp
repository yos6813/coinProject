<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@include file="../include/header.jsp" %>
	  <div class="row wrapper border-bottom white-bg page-heading">
		<h1>
			<b>수정</b>
	    </h1>
	    <ol class="breadcrumb">
	      <li><a href="home?email=${user.email}"><i class="fa fa-home"></i> Home</a></li>
	      <li><a href="/viewTask?email=${user.email}&bNo=${board.bNo}">업무관리</a></li>
	      <li class="active">수정</li>
	    </ol>
	  </div>
	<div class="wrapper-content">
	  <div class="wrapper wrapper-content animated fadeInRight">
		<div class="row">
			<div class="col-md-12">
				<div class="ibox">
					<div class="ibox-content">
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="m-b-md">
                                    </div>
                                    <dl class="dl-horizontal">
                                        <dt>상태: </dt> <dd><span class="label label-default">${board.aStatus}</span></dd>
                                    </dl>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-6">
                                    <dl class="dl-horizontal">
                                    	<dt>작성자:</dt> <dd>${board.writeName} (${board.writeUser})</dd>
                                        <dt>프로젝트명:</dt> <dd> ${board.pName}</dd>
                                    </dl>
                                </div>
                                <div class="col-lg-6" id="cluster_info">
                                    <dl class="dl-horizontal" >
                                        <dt>프로젝트 기간:</dt> <dd id="pDate1"> ${board.projectDate} </dd>
                                        <dt>프로젝트 매니저:</dt> <dd> ${board.pmName} (${board.pm})</dd>
                                    </dl>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-12">
                                    <dl class="dl-horizontal">
                                        <dt>내용:</dt>
                                        <dd>
                                            <div>
                                            	<p>${board.text}</p>
                                            </div>
                                        </dd>
                                    </dl>
                                </div>
                            </div>
                        </div>
                       </div>
				<div class="ibox">
					<div class="ibox-content">
						<form class="form-horizontal wizard-big" method="post" action="/modifyActivity?email=${user.email}&bNo=${board.bNo}&aNo=${board.aNo}">
			              <div class="box-body">
			                <div class="form-group">
								<label for="projectDate" class="col-sm-2 control-label">기간</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" value="${board.aDate}" name="aDate" id="projectDate1">
								</div>
			                </div>
			                <div class="form-group">
		                		<label class="col-sm-2 control-label">액티비티 명</label>
			                 	<div class="col-sm-10">
			                 		 <input name="aName" type="text" value="${board.aName}" class="form-control">
			                  	</div>
			                </div>
			                <div class="form-group">
		                		<label class="col-sm-2 control-label">설명</label>
			                 	<div class="col-sm-10">
			                 		 <textarea name="aText" id="pText" placeholder="내역을 적어주세요.">${board.aText}</textarea>
			                  	</div>
			                </div>
			                <div class="form-group">
		                		<label class="col-sm-2 control-label">프로젝트 매니저</label>
			                 	<div class="col-sm-10">
			                 		<input type="hidden" class="form-control" id="aM1" value="${board.aM}" readonly="readonly">
			                 		<select class="form-control" id="userSel2" name="aM" style="width: 100%;">
			                 			<c:forEach items="${list1}" var="user">
					                		<option value="${user.email}">${user.username}</option>
					                	</c:forEach>
					                </select>
			                  	</div>
			                </div>
			              </div>
			              <!-- /.box-body -->
			              <div class="box-footer text-right">
			                <button class="btn btn-default">취소</button>
			                <button type="submit" class="btn btn-info">수정</button>
			              </div>
			              <!-- /.box-footer -->
			            </form>
					</div>
				</div>
			</div>
		</div>
	</div>
 </div>
<%@include file="../include/footer.jsp" %>
