package org.zerock.persistence;

import java.util.List;

public interface CardDAO {
	public void usageCardInsert(Card card);
	public List<Card> usageCardSelect(Card card);
	
	public int sumUsageCost(Card card);
	public List<Card> concatDate(Card card);
	public List<Card> orderByUser(Card card);
	public List<Card> orderByAbstract(Card card);
	
	public void pasteData(Card card);
	public Card userCardSelect(int cNo);
	
	public void updateCardList(Card card);
	
	public void deleteCardList(int cNo);
	public List<Card> selectUserCard(String email);
}
