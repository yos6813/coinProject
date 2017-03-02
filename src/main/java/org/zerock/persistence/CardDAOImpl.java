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
}
