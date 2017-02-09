package org.zerock.persistence;

import java.util.List;

public interface UserDAO {
	public void create(User vo);
	
	public List<User> listAll();
	
	public void update(User vo);
	
	public User read(String email);
}
