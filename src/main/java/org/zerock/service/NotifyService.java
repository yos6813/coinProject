package org.zerock.service;

import java.util.List;

import org.zerock.persistence.Notify;

public interface NotifyService {
	public void insertNotify(Notify notify);
	public void insertNotifyFile(Notify notify);
	public List<Notify> notifyList(Notify notify);
	public Notify notifyView(int nNo);
	public void insertComments(Notify notify);
	public List<Notify> commentList(int nNo);
	public List<Notify> fileList(int nNo);
	public Notify notifyMod(int nNo);
	public void notifyModify(Notify notify);
	public void deleteNotify(int nNo);
	public void deleteComments(int nNo);
	public void deletenFile(int nNo);
	public List<Notify> homeList(Notify notify);
	public void commentModify (Notify notify);
	public void deleteComment(int coNo);
}
