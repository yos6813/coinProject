package org.zerock.service;

import java.util.List;

import org.zerock.persistence.Board;

public interface BoardService {
	public void insertBoard(Board board);
	public List<Board> listBoard(Board board);
	public Board viewBoard(int bNo);
	public Board getBoard(int bNo);
	public void insertActivity(Board board);
	public List<Board> ActivityList(Board board);
	public Board viewActivity(int aNo);
}
