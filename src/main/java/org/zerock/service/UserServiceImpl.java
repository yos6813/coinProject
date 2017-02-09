package org.zerock.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.zerock.persistence.User;
import org.zerock.persistence.UserDAO;

@Service
public class UserServiceImpl implements UserService{
	@Inject
	private UserDAO dao;
	
	@Override
	public void create(User vo){
		dao.create(vo);
	}

	@Override
	public List<User> listAll() {
		return dao.listAll();
	}

	@Override
	public void update(User vo) {
		dao.update(vo);
	}

	@Override
	public User read(String email) {
		return dao.read(email);
	}
}
