package org.zerock.service;

import java.util.List;
import java.util.Map;

import org.zerock.persistence.User;

public interface UserService {
	public void create(User vo);
	
	public List<User> listAll(String email);
	
	public void update(User vo);
	
	public void update2(User vo);
	
	public User read(String email);
	
	public List<User> listAll2(String email);
}
