package org.zerock.persistence;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserDAOImpl implements UserDAO{

	@Inject
	private SqlSession session;
	
	private static String namespace = "org.zerock.persistence.UserDAO";
	
	@Override
	public void create(User vo) {
		session.insert(namespace + ".create", vo);
	}

	@Override
	public List<User> listAll(String email) {
		return session.selectList(namespace + ".listAll", email);
	}

	@Override
	public void update(User vo) {
		session.update(namespace + ".update", vo);
	}
	
	@Override
	public void update2(User vo) {
		session.update(namespace + ".update2", vo);
	}

	@Override
	public User read(String email) {
		return session.selectOne(namespace + ".read", email);
	}

	@Override
	public List<User> listAll2(String email) {
		return session.selectList(namespace + ".listAll2", email);
	}
}
