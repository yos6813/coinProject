package org.zerock.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.zerock.persistence.Board;
import org.zerock.persistence.BoardDAO;

@Service
public class BoardServiceImpl implements BoardService{
	@Inject
	private BoardDAO dao;

	@Override
	public void insertBoard(Board board) {
		dao.insertBoard(board);
	}

	@Override
	public List<Board> listBoard(Board board) {
		return dao.listBoard(board);
	}

	@Override
	public Board viewBoard(int bNo) {
		return dao.viewBoard(bNo);
	}

	@Override
	public Board getBoard(int bNo) {
		return dao.getBoard(bNo);
	}

	@Override
	public void insertActivity(Board board) {
		dao.insertActivity(board);
	}

	@Override
	public List<Board> ActivityList(Board board) {
		return dao.ActivityList(board);
	}

	@Override
	public Board viewActivity(int aNo) {
		return dao.viewActivity(aNo);
	}
}
