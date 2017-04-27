package org.zerock.service;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.zerock.persistence.Admit;
import org.zerock.persistence.AdmitDAO;
import org.zerock.persistence.Card;
import org.zerock.persistence.Criteria;
import org.zerock.util.ExcelRead;
import org.zerock.util.ExcelReadOption;

@Service
public class AdmitServiceImpl implements AdmitService{

	@Inject
	private AdmitDAO dao;
	
	@Override
	public void insertAbstract(Admit admit) {
		dao.insertAbstract(admit);
	}

	@Override
	public List<Admit> selectAbstract(Admit admit) {
		return dao.selectAbstract(admit);
	}

	@Override
	public void insertAbstract2(Admit admit) {
		dao.insertAbstract2(admit);
	}

	@Override
	public List<Admit> selectAbstract2(Admit admit) {
		return dao.selectAbstract2(admit);
	}

	@Override
	public int listCountCriteria(Criteria cri) {
		return dao.countPaging(cri);
	}

	@Override
	public List<Admit> listCriteria(Criteria cri) {
		return dao.listCriteria(cri);
	}

	@Override
	public List<Admit> annualList(Admit admit) {
		return dao.annualList(admit);
	}

	@Override
	public void insertAnnual(Admit admit) {
		dao.insertAnnual(admit);
	}

	@Override
	public void updateAnnual(Admit admit) {
		dao.updateAnnual(admit);
	}

	@Override
	public void holidayInsert(Admit admit) {
		dao.holidayInsert(admit);
	}

	@Override
	public void divisionInsert(Admit admit) {
		dao.divisionInsert(admit);
	}

	@Override
	public List<Admit> managerList(Admit admit) {
		return dao.managerList(admit);
	}

	@Override
	public List<Admit> requestList(Criteria cri) {
		return dao.requestList(cri);
	}

	@Override
	public void annualAccept(Admit admit) {
		dao.annualAccept(admit);
	}

	@Override
	public void insertCalendar(Admit admit) {
		dao.insertCalendar(admit);
	}

	@Override
	public void managerUpdate(Admit admit) {
		dao.managerUpdate(admit);
	}

	@Override
	public void managerDelete(Admit admit) {
		dao.managerDelete(admit);
	}

	@Override
	public Admit managerSelect(int id) {
		return dao.managerSelect(id);
	}

	@Override
	public void userAnnualUpdate(Admit admit) {
		dao.userAnnualUpdate(admit);
	}

	@Override
	public void requestDeny(Admit admit) {
		dao.requestDeny(admit);
	}

	@Override
	public List<Admit> bookRequestList(Criteria cri) {
		return dao.bookRequestList(cri);
	}

	@Override
	public List<Admit> articleRequestList(Criteria cri) {
		return dao.articleRequestList(cri);
	}

	@Override
	public void bookAccept(Admit admit) {
		dao.bookAccept(admit);
	}

	@Override
	public void bookDeny(Admit admit) {
		dao.bookDeny(admit);
	}

	@Override
	public void articleAccept(Admit admit) {
		dao.articleAccept(admit);
	}

	@Override
	public void articleDeny(Admit admit) {
		dao.articleDeny(admit);
	}

	@Override
	public Admit requestInfo(int id) {
		return dao.requestInfo(id);
	}

	@Override
	public Admit bookInfo(int id) {
		return dao.bookInfo(id);
	}

	@Override
	public Admit articleInfo(int id) {
		return dao.articleInfo(id);
	}

	@Override
	public void userGradeUpdate(Admit admit) {
		dao.userGradeUpdate(admit);
	}

	@Override
	public void userGradeUpdate2(Admit admit) {
		dao.userGradeUpdate2(admit);
	}
}
