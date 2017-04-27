package org.zerock.persistence;

public class Project {
	int pNo;
	String pName;
	String projectDate;
	String adminUser;
	String status;
	int total;
	int ongoing1;
	int defer1;
	int standby1;
	int complete1;
	int bNo;
	int no;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getbNo() {
		return bNo;
	}
	public void setbNo(int bNo) {
		this.bNo = bNo;
	}
	public int getOngoing1() {
		return ongoing1;
	}
	public void setOngoing1(int ongoing1) {
		this.ongoing1 = ongoing1;
	}
	public int getDefer1() {
		return defer1;
	}
	public void setDefer1(int defer1) {
		this.defer1 = defer1;
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
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getAdminUser() {
		return adminUser;
	}
	public void setAdminUser(String adminUser) {
		this.adminUser = adminUser;
	}
	public int getpNo() {
		return pNo;
	}
	public void setpNo(int pNo) {
		this.pNo = pNo;
	}
	public String getpName() {
		return pName;
	}
	public void setpName(String pName) {
		this.pName = pName;
	}
	public String getProjectDate() {
		return projectDate;
	}
	public void setProjectDate(String projectDate) {
		this.projectDate = projectDate;
	}
}
