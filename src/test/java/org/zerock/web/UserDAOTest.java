package org.zerock.web;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.persistence.User;
import org.zerock.persistence.UserDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class UserDAOTest {
	
	@Inject
	private UserDAO dao;
	
	@Test
	public void testCreate() {
		User user = new User();
		user.setEmail("yos6813@naver.com23");
		user.setUsername("윤진아");
		user.setPhotoURL("1234.png");
		user.setNickname("jina");
		user.setJoinDate("2017-01-01");
		user.setSlackID("jina");
		user.setAddress("경기도 파주");
		user.setAddress2("쇠재로30");
		user.setExtension("123");
		user.setWorkPhone("010-1234-1234");
		user.setPhone("010-1234-1234");
//		user.setCoin("1000");
		dao.create(user);
	}
}
