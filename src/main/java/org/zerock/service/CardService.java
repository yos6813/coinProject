package org.zerock.service;

import java.io.File;
import java.util.List;

import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.zerock.persistence.Card;

public interface CardService {
	public void usageCardInsert(Card card);
	public List<Card> usageCardSelect(Card card);
	public void insertMassiveArticleInBoard(File destFile);
	
	public int sumUsageCost(Card card);
	public List<Card> concatDate(Card card);
	public List<Card> orderByUser(Card card);
	public List<Card> orderByAbstract(Card card);
}
