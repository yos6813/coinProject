package org.zerock.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class CardDAOImpl implements CardDAO{

	@Inject
	private SqlSession session;
	
	private static String namespace = "org.zerock.persistence.CardDAO";
	
	@Override
	public void usageCardInsert(Card card) {
		session.insert(namespace + ".usageCardInsert", card);
	}

	@Override
	public List<Card> usageCardSelect(Card card) {
		return session.selectList(namespace + ".usageCardSelect", card);
	}

	@Override
	public int sumUsageCost(Card card) {
		return session.selectOne(namespace + ".sumUsageCost", card);
	}

	@Override
	public List<Card> concatDate(Card card) {
		return session.selectList(namespace + ".concatDate", card);
	}

	@Override
	public List<Card> orderByUser(Card card) {
		return session.selectList(namespace + ".orderByUser", card);
	}

	@Override
	public List<Card> orderByAbstract(Card card) {
		return session.selectList(namespace + ".orderByAbstract", card);
	}

	@Override
	public void pasteData(List<Integer> cNo) {
		session.insert(namespace + ".pasteData", cNo);
	}

	@Override
	public Card userCardSelect(int cNo) {
		return session.selectOne(namespace + ".userCardSelect", cNo);
	}

	@Override
	public void updateCardList(Card card) {
		session.update(namespace + ".updateCardList", card);
	}

	@Override
	public void deleteCardList(int cNo) {
		session.delete(namespace + ".deleteCardList", cNo);
	}

	@Override
	public List<Card> selectUserCard(String email) {
		return session.selectList(namespace + ".selectUserCard", email);
	}
}
