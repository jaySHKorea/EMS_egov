package forwiz.ems.web.dto;

// 직원 등록시 사용되는 Request Dto

import forwiz.ems.domain.Emp;

public class EmpSaveDto {
	private String passwd;
	private String rank;
	private String name;
	private String ssm;
	private String joinDate;
	private String deptNum;
	private String phoneNum;
	private String gender;
	private String addr;
	private String addrDetail;
	private String homeNum;
	private String hobby;
	private String grade;
	
	public EmpSaveDto() {
		
	}
	
	//dto -> entity
	public Emp toEntity() {
		return new Emp(this);
	}

	public String getRank() {
		return rank;
	}

	public String getName() {
		return name;
	}

	public String getSsm() {
		return ssm;
	}

	public String getJoinDate() {
		return joinDate;
	}

	public String getDeptNum() {
		return deptNum;
	}

	public String getPhoneNum() {
		return phoneNum;
	}

	public String getGender() {
		return gender;
	}

	public String getAddr() {
		return addr;
	}

	public String getAddrDetail() {
		return addrDetail;
	}

	public String getHomeNum() {
		return homeNum;
	}

	public String getHobby() {
		return hobby;
	}

	public String getGrade() {
		return grade;
	}

	public void setRank(String rank) {
		this.rank = rank;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setSsm(String ssm) {
		this.ssm = ssm;
	}

	public void setJoinDate(String joinDate) {
		this.joinDate = joinDate;
	}

	public void setDeptNum(String deptNum) {
		this.deptNum = deptNum;
	}

	public void setPhoneNum(String phoneNum) {
		this.phoneNum = phoneNum;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public void setAddrDetail(String addrDetail) {
		this.addrDetail = addrDetail;
	}

	public void setHomeNum(String homeNum) {
		this.homeNum = homeNum;
	}

	public void setHobby(String hobby) {
		this.hobby = hobby;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public String getPasswd() {
		return passwd;
	}

	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	
}
