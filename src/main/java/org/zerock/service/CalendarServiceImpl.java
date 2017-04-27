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

	@Override
	public Calendar annualList(String email) {
		return dao.annualList(email);
	}

	@Override
	public Calendar holidayCount(Calendar calendar) {
		return dao.holidayCount(calendar);
	}

	@Override
	public void annualRequest(Calendar calendar) {
		dao.annualRequest(calendar);
	}

	@Override
	public List<Calendar> scheduleList1(Calendar calendar) {
		return dao.scheduleList1(calendar);
	}

	@Override
	public List<Calendar> annualListAll(Calendar calendar) {
		return dao.annualListAll(calendar);
	}

	@Override
	public Calendar searchUserAnnual(int id) {
		return dao.searchUserAnnual(id);
	}

	@Override
	public void updateAnnual(Calendar calendar) {
		dao.updateAnnual(calendar);
	}

	@Override
	public List<Calendar> annualManager(Calendar calendar) {
		return dao.annualManager(calendar);
	}

	@Override
	public List<Calendar> articleManager(Calendar calendar) {
		return dao.articleManager(calendar);
	}

	@Override
	public List<Calendar> bookManager(Calendar calendar) {
		return dao.bookManager(calendar);
	}

}
