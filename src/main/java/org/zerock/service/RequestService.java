package org.zerock.service;

import org.zerock.persistence.Request;

public interface RequestService {
	public void bookRequest(Request request);
	public void articleRequest(Request request);
}
