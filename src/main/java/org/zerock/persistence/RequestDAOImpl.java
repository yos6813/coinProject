package org.zerock.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class RequestDAOImpl implements RequestDAO{
	
	@Inject
	private SqlSession session;
	
	private static String namespace = "org.zerock.persistence.RequestDAO";

	@Override
	public void bookRequest(Request request) {
		session.insert(namespace + ".bookRequest", request);
	}

	@Override
	public void articleRequest(Request request) {
		session.insert(namespace + ".articleRequest", request);
	}
}
