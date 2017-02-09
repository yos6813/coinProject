package org.zerock.service;

import java.util.List;

import org.zerock.persistence.User;

public interface UserService {
	public void create(User vo);
	
	public List<User> listAll();
	
	public void update(User vo);
	
	public User read(String email);
}
