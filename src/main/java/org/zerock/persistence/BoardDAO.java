package org.zerock.persistence;

import java.util.List;
import java.util.Map;

public interface BoardDAO {
	public void insertBoard(Board board);
	public List<Board> listBoard(Board board);
	public Board viewBoard(int bNo);
	public Board getBoard(int bNo);
	public void insertActivity(Board board);
	public List<Board> ActivityList(Board board);
	public Board viewActivity(int aNo);
	
	public List<Board> countList1(Board board);
	public List<Board> countList2(Board board);
	public List<Board> countList3(Board board);
	public List<Board> countList4(Board board);
	public List<Board> countList5(Board board);
}
