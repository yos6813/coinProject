package org.zerock.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.zerock.persistence.Request;
import org.zerock.persistence.RequestDAO;

@Service
public class RequestServiceImpl implements RequestService{
	@Inject
	private RequestDAO dao;

	@Override
	public void bookRequest(Request request) {
		dao.bookRequest(request);
	}

	@Override
	public void articleRequest(Request request) {
		dao.articleRequest(request);
	}
	
}
