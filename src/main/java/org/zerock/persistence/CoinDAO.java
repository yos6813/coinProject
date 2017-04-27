package org.zerock.persistence;

import java.util.List;

public interface CoinDAO {
	public void productInsert(Coin coin);
	public List<Coin> productList(Coin coin);
	public Coin productSelect(int id);
	public void shoppingList(Coin coin);
	
	public void updateCoin(Coin coin);
	public List<Coin> useCoinList(String email);
	public Coin useCoinSum(String email);
}
