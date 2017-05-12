package org.zerock.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class CoinDAOImpl implements CoinDAO {
	@Inject
	private SqlSession session;
	
	private static String namespace = "org.zerock.persistence.CoinDAO";

	@Override
	public void productInsert(Coin coin) {
		session.insert(namespace + ".productInsert", coin);
	}

	@Override
	public List<Coin> productList(Coin coin) {
		return session.selectList(namespace + ".productList", coin);
	}

	@Override
	public Coin productSelect(int id) {
		return session.selectOne(namespace + ".productSelect", id);
	}

	@Override
	public void shoppingList(Coin coin) {
		session.insert(namespace + ".shoppingList", coin);
	}

	@Override
	public void updateCoin(Coin coin) {
		session.update(namespace + ".updateCoin", coin);
	}

	@Override
	public List<Coin> useCoinList(String email) {
		return session.selectList(namespace + ".useCoinList", email);
	}

	@Override
	public Coin useCoinSum(String email) {
		return session.selectOne(namespace + ".useCoinSum", email);
	}

	@Override
	public void productDelete(Coin coin) {
		session.delete(namespace + ".productDelete", coin);
	}

	@Override
	public Coin productList1(int id) {
		return session.selectOne(namespace + ".productList1", id);
	}

	@Override
	public void productModify(Coin coin) {
		session.update(namespace + ".productModify", coin);
	}

}
