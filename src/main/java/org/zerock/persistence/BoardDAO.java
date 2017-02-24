package org.zerock.persistence;

import java.util.List;
import java.util.Map;

public interface BoardDAO {
	public void insertBoard(Board board);
	public List<Board> listBoard(Board board);
	public Board viewBoard(int bNo);
	public Board getBoard(int bNo);
	public void insertActivity(Board board);
	public List<Board> ActivityList(Criteria cri);
	public Board viewActivity(int aNo);
	
	public List<Board> countList1(Board board);
	public List<Board> countList2(Board board);
	public List<Board> countList3(Board board);
	public List<Board> countList4(Board board);
	
	public List<Board> listPage(int page);
	public List<Board> listCriteria(Criteria cri);
	public int countPaging(Criteria cri);
	public int countAPaging(Criteria cri);
	public int countTPaging(Criteria cri);
	
	public List<Board> ActivityList1(Board board);
	
	public void insertTask(Board board);
	public List<Board> listTask(Criteria cri);
	
	public List<Board> countTask(Board board);
	
	public List<Board> taskView(Board board);
}
