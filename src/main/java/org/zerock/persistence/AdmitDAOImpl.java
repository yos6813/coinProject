package org.zerock.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class AdmitDAOImpl implements AdmitDAO{
	
	@Inject
	private SqlSession session;
	
	private static String namespace = "org.zerock.persistence.AdmitDAO";
	
	@Override
	public void insertAbstract(Admit admit) {
		session.insert(namespace + ".insertAbstract", admit);
	}

	@Override
	public List<Admit> selectAbstract(Admit admit) {
		return session.selectList(namespace + ".selectAbstract", admit);
	}

	@Override
	public void insertAbstract2(Admit admit) {
		session.insert(namespace + ".insertAbstract2", admit);
	}

	@Override
	public List<Admit> selectAbstract2(Admit admit) {
		return session.selectList(namespace + ".selectAbstract2", admit);
	}

	@Override
	public int countPaging(Criteria cri) {
		return session.selectOne(namespace + ".countPaging", cri);
	}

	@Override
	public List<Admit> listCriteria(Criteria cri) {
		return session.selectList(namespace + ".listCriteria", cri);
	}
}
