<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="form-group">
	<div class="col-sm-12 text-center">
		<input type="hidden" value="상품구매" name="division">
		<input type="hidden" value="${coin.name}" name="useText">
		<input type="hidden" id="buyDate" name="useDate">
		<h2>${coin.name}</h2>
		<small id="price">${coin.price}</small>코인
	</div>
</div>
<div class="form-group">
	<label class="col-sm-4 control-label">갯수</label>
	<div class="col-sm-8">
		<input type="text" name="etc" class="form-control" onkeyup="num()" id="numProduct">
	</div>
</div>
<div class="form-group">
	<label class="col-sm-4 control-label">가격</label>
	<div class="col-sm-8">
		<input type="text" name="useCoin" class="form-control" id="priceProduct" readonly="readonly" value="0">
	</div>
</div>
<div class="form-group">
	<label class="col-sm-4 control-label">보유코인</label>
	<div class="col-sm-8">
		<input type="text" class="form-control" value="${user.coin}" id="ownCoin" readonly="readonly">
	</div>
</div>
<div class="form-group">
	<label class="col-sm-4 control-label">잔여코인</label>
	<div class="col-sm-8">
		<input type="text" name="coin" class="form-control" id="remainingCoin" readonly="readonly">
	</div>
</div>
<div class="form-group hidden" id="dangerLabel">
	<div class="col-sm-12 text-center">
		<label class="text text-danger">코인이 부족합니다.</label>
	</div>
</div>