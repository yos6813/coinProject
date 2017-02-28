package org.zerock.persistence;

import java.util.List;
import java.util.Map;

public interface UserDAO {
	public void create(User vo);
	
	public List<User> listAll(String email);
	
	public void update(User vo);
	
	public void update2(User vo);
	
	public User read(String email);
	
	public List<User> listAll2(String email);
}
