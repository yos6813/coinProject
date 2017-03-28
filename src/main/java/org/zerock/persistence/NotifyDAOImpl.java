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

	@Override
	public Notify notifyMod(int nNo) {
		return session.selectOne(namespace + ".notifyMod", nNo);
	}

	@Override
	public void notifyModify(Notify notify) {
		session.update(namespace + ".notifyModify", notify);
	}

	@Override
	public void deleteNotify(int nNo) {
		session.delete(namespace + ".deleteNotify", nNo);
	}

	@Override
	public void deleteComments(int nNo) {
		session.delete(namespace + ".deleteComments", nNo);
	}

	@Override
	public void deletenFile(int nNo) {
		session.delete(namespace + ".deletenFile", nNo);
	}

	@Override
	public List<Notify> homeList(Notify notify) {
		return session.selectList(namespace + ".homeList", notify);
	}

	@Override
	public void commentModify(Notify notify) {
		session.update(namespace + ".commentModify", notify);
	}

	@Override
	public void deleteComment(int coNo) {
		session.delete(namespace + ".deleteComment", coNo);
	}

	@Override
	public List<Notify> selectFileList(Notify notify) {
		return session.selectList(namespace + ".selectFileList", notify);
	}
}
