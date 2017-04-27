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
	public void insertActivity(Board board) {
		session.insert(namespace + ".insertActivity", board);
	}

	@Override
	public List<Board> ActivityList(Criteria cri) {
		return session.selectList(namespace + ".ActivityList", cri);
	}

	@Override
	public Board viewActivity(String aNo) {
		return session.selectOne(namespace + ".viewActivity", aNo);
	}

	@Override
	public List<Board> countList1(Board board) {
		return session.selectList(namespace + ".countList1", board);
	}

	@Override
	public List<Board> listPage(int page) {
		if(page<=0){
			page = 1;
		}
		
		page = (page - 1) * 10;
		
		return session.selectList(namespace + ".listPage", page);
	}

	@Override
	public List<Board> listCriteria(Criteria cri) {
		return session.selectList(namespace + ".listCriteria", cri);
	}

	@Override
	public int countPaging(Criteria cri) {
		return session.selectOne(namespace + ".countPaging", cri);
	}

	@Override
	public int countAPaging(Criteria cri) {
		return session.selectOne(namespace + ".countAPaging", cri);
	}

	@Override
	public List<Board> ActivityList1(Criteria cri) {
		return session.selectList(namespace + ".ActivityList1", cri);
	}

	@Override
	public void insertTask(Board board) {
		session.insert(namespace + ".insertTask", board);
	}

	@Override
	public List<Board> listTask(Criteria cri) {
		return session.selectList(namespace + ".listTask", cri);
	}

	@Override
	public List<Board> countTask(Board board) {
		return session.selectList(namespace + ".countTask", board);
	}

	@Override
	public int countTPaging(Criteria cri) {
		return session.selectOne(namespace + ".countTPaging", cri);
	}

	@Override
	public List<Board> taskView(Board board) {
		return session.selectList(namespace + ".taskView", board);
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
	public Board viewTask(int tNo) {
		return session.selectOne(namespace + ".viewTask", tNo);
	}

	@Override
	public void delProject(int bNo) {
		session.delete(namespace + ".delProject", bNo);
	}

	@Override
	public void delActivity(int bNo) {
		session.delete(namespace + ".delActivity", bNo);
	}

	@Override
	public void delTask(int bNo) {
		session.delete(namespace + ".delTask", bNo);
	}

	@Override
	public void delA(int aNo) {
		session.delete(namespace + ".delA", aNo);
	}

	@Override
	public void delT(int aNo) {
		session.delete(namespace + ".delT", aNo);
	}

	@Override
	public void deleteTask(int tNo) {
		session.delete(namespace + ".deleteTask", tNo);		
	}

	@Override
	public void updateP(Board board) {
		session.update(namespace + ".updateP", board);
	}

	@Override
	public void updateA(Board board) {
		session.update(namespace + ".updateA", board);
	}

	@Override
	public void updateT(Board board) {
		session.update(namespace + ".updateT", board);
	}

	@Override
	public List<Board> countPercent(int bNo) {
		return session.selectList(namespace + ".countPercent", bNo);
	}

	@Override
	public List<Board> countOrderbyUser(String aNo) {
		return session.selectList(namespace + ".countOrderbyUser", aNo);
	}

	@Override
	public List<Board> joinUser(Board board) {
		return session.selectList(namespace + ".joinUser", board);
	}

	@Override
	public void insertWorkLog(Board board) {
		session.insert(namespace + ".insertWorkLog", board);
	}

	@Override
	public List<Board> selectWorkLog(Criteria cri) {
		return session.selectList(namespace + ".selectWorkLog", cri);
	}

	@Override
	public List<Board> selectUserWorkLog(int aNo) {
		return session.selectList(namespace + ".selectUserWorkLog", aNo);
	}

	@Override
	public int countWPaging(Criteria cri) {
		return session.selectOne(namespace + ".countWPaging", cri);
	}

	@Override
	public List<Board> infiniteScrollDown(String wNo) {
		return session.selectList(namespace+ ".infiniteScrollDown", wNo);
	}

	@Override
	public void updateProject(Board board) {
		session.update(namespace + ".updateProject", board);
	}

	@Override
	public Board viewActivityLog(int aNo) {
		return session.selectOne(namespace + ".viewActivityLog", aNo);
	}
}
