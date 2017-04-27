<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="col-md-12">
    <h2 class="font-bold m-b-xs">
        ${admit.name }
    </h2>
    <small>${admit.maker }</small>
    <div class="m-t-md">
        <h3 class="product-main-price"><i class="fa fa-krw"></i>${admit.price} </h3>
    </div>
    <hr>

    <h4>신청사유</h4>

    <div class="small text-muted">
        ${admit.purpose }
    </div>
    <dl class="small m-t-md">
        <dt>구매링크</dt>
        <dd><a href="${admit.link }">클릭</a></dd>
        <dt>신청일자</dt>
        <dd>${admit.requestDate}</dd>
        <dt>신청자</dt>
        <dd>${admit.username}/${admit.email}</dd>
    </dl>
</div>
