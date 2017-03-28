package org.zerock.persistence;

import java.util.List;

public interface CalendarDAO {
	public void insertSchedule(Calendar calendar);
	public List<Calendar> scheduleList(Calendar calendar);
}
