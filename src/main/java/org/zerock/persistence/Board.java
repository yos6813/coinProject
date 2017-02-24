package org.zerock.persistence;

public class Board {
	int bNo;
	String writeUser;
	String writeDate;
	int pNo;
	String projectDate;
	
	String text;
	int budget;
	String pm;
	
	String email;
	String username;
	String photoURL;
	
	String type;
	String keyword;
	
	String pName;
	String status;
	
	String writePhoto;
	String pmPhoto;
	
	String pmSlack;
	String writeSlack;
	int pmExtension;
	int writeExtension;
	
	String pmName;
	String writeName;
	
	//activity
	int aNo;
	String aName;
	String aDate;
	String aM;
	String aText;
	String aWriteD;
	String aWriteU;
	String aStatus;
	
	//Task
	int tNo;
	String tName;
	String tDate;
	String tStatus;
	String tM;
	String tText;
	String tWriteD;
	String tWriteU;
	String tMName;
	String tWriteName;
	String tMPhoto;
	String tWritePhoto;
	
	//view Project
	int ongoing;
	int standby;
	int complete;
	int defer;
	
	public int getOngoing() {
		return ongoing;
	}
	public void setOngoing(int ongoing) {
		this.ongoing = ongoing;
	}
	public int getStandby() {
		return standby;
	}
	public void setStandby(int standby) {
		this.standby = standby;
	}
	public int getComplete() {
		return complete;
	}
	public void setComplete(int complete) {
		this.complete = complete;
	}
	public int getDefer() {
		return defer;
	}
	public void setDefer(int defer) {
		this.defer = defer;
	}
	public String gettMName() {
		return tMName;
	}
	public void settMName(String tMName) {
		this.tMName = tMName;
	}
	public String gettWriteName() {
		return tWriteName;
	}
	public void settWriteName(String tWriteName) {
		this.tWriteName = tWriteName;
	}
	public String gettMPhoto() {
		return tMPhoto;
	}
	public void settMPhoto(String tMPhoto) {
		this.tMPhoto = tMPhoto;
	}
	public String gettWritePhoto() {
		return tWritePhoto;
	}
	public void settWritePhoto(String tWritePhoto) {
		this.tWritePhoto = tWritePhoto;
	}
	public int gettNo() {
		return tNo;
	}
	public void settNo(int tNo) {
		this.tNo = tNo;
	}
	public String gettName() {
		return tName;
	}
	public void settName(String tName) {
		this.tName = tName;
	}
	public String gettDate() {
		return tDate;
	}
	public void settDate(String tDate) {
		this.tDate = tDate;
	}
	public String gettStatus() {
		return tStatus;
	}
	public void settStatus(String tStatus) {
		this.tStatus = tStatus;
	}
	public String gettM() {
		return tM;
	}
	public void settM(String tM) {
		this.tM = tM;
	}
	public String gettText() {
		return tText;
	}
	public void settText(String tText) {
		this.tText = tText;
	}
	public String gettWriteD() {
		return tWriteD;
	}
	public void settWriteD(String tWriteD) {
		this.tWriteD = tWriteD;
	}
	public String gettWriteU() {
		return tWriteU;
	}
	public void settWriteU(String tWriteU) {
		this.tWriteU = tWriteU;
	}
	public String getaStatus() {
		return aStatus;
	}
	public void setaStatus(String aStatus) {
		this.aStatus = aStatus;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public int getaNo() {
		return aNo;
	}
	public void setaNo(int aNo) {
		this.aNo = aNo;
	}
	public String getaName() {
		return aName;
	}
	public void setaName(String aName) {
		this.aName = aName;
	}
	public String getaDate() {
		return aDate;
	}
	public void setaDate(String aDate) {
		this.aDate = aDate;
	}
	public String getaM() {
		return aM;
	}
	public void setaM(String aM) {
		this.aM = aM;
	}
	public String getaText() {
		return aText;
	}
	public void setaText(String aText) {
		this.aText = aText;
	}
	public String getaWriteD() {
		return aWriteD;
	}
	public void setaWriteD(String aWriteD) {
		this.aWriteD = aWriteD;
	}
	public String getaWriteU() {
		return aWriteU;
	}
	public void setaWriteU(String aWriteU) {
		this.aWriteU = aWriteU;
	}
	public String getPmSlack() {
		return pmSlack;
	}
	public void setPmSlack(String pmSlack) {
		this.pmSlack = pmSlack;
	}
	public String getWriteSlack() {
		return writeSlack;
	}
	public void setWriteSlack(String writeSlack) {
		this.writeSlack = writeSlack;
	}
	public int getPmExtension() {
		return pmExtension;
	}
	public void setPmExtension(int pmExtension) {
		this.pmExtension = pmExtension;
	}
	public int getWriteExtension() {
		return writeExtension;
	}
	public void setWriteExtension(int writeExtension) {
		this.writeExtension = writeExtension;
	}
	public String getPmName() {
		return pmName;
	}
	public void setPmName(String pmName) {
		this.pmName = pmName;
	}
	public String getWriteName() {
		return writeName;
	}
	public void setWriteName(String writeName) {
		this.writeName = writeName;
	}
	public String getProjectDate() {
		return projectDate;
	}
	public void setProjectDate(String projectDate) {
		this.projectDate = projectDate;
	}
	public String getWritePhoto() {
		return writePhoto;
	}
	public void setWritePhoto(String writePhoto) {
		this.writePhoto = writePhoto;
	}
	public String getPmPhoto() {
		return pmPhoto;
	}
	public void setPmPhoto(String pmPhoto) {
		this.pmPhoto = pmPhoto;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
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
	public String getpName() {
		return pName;
	}
	public void setpName(String pName) {
		this.pName = pName;
	}
	public int getbNo() {
		return bNo;
	}
	public void setbNo(int bNo) {
		this.bNo = bNo;
	}
	public String getWriteUser() {
		return writeUser;
	}
	public void setWriteUser(String writeUser) {
		this.writeUser = writeUser;
	}
	public String getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(String writeDate) {
		this.writeDate = writeDate;
	}
	public int getpNo() {
		return pNo;
	}
	public void setpNo(int pNo) {
		this.pNo = pNo;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public int getBudget() {
		return budget;
	}
	public void setBudget(int budget) {
		this.budget = budget;
	}
	public String getPm() {
		return pm;
	}
	public void setPm(String pm) {
		this.pm = pm;
	}
	
}
