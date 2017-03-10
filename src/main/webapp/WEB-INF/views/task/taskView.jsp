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
		    <li><a href="/projectView?email=${user.email}&bNo=<%= request.getParameter("bNo") %>"><i class="fa fa-home"></i> Home</a></li>
		    <li class="active">업무 리스트</li>
	     </ol>
     </div>
</div>
<div class="wrapper wrapper-content animated fadeInRight">
	<div class="ibox">
    	<div class="ibox-content">
			<div class="m-b-md">
                <a class="btn btn-white btn-sm pull-right" data-toggle="modal" data-target="#myModal5">추가</a>
				<h2 style="float: left;" id="taskAStauts" class="label">${board.tStatus}</h2>
	            <h2 class="no-margin">
	                ${board.tName}
                </h2> 
                <h2 class="no-margin" id="activityDday"></h2>
                <table class="table m-b-xs">
	                <tbody>
		                <tr>
		                    <td>
								Project: <strong>${board.pName}</strong>
		                    </td>
		                    <td>
								매니저:  <strong>${board.tMName}</strong> 
		                    </td>
		                   	<td>
								기간: <strong id="projectTday">${board.tDate }</strong>
		                    </td>
		                </tr>
		                <tr>
		                    <td>
								activity: <strong>${board.aName}</strong>
		                    </td>
		                    <td>
								헬퍼:  <strong>
										<c:forEach items="${list2}" var="board">
									  		${board.username} 
									  	</c:forEach>
								  	  </strong>
		                    </td>
		                   	<td>
								투입시간: <strong class="text-info">${board.wTimeH}h ${board.wTimeM}m</strong>
		                    </td>
		                </tr>
	                </tbody>
	            </table>	
            </div>
    	</div>
   	</div>
	<c:forEach items="${list}" var="board">
		<div class="profile-image col-md-3">
		    ${board.wDate}
		</div>
		<div class="row m-b-lg m-t-lg">
   			<div class="col-md-1">	
	        	<img class="img-circle" src="${board.photoURL}"><br>
	            <small class="no-margins">
	                ${board.username}
	            </small>
            </div>
	        <div class="col-md-6">
	            <h3>${board.wText }</h3>
	            <small>
	            	첨부파일: <a href="resources/img/${board.wFileName}">${board.wFileName}</a>
	            </small>
	        </div>
	        <div class="col-md-2">
	            <h4 class="text-info">${board.wTimeH}h ${board.wTimeM}m</h4>
	            <small>
	            	test
	            </small>
	        </div>
	    </div>
	</c:forEach>
</div>
<!-- modal -->
<div class="modal inmodal fade" id="myModal5" tabindex="-1" role="dialog"  aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title">업무일지</h4>
            </div>
            <div class="modal-body">
            	<form class="form-horizontal wizard-big" method="post" enctype="multipart/form-data" action="/file?email=${user.email}&bNo=<%= request.getParameter("bNo") %>&aNo=<%= request.getParameter("aNo") %>&tNo=<%= request.getParameter("tNo") %>">
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
		                		<input type="text" name="wTimeM" class="form-control" placeholder="분"  required="required">
							</div>
						</div>
		                <div class="form-group">
	                		<label class="col-sm-2 control-label">연관고객</label>
		                 	<div class="col-sm-10">
		                 		<select class="form-control" name="wClient" style="width: 100%;">
		                 			<option value="0">선택</option>
		                 			<option value="1">test</option>
				                </select>
		                  	</div>
		                </div>
		                <div class="form-group">
	                		<label class="col-sm-2 control-label">첨부파일</label>
		                 	<div class="col-sm-10">
		                 		 <input type="file" name="wfile">
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