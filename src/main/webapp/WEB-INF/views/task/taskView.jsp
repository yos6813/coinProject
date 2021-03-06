<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@include file="../include/header.jsp" %>

<div class="row wrapper border-bottom white-bg page-heading">
    <div class="col-lg-10">
         <h1>
   			<b>업무 리스트</b>
	 	 </h1>
         <ol class="breadcrumb">
		    <li><a href="home?email=${user.email}"><i class="fa fa-home"></i> Home</a></li>
		    <li class="active">업무 리스트</li>
	     </ol>
     </div>
</div>
<div class="wrapper wrapper-content animated fadeInRight">
	<div class="ibox">
    	<div class="ibox-content" style="padding-bottom: 10px !important">
	            <a class="btn btn-white btn-sm pull-right" data-toggle="modal" data-target="#myModal5">일지추가</a>
	    		<a class="btn btn-white btn-sm pull-right" href="/modifyA?email=${user.email}&bNo=${board.bNo}&aNo=${board.aNo}">수정</a>
	    		<a class="btn btn-white btn-sm pull-right" id="activityDelete" value="${board.aNo}">삭제</a>
			<h2 style="float: left;" id="taskAStauts" class="label">${board.aStatus}</h2>
            <h2 class="no-margin">
              ${board.aName}
             </h2> 
             <h2 class="no-margin"><strong id="activityDday"></strong></h2>
             <table class="table m-b-xs no-margin2" style="margin-top: 35px">
                <tbody>
	                <tr>
	                	<td class="text-right no-padding no-margins">
							<p style="color:#969696;">Project:</p>
	                    </td>
	                    <td class="no-padding1 no-margins">
							<a class="text-primary" href="projectView?email=${user.email}&bNo=${board.bNo}"><strong>${board.pName}</strong></a>
	                    </td>
	                    <td class="text-right no-padding no-margins">
							<p style="color:#969696;">매니저: </p>
	                    </td>
	                    <td class="no-padding1 no-margins">
							<strong>${board.aMName}</strong> 
	                    </td>
	                   	<td class="text-right no-padding no-margins">
							<p style="color:#969696;">기간: </p>
	                    </td>
	                    <td class="no-padding1 no-margins">
							<strong id="projectTday">${board.aDate }</strong>
	                    </td>
	                </tr>
	                <tr>
	                    <td class="text-right no-padding no-margins">
							<p style="color:#969696;">헬퍼:  </p>
	                    </td>
	                    <td class="no-padding1 no-margins">
							<strong>
								<c:forEach items="${list2}" var="board">
							  		${board.username}
							  	</c:forEach>
					  	  	</strong>
	                    </td>
	                   	<td class="text-right no-padding no-margins">
							<p style="color:#969696;">투입시간:</p>
	                    </td>
	                    <td class="no-padding1 no-margins">
	                    	<c:if test="${board.wTimeH eq null}">
     			            	<strong id="wHtimetext" class="text-info">0h</strong>
	                    	</c:if>
	                    	<c:if test="${board.wTimeM eq null}">
	                    		<strong id="wMtimetext" class="text-info">0m</strong>
	                    	</c:if>
	                    	<c:if test="${board.wTimeH ne null}">
		                    	<strong id="wHtimetext" class="text-info">${board.wTimeH}h</strong>
	                    	</c:if>
	                    	<c:if test="${board.wTimeM ne null}">
		                    	<strong id="wMtimetext" class="text-info"> ${board.wTimeM}m</strong>
	                    	</c:if>
	                    </td>
	                </tr>
                </tbody>
            </table>	
    	</div>
   	</div>
   	<form id="pageNum">
   		<input type="hidden" id="wnoInput">
   	</form>
	<c:forEach items="${list}" var="board">
		<div class="listToChange">
			<div class="row scrolling" data-wno="${board.wNo}">
				<div class="col-lg-2">
					<div class="ibox1 wDate text-right">
			    		<h5>${board.wDate}</h5>
			    		<h5>${board.day}</h5>
			    	</div>
			    </div>
			    <div class="col-lg-10">
					<div class="ibox1 col-md-12">
						<div class="ibox-content fixSize" style="padding-bottom: 10px !important">
							<div class="row" style="margin-top: 10px !important">
					   			<div class="col-md-2 text-center">	
						        	<img class="img-circle1" src="${board.photoURL}"><br>
						            <small class="no-margins" style="color:#969696;">
						                ${board.username}
						            </small>
					            </div>
						        <div class="col-md-5">
						            <h3>${board.wText}</h3>
						            <small>
						            	첨부파일: <a href="resources/img/${board.wFileName}" class="wFile">${board.wFileName}</a>
						            </small>
						        </div>
						        <div class="col-md-2 pull-right text-right">
						            <strong class="text-info wHTime">${board.wTimeH}h</strong>
						            <strong class="text-info wMTime">${board.wTimeM}m</strong><br>
						            <small>
						            	${board.ctName}
						            </small>
						        </div>
						    </div>
					    </div>
				    </div>
			    </div>
		    </div>
	    </div>
	</c:forEach>
