package org.zerock.service;

import java.util.List;

import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.zerock.persistence.Card;

public interface CardService {
	public void usageCardInsert(Card card);
	public List<Card> usageCardSelect(Card card);
}
