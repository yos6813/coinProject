package org.zerock.service;

import java.util.List;

import org.zerock.persistence.Admit;
import org.zerock.persistence.Board;
import org.zerock.persistence.Criteria;

public interface AdmitService {
	public void insertAbstract(Admit admit);
	public List<Admit> selectAbstract(Admit admit);
	
	public void insertAbstract2(Admit admit);
	public List<Admit> selectAbstract2(Admit admit);
	
	public int listCountCriteria(Criteria cri);
	public List<Admit> listCriteria(Criteria cri);
}
