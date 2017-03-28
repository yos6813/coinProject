package org.zerock.persistence;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class Notify {
	int nNo;
	String nTitle;
	String nText;
	String nDate;
	String writeUser;
	String nFileName;
	List<MultipartFile> nFile;
	int no;
	
	String email;
	String username;
	String photoURL;
	String nickname;
	String slackID;
	String joinDate;
	String address;
	String address2;
	String extension;
	String workPhone;
	String phone;
	String coin;
	String grade;
	
	int coNo;
	String coText;
	String coUser;
	String coDate;
	
	int countComment;
	int fileCount;
	
	int fileNumber;
	
	String keyword;
	
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public int getFileNumber() {
		return fileNumber;
	}
	public void setFileNumber(int fileNumber) {
		this.fileNumber = fileNumber;
	}
	public int getFileCount() {
		return fileCount;
	}
	public void setFileCount(int fileCount) {
		this.fileCount = fileCount;
	}
	public int getCountComment() {
		return countComment;
	}
	public void setCountComment(int countComment) {
		this.countComment = countComment;
	}
	public int getCoNo() {
		return coNo;
	}
	public void setCoNo(int coNo) {
		this.coNo = coNo;
	}
	public String getCoText() {
		return coText;
	}
	public void setCoText(String coText) {
		this.coText = coText;
	}
	public String getCoUser() {
		return coUser;
	}
	public void setCoUser(String coUser) {
		this.coUser = coUser;
	}
	public String getCoDate() {
		return coDate;
	}
	public void setCoDate(String coDate) {
		this.coDate = coDate;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPhotoURL() {
		return photoURL;
	}
	public void setPhotoURL(String photoURL) {
		this.photoURL = photoURL;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getSlackID() {
		return slackID;
	}
	public void setSlackID(String slackID) {
		this.slackID = slackID;
	}
	public String getJoinDate() {
		return joinDate;
	}
	public void setJoinDate(String joinDate) {
		this.joinDate = joinDate;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getAddress2() {
		return address2;
	}
	public void setAddress2(String address2) {
		this.address2 = address2;
	}
	public String getExtension() {
		return extension;
	}
	public void setExtension(String extension) {
		this.extension = extension;
	}
	public String getWorkPhone() {
		return workPhone;
	}
	public void setWorkPhone(String workPhone) {
		this.workPhone = workPhone;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getCoin() {
		return coin;
	}
	public void setCoin(String coin) {
		this.coin = coin;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getnFileName() {
		return nFileName;
	}
	public void setnFileName(String nFileName) {
		this.nFileName = nFileName;
	}
	public List<MultipartFile> getnFile() {
		return nFile;
	}
	public void setnFile(List<MultipartFile> nFile) {
		this.nFile = nFile;
	}
	public int getnNo() {
		return nNo;
	}
	public void setnNo(int nNo) {
		this.nNo = nNo;
	}
	public String getnTitle() {
		return nTitle;
	}
	public void setnTitle(String nTitle) {
		this.nTitle = nTitle;
	}
	public String getnText() {
		return nText;
	}
	public void setnText(String nText) {
		this.nText = nText;
	}
	public String getnDate() {
		return nDate;
	}
	public void setnDate(String nDate) {
		this.nDate = nDate;
	}
	public String getWriteUser() {
		return writeUser;
	}
	public void setWriteUser(String writeUser) {
		this.writeUser = writeUser;
	}
}
