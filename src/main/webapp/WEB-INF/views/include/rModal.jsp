<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="col-md-12">
    <h2 class="font-bold m-b-xs">
        ${admit.division}신청
    </h2>
    <hr>
    <h4>기간</h4>
    <div class="small text-muted">
        ${admit.start} ~ ${admit.end}(${admit.annualNum}일)
    </div>
    <dl class="small m-t-md">
        <dt>신청 일자</dt>
        <dd>${admit.requestDate}</dd>
        <dt>신청자</dt>
        <dd>${admit.username}/${admit.email}</dd>
    </dl>
</div>