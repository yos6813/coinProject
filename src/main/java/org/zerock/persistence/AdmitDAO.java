package org.zerock.persistence;

import java.util.List;

public interface AdmitDAO {
	public void insertAbstract(Admit admit);
	public List<Admit> selectAbstract(Admit admit);
	
	public void insertAbstract2(Admit admit);
	public List<Admit> selectAbstract2(Admit admit);
	
	public int countPaging(Criteria cri);
	public List<Admit> listCriteria(Criteria cri);
}