</div>
<!-- modal -->
<div class="modal inmodal fade" id="myModal5" tabindex="-1" role="dialog"  aria-hidden="true">
    <div class="modal-dialog modal-size">
        <div class="modal-content">
            <div class="modal-header">
                <i class="fa fa-edit modal-icon"></i>
                <h4 class="modal-title">업무일지</h4>
            </div>
            <div class="modal-body">
            	<form class="form-horizontal wizard-big" method="post" enctype="multipart/form-data" action="/file?email=${user.email}&aNo=<%= request.getParameter("aNo") %>">
					<div class="box-body">
						<div class="form-group" style="display: none;">
		                  <label for="writeUser" class="col-sm-2 control-label">날짜</label>
		                  <div class="col-sm-10">
		                    <input type="text" class="form-control" name="wWriteDate" id="writeDay" readonly="readonly">
		                  </div>
		                </div>
		                <div class="form-group" style="display: none;">
		                  <label for="writeUser" class="col-sm-2 control-label">작성자</label>
		                  <div class="col-sm-10">
		                    <input type="text" class="form-control" name="wUser" value="${user.email}" readonly="readonly">
		                  </div>
		                </div>
		                <div class="form-group">
	                		<label class="col-sm-2 control-label">날짜</label>
		                 	<div class="col-sm-10">
		                 		<input type="text" id="wDate" name="wDate" class="form-control" required="required">
		                  	</div>
		                </div>
		                <div class="form-group">
							<label class="col-sm-2 control-label">업무내용</label>
							<div class="col-sm-10">
								<textarea name="wText" id="wText" class="form-control" required></textarea>
							</div>
		                </div>
		                <div class="form-group">
		                	<label for="projectDate" class="col-sm-2 control-label">투입시간</label>
		                	<div class="col-sm-5">
		                		<input type="text" name="wTimeH" class="form-control " placeholder="시" required="required">
							</div>
							<div class="col-sm-5">
		                		<input type="text" name="wTimeM" class="form-control" placeholder="분" required="required">
							</div>
						</div>
		                <div class="form-group">
	                		<label class="col-sm-2 control-label">연관고객</label>
		                 	<div class="col-sm-10">
		                 		<select data-placeholder="고객사 명을 입력하여 선택하세요" name="wClient" class="chosen-select form-control"  tabindex="2">
                					<option value="0">선택</option>
                					<c:forEach items="${list3}" var="client">
	                					<option value="${client.ctNo}">${client.ctName}</option>
                					</c:forEach>
                				</select>
		                  	</div>
		                </div>
		                <div class="form-group">
	                		<label class="col-sm-2 control-label">첨부파일</label>
		                 	<div class="col-sm-10">
		                 		 <input class="filebox" type="file" name="wfile">
		                  	</div>
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
<%@include file="../include/footer.jsp" %>