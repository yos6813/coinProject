package org.zerock.service;

import java.util.List;

import org.zerock.persistence.Calendar;

public interface CalendarService {
	public void insertSchedule(Calendar calendar);
	public List<Calendar> scheduleList(Calendar calendar);
}
