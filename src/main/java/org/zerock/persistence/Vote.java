package org.zerock.persistence;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class Vote {
	int vNo, iNo, vuNo, icount, no;
	String vTitle, vText, vDate, vUser, email, iText;
	List<String> iText2;
	
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
	int percentage;
	int rank;

	int coNo;
	String coText;
	String coUser;
	String coDate;
	
	int countJoinUser;
	int countComment;
	
	public int getCountJoinUser() {
		return countJoinUser;
	}
	public void setCountJoinUser(int countJoinUser) {
		this.countJoinUser = countJoinUser;
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
	public int getRank() {
		return rank;
	}
	public void setRank(int rank) {
		this.rank = rank;
	}
	public int getPercentage() {
		return percentage;
	}
	public void setPercentage(int percentage) {
		this.percentage = percentage;
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
	public String getiText() {
		return iText;
	}
	public void setiText(String iText) {
		this.iText = iText;
	}
	public List<String> getiText2() {
		return iText2;
	}
	public void setiText2(List<String> iText2) {
		this.iText2 = iText2;
	}
	public int getvNo() {
		return vNo;
	}
	public void setvNo(int vNo) {
		this.vNo = vNo;
	}
	public int getiNo() {
		return iNo;
	}
	public void setiNo(int iNo) {
		this.iNo = iNo;
	}
	public int getVuNo() {
		return vuNo;
	}
	public void setVuNo(int vuNo) {
		this.vuNo = vuNo;
	}
	public int getIcount() {
		return icount;
	}
	public void setIcount(int icount) {
		this.icount = icount;
	}
	public String getvTitle() {
		return vTitle;
	}
	public void setvTitle(String vTitle) {
		this.vTitle = vTitle;
	}
	public String getvText() {
		return vText;
	}
	public void setvText(String vText) {
		this.vText = vText;
	}
	public String getvDate() {
		return vDate;
	}
	public void setvDate(String vDate) {
		this.vDate = vDate;
	}
	public String getvUser() {
		return vUser;
	}
	public void setvUser(String vUser) {
		this.vUser = vUser;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
}
