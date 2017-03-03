package org.zerock.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.zerock.persistence.Card;
import org.zerock.persistence.CardDAO;
import org.zerock.util.ExcelRead;
import org.zerock.util.ExcelReadOption;

@Service
public class CardServiceImpl implements CardService{

	@Inject
	private CardDAO dao;
	
	@Override
	public void usageCardInsert(Card card) {
		dao.usageCardInsert(card);
	}

	@Override
	public List<Card> usageCardSelect(Card card) {
		return dao.usageCardSelect(card);
	}

	@Override
	public void insertMassiveArticleInBoard(File destFile) {
		  ExcelReadOption readOption = new ExcelReadOption();
		  readOption.setFilePath(destFile.getAbsolutePath());
		  readOption.setOutputColumns("A","B","C","D", "E", "F", "G", "H", "I", "J");
		  readOption.setStartRow(2);
		  
		  List<Map<String, String>> excelContent = ExcelRead.read(readOption);
		  
		  Card card = null;
		  for(Map<String, String> article : excelContent){
		   
		  card = new Card();
		  card.setUsageDate(article.get("A"));
		  card.setClassifyCard(article.get("B"));
		  card.setUsageUser(article.get("C"));
		  card.setUsageCard(article.get("D"));
		  card.setSales(article.get("E"));
		  card.setMemberStore(article.get("F"));
		  card.setCost(article.get("G"));
		  card.setAbstract1(article.get("H"));
		  card.setAbstract2(article.get("I"));
		  card.setNote(article.get("J"));
		 
		   this.usageCardInsert(card);
		  }
	}

	@Override
	public int sumUsageCost(Card card) {
		return dao.sumUsageCost(card);
	}
}
