<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@include file="../include/header.jsp" %>
<div class="row wrapper border-bottom white-bg page-heading">
     <div class="col-lg-10">
         <h1>
   			<b>코인몰</b>
	 	 </h1>
         <ol class="breadcrumb">
		    <li><a href="/home?email=${user.email}"><i class="fa fa-home"></i> Home</a></li>
		    <li class="active">코인몰</li>
	     </ol>
     </div>
 </div>
 <div class="col-lg-12" style="height:100%">
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="row">
           <div class="ibox">
           	   <a class="btn btn-white pull-right ibox_1" href="/product?email=${param.email}">상품 추가</a>
           	   <c:forEach items="${list1}" var="coin">
	               <div class="ibox-content">
	                   <div class="table-responsive">
	                       <table class="table shoping-cart-table">
	                           <tbody>
		                           <tr>
		                               <td class="desc">
	                                       <h3 class="text-success">
	                                           ${coin.name}
	                                       </h3>
		                                   <dl class="small m-b-none">
		                                       <dd>${coin.text}</dd>
		                                   </dl>
		                               </td>
		                               <td>
		                                   <h3>
		                                       ${coin.price}코인
		                                   </h3>
		                                   <div class="m-t-sm text-right">
		                                       <a class="btn btn-white btn-sm modalProduct" value="${coin.id}">
		                                       <i class="fa fa-krw"></i>구매하기</a>
		                                   </div>
		                               </td>
		                           </tr>
	                           </tbody>
	                       </table>
	                   </div>
	               </div>
           	   </c:forEach>
           </div>
       </div>
	</div>
</div>
<div class="modal inmodal" id="productModal" tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog modal-sm">
		<div class="modal-content animated fadeIn">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
			</div>
			<form class="form-horizontal ng-pristine ng-valid" method="post" id="productAddForm" action="/shop?email=${param.email}">
				<div class="modal-body" id="productBody">
					
				</div>
				<div class="modal-footer">
				    <button type="button" class="btn btn-white" data-dismiss="modal">닫기</button>
				    <a type="button" class="btn btn-primary" id="buyBtn">구매</a>
				</div>
			</form>
		</div>
	</div>
</div>
<%@include file="../include/footer.jsp" %>