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
}
