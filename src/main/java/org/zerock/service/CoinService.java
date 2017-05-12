package org.zerock.service;

import java.util.List;

import org.zerock.persistence.Coin;

public interface CoinService {
	public void productInsert(Coin coin);
	public List<Coin> productList(Coin coin);
	public Coin productSelect(int id);
	public void shoppingList(Coin coin);
	public void updateCoin(Coin coin);
	
	public List<Coin> useCoinList(String email);
	public Coin useCoinSum(String email);
	public void productDelete(Coin coin);
	
	public Coin productList1(int id);
	public void productModify(Coin coin);
}
