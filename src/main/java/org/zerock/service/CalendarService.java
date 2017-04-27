package org.zerock.service;

import java.util.List;

import org.zerock.persistence.Calendar;

public interface CalendarService {
	public void insertSchedule(Calendar calendar);
	public List<Calendar> scheduleList(Calendar calendar);
	
	public Calendar annualList(String email);
	public Calendar holidayCount(Calendar calendar);
	
	public void annualRequest(Calendar calendar);
	
	public List<Calendar> scheduleList1(Calendar calendar);
	
	public List<Calendar> annualListAll(Calendar calendar);
	
	public Calendar searchUserAnnual(int id);
	
	public void updateAnnual(Calendar calendar);
	
	public List<Calendar> annualManager(Calendar calendar);
	
	public List<Calendar> articleManager(Calendar calendar);
	public List<Calendar> bookManager(Calendar calendar);
}
