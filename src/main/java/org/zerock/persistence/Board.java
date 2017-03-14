package org.zerock.persistence;

import org.springframework.web.multipart.MultipartFile;

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
	String aNo;
	String aName;
	String aDate;
	String aM;
	String aText;
	String aWriteD;
	String aWriteU;
	String aStatus;
	String aMName;
	
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
	
	//view Project
	int ongoing1;
	int standby1;
	int complete1;
	int defer1;
	
	int count;
	int joinUser;
	
	int wNo, wClient;
	String wDate, wText, wTimeH, wTimeM, wWriteDate, wUser, wFileName, day, time;
	MultipartFile wfile;
	
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}
	public int getwNo() {
		return wNo;
	}
	public void setwNo(int wNo) {
		this.wNo = wNo;
	}
	public int getwClient() {
		return wClient;
	}
	public void setwClient(int wClient) {
		this.wClient = wClient;
	}
	public String getwDate() {
		return wDate;
	}
	public void setwDate(String wDate) {
		this.wDate = wDate;
	}
	public String getwText() {
		return wText;
	}
	public void setwText(String wText) {
		this.wText = wText;
	}
	public String getwTimeH() {
		return wTimeH;
	}
	public void setwTimeH(String wTimeH) {
		this.wTimeH = wTimeH;
	}
	public String getwTimeM() {
		return wTimeM;
	}
	public void setwTimeM(String wTimeM) {
		this.wTimeM = wTimeM;
	}
	public String getwWriteDate() {
		return wWriteDate;
	}
	public void setwWriteDate(String wWriteDate) {
		this.wWriteDate = wWriteDate;
	}
	public String getwUser() {
		return wUser;
	}
	public void setwUser(String wUser) {
		this.wUser = wUser;
	}
	public String getwFileName() {
		return wFileName;
	}
	public void setwFileName(String wFileName) {
		this.wFileName = wFileName;
	}
	public MultipartFile getWfile() {
		return wfile;
	}
	public void setWfile(MultipartFile wfile) {
		this.wfile = wfile;
	}
	public int getJoinUser() {
		return joinUser;
	}
	public void setJoinUser(int joinUser) {
		this.joinUser = joinUser;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getOngoing1() {
		return ongoing1;
	}
	public void setOngoing1(int ongoing1) {
		this.ongoing1 = ongoing1;
	}
	public int getStandby1() {
		return standby1;
	}
	public void setStandby1(int standby1) {
		this.standby1 = standby1;
	}
	public int getComplete1() {
		return complete1;
	}
	public void setComplete1(int complete1) {
		this.complete1 = complete1;
	}
	public int getDefer1() {
		return defer1;
	}
	public void setDefer1(int defer1) {
		this.defer1 = defer1;
	}
	public String getaMName() {
		return aMName;
	}
	public void setaMName(String aMName) {
		this.aMName = aMName;
	}
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
	public String getaNo() {
		return aNo;
	}
	public void setaNo(String aNo) {
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
