<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="form-group">
	<label class="col-sm-2 control-label">이름</label>
	<div class="col-sm-10">
		<input type="hidden" value="${calendar.id}" name="id" class="form-control" readonly="readonly">
		<input type="text" readonly="readonly" value="${calendar.username}" class="form-control">
	</div>
</div>
<div class="form-group">
	<label class="col-sm-2 control-label">총 부여연차</label>
	<div class="col-sm-10">
		<input type="text" class="form-control" value="${calendar.annual}" readonly="readonly">
	</div>
</div>
<div class="form-group">
	<label class="col-sm-2 control-label">사용연차</label>
	<div class="col-sm-10">
		<input type="text" class="form-control" readonly="readonly" value="${calendar.useAnnual}">
	</div>
</div>
<div class="form-group">
	<label class="col-sm-2 control-label">잔여연차</label>
	<div class="col-sm-10">
		<input type="text" class="form-control" value="${calendar.annualNum}" readonly="readonly">
	</div>
</div>
<div class="form-group">
	<label class="col-sm-2 control-label">추가연차</label>
	<div class="col-sm-10">
		<input type="text" class="form-control" name="annualNum">
	</div>
</div>