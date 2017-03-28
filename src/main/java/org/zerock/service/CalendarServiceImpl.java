package org.zerock.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.zerock.persistence.Calendar;
import org.zerock.persistence.CalendarDAO;

@Service
public class CalendarServiceImpl implements CalendarService {

	@Inject
	private CalendarDAO dao;
	
	@Override
	public void insertSchedule(Calendar calendar) {
		dao.insertSchedule(calendar);
	}

	@Override
	public List<Calendar> scheduleList(Calendar calendar) {
		return dao.scheduleList(calendar);
	}

}
