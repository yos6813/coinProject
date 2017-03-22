package org.zerock.persistence;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class Client {
	int ctNo;
	String ctName;
	String ctAddr;
	String ctAddr2;
	String ctLicense;
	
	int fNo;
	String fName, fDate;
	List<MultipartFile> fFile;
	
	int wNo;
	int tNo;
	String wDate;
	String wText;
	int wTimeH;
	int wTimeM;
	int wClient;
	String wFileName;
	String wWriteDate;
	String wUser;
	
	String username;
	String photoURL;
	
	String fText;
	String fTitle;
	
	String type;
	String keyword;
	
	
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
	public String getfText() {
		return fText;
	}
	public void setfText(String fText) {
		this.fText = fText;
	}
	public String getfTitle() {
		return fTitle;
	}
	public void setfTitle(String fTitle) {
		this.fTitle = fTitle;
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
	public int getwNo() {
		return wNo;
	}
	public void setwNo(int wNo) {
		this.wNo = wNo;
	}
	public int gettNo() {
		return tNo;
	}
	public void settNo(int tNo) {
		this.tNo = tNo;
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
	public int getwTimeH() {
		return wTimeH;
	}
	public void setwTimeH(int wTimeH) {
		this.wTimeH = wTimeH;
	}
	public int getwTimeM() {
		return wTimeM;
	}
	public void setwTimeM(int wTimeM) {
		this.wTimeM = wTimeM;
	}
	public int getwClient() {
		return wClient;
	}
	public void setwClient(int wClient) {
		this.wClient = wClient;
	}
	public String getwFileName() {
		return wFileName;
	}
	public void setwFileName(String wFileName) {
		this.wFileName = wFileName;
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
	public List<MultipartFile> getfFile() {
		return fFile;
	}
	public void setfFile(List<MultipartFile> fFile) {
		this.fFile = fFile;
	}
	public int getfNo() {
		return fNo;
	}
	public void setfNo(int fNo) {
		this.fNo = fNo;
	}
	public String getfName() {
		return fName;
	}
	public void setfName(String fName) {
		this.fName = fName;
	}
	public String getfDate() {
		return fDate;
	}
	public void setfDate(String fDate) {
		this.fDate = fDate;
	}
	public String getCtAddr2() {
		return ctAddr2;
	}
	public void setCtAddr2(String ctAddr2) {
		this.ctAddr2 = ctAddr2;
	}
	public int getCtNo() {
		return ctNo;
	}
	public void setCtNo(int ctNo) {
		this.ctNo = ctNo;
	}
	public String getCtName() {
		return ctName;
	}
	public void setCtName(String ctName) {
		this.ctName = ctName;
	}
	public String getCtAddr() {
		return ctAddr;
	}
	public void setCtAddr(String ctAddr) {
		this.ctAddr = ctAddr;
	}
	public String getCtLicense() {
		return ctLicense;
	}
	public void setCtLicense(String ctLicense) {
		this.ctLicense = ctLicense;
	}
}
