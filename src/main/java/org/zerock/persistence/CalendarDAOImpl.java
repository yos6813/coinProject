package org.zerock.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class CalendarDAOImpl implements CalendarDAO{
	
	@Inject
	private SqlSession session;
	
	private static String namespace = "org.zerock.persistence.CalendarDAO";

	@Override
	public void insertSchedule(Calendar calendar) {
		session.insert(namespace + ".insertSchedule", calendar);
	}

	@Override
	public List<Calendar> scheduleList(Calendar calendar) {
		return session.selectList(namespace + ".scheduleList", calendar);
	}

	@Override
	public Calendar annualList(String email) {
		return session.selectOne(namespace + ".annualList", email);
	}

	@Override
	public Calendar holidayCount(Calendar calendar) {
		return session.selectOne(namespace + ".holidayCount", calendar);
	}

	@Override
	public void annualRequest(Calendar calendar) {
		session.insert(namespace + ".annualRequest", calendar);
	}

	@Override
	public List<Calendar> scheduleList1(Calendar calendar) {
		return session.selectList(namespace + ".scheduleList1", calendar);
	}

	@Override
	public List<Calendar> annualListAll(Calendar calendar) {
		return session.selectList(namespace + ".annualListAll", calendar);
	}

	@Override
	public Calendar searchUserAnnual(int id) {
		return session.selectOne(namespace + ".searchUserAnnual", id);
	}

	@Override
	public void updateAnnual(Calendar calendar) {
		session.update(namespace + ".updateAnnual", calendar);
	}

	@Override
	public List<Calendar> annualManager(Calendar calendar) {
		return session.selectList(namespace + ".annualManager", calendar);
	}

	@Override
	public List<Calendar> articleManager(Calendar calendar) {
		return session.selectList(namespace + ".articleManager", calendar);
	}

	@Override
	public List<Calendar> bookManager(Calendar calendar) {
		return session.selectList(namespace + ".bookManager", calendar);
	}

}
