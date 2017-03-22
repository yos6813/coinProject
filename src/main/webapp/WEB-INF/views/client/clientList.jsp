<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@include file="../include/header.jsp" %>
<div class="row wrapper border-bottom white-bg page-heading">
     <div class="col-lg-10">
         <h1>
   			<b>고객관리</b>
	 	 </h1>
         <ol class="breadcrumb">
		    <li><a href="/notifyList?email=${user.email}"><i class="fa fa-home"></i> Home</a></li>
		    <li class="active">고객관리</li>
	     </ol>
     </div>
 </div>
<div class="wrapper-content">
	 <div class="wrapper wrapper-content animated fadeInRight">
	 	<div class="row">
                <div class="col-sm-8">
                    <div class="ibox">
                        <div class="ibox-content">
                        	<div class="ibox1">
								<a href="clientRegister?email=${user.email}" class="btn btn-white ">고객사 등록</a>
                        	</div>
                            <div class="form-group">
								<div class="col-md-2 no-padding">
									<select class="form-control" id="clientType" name="type">
										<option value="ctName">회사명</option>
										<option value="ctLicense">사업자번호</option>
									</select>
								</div>
								<div class="col-md-8 ">
									<input class="form-control pull-right" id="clientKeyword" type="text" name="keyword" placeholder="검색">
								</div>
								<div class="col-md-2 no-padding">
									<a class="btn btn-white" id="searchClient"><i class="fa fa-search"></i></a>
								</div>
							</div>
                            <div class="clients-list">
                               <table class="table table-striped table-hover">
                               		<thead>
	                               		<tr>
	                               			<th>회사명</th>
	                               			<th>사업자등록번호</th>
	                               			<th></th>
	                               		</tr>
                               		</thead>
                                   	<tbody>
	                               		<c:forEach items="${list}" var="client">
		                                   	<tr class="selectClient" value="${client.ctNo}">
		                                       	<td>${client.ctName}</td>
		                                       	<td>${client.ctLicense}</td>
		                                       	<td style="width:200px;">
			                                       	<form method="post" id="deleteForm" action="/deleteClient?email=${user.email}&ctNo=${client.ctNo}">
				                                       	<a class="btn btn-white" href="clientRegister?email=${user.email}&ctNo=${client.ctNo}">수정</a>
				                                       	<button onclick="deleteClient(${client.ctNo})" class="btn btn-white">삭제</button>
										       		</form>
		                                       	</td>
		                                   	</tr>
	                               		</c:forEach>
                                   	</tbody>
                               </table>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="ibox ">
                        <div class="ibox-content">
                            <div class="tab-content">
                                <div id="contact-1" class="tab-pane active">
                                    <div class="row">
                                        <div class="col-lg-12">
                                        	<div class="ibox1">
	                                            <h2 class="no-margin3">${client.ctName}</h2>
                                            </div>
                                            <div class="ibox1">
                                            	<strong>사업자번호</strong><br>
    	                                        <small>${client.ctLicense}</small>
   	                                        </div>
                                            <strong>
                                               	 주소
                                            </strong>
                                            <p>
                                               ${client.ctAddr} ${client.ctAddr2}
                                            </p>
                                        </div>
                                    </div>
                                    <div class="ibox1" style="max-height:200px">
	                                    <div class="full-height-scroll">
	                                    	<strong>계약서</strong>
	                                    	<a class="btn btn-xs btn-white pull-right" data-toggle="modal" data-target="#myModal">추가</a>
	                                        <ul class="list-group clear-list" id="fileList">
	                                        	<c:forEach items="${list2}" var="client">
		                                            <li class="list-group-item fist-item">
		                                                <span class="pull-right"> ${client.fDate} </span>
	    	                                            <a onclick="contractModal1(${client.fNo});" class="text-primary">${client.fTitle}</a>
	        	                                    </li>
               	                        		</c:forEach>
	                                        </ul>
	                                    </div>
                                    </div>
                                    <div class="client-detail">
	                                    <div class="full-height-scroll">
	                                    	<div class="ibox1">
		                                        <strong>업무 리스트</strong>
	                                    	</div>
	                                    	<c:forEach items="${list3}" var="client">
	                                           <div class="ibox1content">
														${client.username}<br>
													<small>${client.wDate}</small>
		                                            <h4>${client.wText}</h4>
		                                            <span class="vertical-date small text-muted">${client.wTimeH}h ${client.wTimeM}m</span>
	                                           </div>
	                                    	</c:forEach>
	                                    </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
	 	</div>
 	</div>
 	<div class="modal inmodal" id="myModal" tabindex="-1" role="dialog" aria-hidden="true">
       <div class="modal-dialog">
			<div class="modal-content animated bounceInRight"> 
				<div class="modal-header">
				    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
				    <h4 class="modal-title">파일 업로드</h4>
				</div>
               	<div class="modal-body">
		       		<form class="form-horizontal" method="post" action="/contractFile?email=${user.email}&ctNo=<%= request.getParameter("ctNo") %>" enctype="multipart/form-data">
	               		<input type="hidden" id="fDateInput" name="fDate">
	               		<div class="form-group">
	               			<label class="col-md-2 control-label">제목</label>
		               		<div class="col-md-10">
			               		<input type="text" class="form-control" name="fTitle" required="required">
		               		</div>
	               		</div>
	               		<div class="form-group">
	               			<label class="col-md-2 control-label">계약내용</label>
		               		<div class="col-md-10">
								<textarea class="form-control" id="fText" name="fText" required="required"></textarea>
		               		</div>
	               		</div>
	               		<div class="form-group">
	               			<label class="col-md-2 control-label">계약서</label>
		               		<div class="col-md-10">
								<input class="filebox" type="file" name="fFile" multiple="multiple">
								<small>파일을 선택해주세요.</small>
							</div>
						</div>
						<div class="text-right">
		                   <button type="button" class="btn btn-white" data-dismiss="modal">취소</button>
		                   <button type="submit" class="btn btn-primary">저장</button>
	                   </div>
	             	</form>
             	</div>
           </div>
       </div>
   </div>
   <div class="modal inmodal" id="contractModal" tabindex="-1" role="dialog" aria-hidden="true">
       <div class="modal-dialog modal-sm">
			<div class="modal-content animated bounceInRight"> 
				<div class="modal-header">
				    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
				    <h4 class="modal-title">상세보기</h4>
				</div>
               	<div class="modal-body" id="modalBody">
               		
               	</div>
				<div class="modal-footer">
                 <button type="button" class="btn btn-white" data-dismiss="modal">닫기</button>
                </div>
           </div>
       </div>
   </div>
<%@include file="../include/footer.jsp" %>