package org.zerock.service;

import java.io.File;
import java.util.List;

import org.zerock.persistence.Admit;
import org.zerock.persistence.Criteria;

public interface AdmitService {
	public void insertAbstract(Admit admit);
	public List<Admit> selectAbstract(Admit admit);
	
	public void insertAbstract2(Admit admit);
	public List<Admit> selectAbstract2(Admit admit);
	
	public int listCountCriteria(Criteria cri);
	public List<Admit> listCriteria(Criteria cri);
	
	public List<Admit> annualList(Admit admit);
	public void insertAnnual(Admit admit);
	
	public void updateAnnual(Admit admit);
	public void holidayInsert(Admit admit);
	
	public void divisionInsert(Admit admit);
	public List<Admit> managerList(Admit admit);
	
	public List<Admit> requestList(Criteria cri);
	public void annualAccept(Admit admit);
	
	public void insertCalendar(Admit admit);
	public void managerUpdate(Admit admit);
	public void managerDelete(Admit admit);
	
	public Admit managerSelect(int id);
	public void userAnnualUpdate(Admit admit);
	
	public void requestDeny(Admit admit);
	
	public void bookAccept(Admit admit);
	public void bookDeny(Admit admit);
	
	public void articleAccept(Admit admit);
	public void articleDeny(Admit admit);
	
	public List<Admit> bookRequestList(Criteria cri);
	public List<Admit> articleRequestList(Criteria cri);
	
	public Admit requestInfo(int id);
	public Admit bookInfo(int id);
	public Admit articleInfo(int id);
	
	public void userGradeUpdate(Admit admit);
	public void userGradeUpdate2(Admit admit);
}
