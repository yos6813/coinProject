package org.zerock.persistence;

import java.util.List;

public interface NotifyDAO {
	public void insertNotify(Notify notify);
	public void insertNotifyFile(Notify notify);
	public List<Notify> notifyList(Notify notify);
	public Notify notifyView(int nNo);
	public void insertComments(Notify notify);
	public List<Notify> commentList(int nNo);
	public List<Notify> fileList(int nNo);
}
