package org.zerock.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class NotifyDAOImpl implements NotifyDAO {
	
	@Inject
	private SqlSession session;
	
	private static String namespace = "org.zerock.persistence.NotifyDAO";

	@Override
	public void insertNotify(Notify notify) {
		session.insert(namespace + ".insertNotify", notify);
	}

	@Override
	public void insertNotifyFile(Notify notify) {
		session.insert(namespace + ".insertNotifyFile", notify);
	}

	@Override
	public List<Notify> notifyList(Notify notify) {
		return session.selectList(namespace + ".notifyList", notify);
	}

	@Override
	public Notify notifyView(int nNo) {
		return session.selectOne(namespace + ".notifyView", nNo);
	}

	@Override
	public void insertComments(Notify notify) {
		session.insert(namespace + ".insertComments", notify);
	}

	@Override
	public List<Notify> commentList(int nNo) {
		return session.selectList(namespace + ".commentList", nNo);
	}

	@Override
	public List<Notify> fileList(int nNo) {
		return session.selectList(namespace + ".fileList", nNo);
	}
}
