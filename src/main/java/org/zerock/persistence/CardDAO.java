package org.zerock.persistence;

import java.util.List;

public interface CardDAO {
	public void usageCardInsert(Card card);
	public List<Card> usageCardSelect(Card card);
	
	public int sumUsageCost(Card card);
}
