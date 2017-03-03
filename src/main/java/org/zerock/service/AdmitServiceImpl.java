package org.zerock.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.zerock.persistence.Admit;
import org.zerock.persistence.AdmitDAO;
import org.zerock.persistence.Criteria;

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
}
