package org.zerock.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.zerock.persistence.Board;
import org.zerock.persistence.BoardDAO;
import org.zerock.persistence.Criteria;

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
	public void insertActivity(Board board) {
		dao.insertActivity(board);
	}

	@Override
	public List<Board> ActivityList(Criteria cri) {
		return dao.ActivityList(cri);
	}

	@Override
	public Board viewActivity(String aNo) {
		return dao.viewActivity(aNo);
	}

	@Override
	public List<Board> listCriteria(Criteria cri) {
		return dao.listCriteria(cri);
	}

	@Override
	public int listCountCriteria(Criteria cri) {
		return dao.countPaging(cri);
	}

	@Override
	public int listCountACriteria(Criteria cri) {
		return dao.countAPaging(cri);
	}

	@Override
	public List<Board> ActivityList1(Board board) {
		return dao.ActivityList1(board);
	}

	@Override
	public void insertTask(Board board) {
		dao.insertTask(board);
	}

	@Override
	public List<Board> listTask(Criteria cri) {
		return dao.listTask(cri);
	}

	@Override
	public List<Board> countTask(Board board) {
		return dao.countTask(board);
	}

	@Override
	public int listCountTCriteria(Criteria cri) {
		return dao.countTPaging(cri);
	}

	@Override
	public List<Board> taskView(Board board) {
		return dao.taskView(board);
	}

	@Override
	public List<Board> countList1(Board board) {
		return dao.countList1(board);
	}

	@Override
	public List<Board> countList2(Board board) {
		return dao.countList2(board);
	}

	@Override
	public List<Board> countList3(Board board) {
		return dao.countList3(board);
	}

	@Override
	public List<Board> countList4(Board board) {
		return dao.countList4(board);
	}

	@Override
	public Board viewTask(int tNo) {
		return dao.viewTask(tNo);
	}

	@Override
	public void delProject(int bNo) {
		dao.delProject(bNo);
	}

	@Override
	public void delActivity(int bNo) {
		dao.delActivity(bNo);
	}

	@Override
	public void delTask(int bNo) {
		dao.delTask(bNo);
	}

	@Override
	public void delA(int aNo) {
		dao.delA(aNo);
	}

	@Override
	public void delT(int aNo) {
		dao.delT(aNo);
	}

	@Override
	public void deleteTask(int tNo) {
		dao.deleteTask(tNo);
	}

	@Override
	public void updateP(Board board) {
		dao.updateP(board);
	}

	@Override
	public void updateA(Board board) {
		dao.updateA(board);
	}

	@Override
	public void updateT(Board board) {
		dao.updateT(board);
	}

	@Override
	public List<Board> countPercent(int bNo) {
		return dao.countPercent(bNo);
	}

	@Override
	public List<Board> countOrderbyUser(String aNo) {
		return dao.countOrderbyUser(aNo);
	}

	@Override
	public List<Board> joinUser(Board board) {
		return dao.joinUser(board);
	}

	@Override
	public void insertWorkLog(Board board) {
		dao.insertWorkLog(board);
	}

	@Override
	public List<Board> selectWorkLog(int tNo) {
		return dao.selectWorkLog(tNo);
	}

	@Override
	public List<Board> selectUserWorkLog(int tNo) {
		return dao.selectUserWorkLog(tNo);
	}
}
