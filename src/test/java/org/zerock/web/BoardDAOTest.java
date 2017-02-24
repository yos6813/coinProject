package org.zerock.web;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.zerock.persistence.Board;
import org.zerock.persistence.BoardDAO;
import org.zerock.persistence.Criteria;

public class BoardDAOTest {
	private static final Logger logger = LoggerFactory.getLogger(BoardDAOTest.class);
	
	private BoardDAO dao;
	
	@Test
	public void testListPage() {
		int page = 1;
		
		List<Board> list = dao.listPage(page);
		
		for(Board board : list){
//			logger.info(list.toString());
			logger.info(board.getbNo() + ":" + board.getpName());
		}
	}
	
	@Test
	public void testListCriteria() throws Exception{
		Criteria cri = new Criteria();
		
		cri.setPage(1);
		cri.setPerPageNum(5);
		
		List<Board> list = dao.listCriteria(cri);
		
		for(Board board : list){
			logger.info(board.getbNo() + ":" + board.getpName());
		}
	}
}
