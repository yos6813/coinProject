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

}
