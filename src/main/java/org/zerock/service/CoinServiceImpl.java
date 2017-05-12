package org.zerock.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.zerock.persistence.Coin;
import org.zerock.persistence.CoinDAO;

@Service
public class CoinServiceImpl implements CoinService{
	
	@Inject
	private CoinDAO dao;

	@Override
	public void productInsert(Coin coin) {
		dao.productInsert(coin);
	}

	@Override
	public List<Coin> productList(Coin coin) {
		return dao.productList(coin);
	}

	@Override
	public Coin productSelect(int id) {
		return dao.productSelect(id);
	}

	@Override
	public void shoppingList(Coin coin) {
		dao.shoppingList(coin);
	}

	@Override
	public void updateCoin(Coin coin) {
		dao.updateCoin(coin);
	}

	@Override
	public List<Coin> useCoinList(String email) {
		return dao.useCoinList(email);
	}

	@Override
	public Coin useCoinSum(String email) {
		return dao.useCoinSum(email);
	}

	@Override
	public void productDelete(Coin coin) {
		dao.productDelete(coin);
	}

	@Override
	public Coin productList1(int id) {
		return dao.productList1(id);
	}

	@Override
	public void productModify(Coin coin) {
		dao.productModify(coin);
	}

}
