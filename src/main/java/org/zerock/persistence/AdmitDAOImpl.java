package org.zerock.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class AdmitDAOImpl implements AdmitDAO{
	
	@Inject
	private SqlSession session;
	
	private static String namespace = "org.zerock.persistence.AdmitDAO";
	
	@Override
	public void insertAbstract(Admit admit) {
		session.insert(namespace + ".insertAbstract", admit);
	}

	@Override
	public List<Admit> selectAbstract(Admit admit) {
		return session.selectList(namespace + ".selectAbstract", admit);
	}

	@Override
	public void insertAbstract2(Admit admit) {
		session.insert(namespace + ".insertAbstract2", admit);
	}

	@Override
	public List<Admit> selectAbstract2(Admit admit) {
		return session.selectList(namespace + ".selectAbstract2", admit);
	}

	@Override
	public int countPaging(Criteria cri) {
		return session.selectOne(namespace + ".countPaging", cri);
	}

	@Override
	public List<Admit> listCriteria(Criteria cri) {
		return session.selectList(namespace + ".listCriteria", cri);
	}

	@Override
	public List<Admit> annualList(Admit admit) {
		return session.selectList(namespace + ".annualList", admit);
	}

	@Override
	public void insertAnnual(Admit admit) {
		session.selectList(namespace + ".insertAnnual", admit);
	}

	@Override
	public void updateAnnual(Admit admit) {
		session.update(namespace + ".updateAnnual", admit);
	}

	@Override
	public void holidayInsert(Admit admit) {
		session.insert(namespace + ".holidayInsert", admit);
	}

	@Override
	public void divisionInsert(Admit admit) {
		session.insert(namespace + ".divisionInsert", admit);
	}

	@Override
	public List<Admit> managerList(Admit admit) {
		return session.selectList(namespace + ".managerList", admit);
	}

	@Override
	public List<Admit> requestList(Criteria cri) {
		return session.selectList(namespace + ".requestList", cri);
	}

	@Override
	public void annualAccept(Admit admit) {
		session.update(namespace + ".annualAccept", admit);
	}

	@Override
	public void insertCalendar(Admit admit) {
		session.insert(namespace + ".insertCalendar", admit);
	}

	@Override
	public void managerUpdate(Admit admit) {
		session.update(namespace + ".managerUpdate", admit);
	}

	@Override
	public void managerDelete(Admit admit) {
		session.delete(namespace + ".managerDelete", admit);
	}

	@Override
	public Admit managerSelect(int id) {
		return session.selectOne(namespace + ".managerSelect", id);
	}

	@Override
	public void userAnnualUpdate(Admit admit) {
		session.update(namespace + ".userAnnualUpdate", admit);
	}

	@Override
	public void requestDeny(Admit admit) {
		session.update(namespace + ".requestDeny", admit);
	}

	@Override
	public List<Admit> bookRequestList(Criteria cri) {
		return session.selectList(namespace + ".bookRequestList", cri);
	}

	@Override
	public List<Admit> articleRequestList(Criteria cri) {
		return session.selectList(namespace + ".articleRequestList", cri);
	}

	@Override
	public void bookAccept(Admit admit) {
		session.update(namespace + ".bookAccept", admit);
	}

	@Override
	public void bookDeny(Admit admit) {
		session.update(namespace + ".bookDeny", admit);
	}

	@Override
	public void articleAccept(Admit admit) {
		session.update(namespace + ".articleAccept", admit);
	}

	@Override
	public void articleDeny(Admit admit) {
		session.update(namespace + ".articleDeny", admit);
	}

	@Override
	public Admit requestInfo(int id) {
		return session.selectOne(namespace + ".requestInfo", id);
	}

	@Override
	public Admit bookInfo(int id) {
		return session.selectOne(namespace + ".bookInfo", id);
	}

	@Override
	public Admit articleInfo(int id) {
		return session.selectOne(namespace + ".articleInfo", id);
	}

	@Override
	public void userGradeUpdate(Admit admit) {
		session.update(namespace + ".userGradeUpdate", admit);
	}

	@Override
	public void userGradeUpdate2(Admit admit) {
		session.update(namespace + ".userGradeUpdate2", admit);
	}
}
