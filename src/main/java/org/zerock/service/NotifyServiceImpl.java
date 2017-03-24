package org.zerock.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.zerock.persistence.Notify;
import org.zerock.persistence.NotifyDAO;

@Service
public class NotifyServiceImpl implements NotifyService {
	
	@Inject
	private NotifyDAO dao;
	
	@Override
	public void insertNotify(Notify notify) {
		dao.insertNotify(notify);
	}

	@Override
	public void insertNotifyFile(Notify notify) {
		dao.insertNotifyFile(notify);
	}

	@Override
	public List<Notify> notifyList(Notify notify) {
		return dao.notifyList(notify);
	}

	@Override
	public Notify notifyView(int nNo) {
		return dao.notifyView(nNo);
	}

	@Override
	public void insertComments(Notify notify) {
		dao.insertComments(notify);
	}

	@Override
	public List<Notify> commentList(int nNo) {
		return dao.commentList(nNo);
	}

	@Override
	public List<Notify> fileList(int nNo) {
		return dao.fileList(nNo);
	}

	@Override
	public Notify notifyMod(int nNo) {
		return dao.notifyMod(nNo);
	}

	@Override
	public void notifyModify(Notify notify) {
		dao.notifyModify(notify);
	}

	@Override
	public void deleteNotify(int nNo) {
		dao.deleteNotify(nNo);
	}

	@Override
	public void deleteComments(int nNo) {
		dao.deleteComments(nNo);
	}

	@Override
	public void deletenFile(int nNo) {
		dao.deletenFile(nNo);
	}

	@Override
	public List<Notify> homeList(Notify notify) {
		return dao.homeList(notify);
	}

	@Override
	public void commentModify(Notify notify) {
		dao.commentModify(notify);
	}

	@Override
	public void deleteComment(int coNo) {
		dao.deleteComment(coNo);
	}

}
