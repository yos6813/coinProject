package org.zerock.persistence;

import java.util.List;

import javax.inject.Inject;
import javax.management.Query;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDAOImpl implements BoardDAO{
	@Inject
	private SqlSession session;
	
	private static String namespace = "org.zerock.persistence.BoardDAO";

	@Override
	public void insertBoard(Board board) {
		session.insert(namespace + ".insertBoard", board);
	}

	@Override
	public List<Board> listBoard(Board board) {
		return session.selectList(namespace + ".listBoard", board);
	}

	@Override
	public Board viewBoard(int bNo) {
		return session.selectOne(namespace + ".viewBoard", bNo);
	}

	@Override
	public Board getBoard(int bNo) {
		return session.selectOne(namespace + ".getBoard", bNo);
	}

	@Override
	public void insertActivity(Board board) {
		session.insert(namespace + ".insertActivity", board);
	}

	@Override
	public List<Board> ActivityList(Board board) {
		return session.selectList(namespace + ".ActivityList", board);
	}

	@Override
	public Board viewActivity(int aNo) {
		return session.selectOne(namespace + ".viewActivity", aNo);
	}

	@Override
	public List<Board> countList1(Board board) {
		return session.selectList(namespace + ".countList1", board);
	}

	@Override
	public List<Board> countList2(Board board) {
		return session.selectList(namespace + ".countList2", board);
	}

	@Override
	public List<Board> countList3(Board board) {
		return session.selectList(namespace + ".countList3", board);
	}

	@Override
	public List<Board> countList4(Board board) {
		return session.selectList(namespace + ".countList4", board);
	}

	@Override
	public List<Board> countList5(Board board) {
		return session.selectList(namespace + ".countList5", board);
	}
}
