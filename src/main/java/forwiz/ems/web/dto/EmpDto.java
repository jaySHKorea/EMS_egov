package forwiz.ems.web.dto;

// 직원 정보에 대한 Response Dto

import forwiz.ems.domain.Emp;

public class EmpDto {
	
	private String empNum;
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
	
	// entity -> Dto
	public EmpDto(Emp entity) {
		this.empNum = entity.getEmpNum();
		this.passwd = entity.getPasswd();
		this.rank = entity.getRank();
		this.name = entity.getName();
		this.ssm = entity.getSsm();
		this.joinDate = entity.getJoinDate();
		this.deptNum = entity.getDeptNum();
		this.phoneNum = entity.getPhoneNum();
		this.gender = entity.getGender();
		this.addr = entity.getAddr();
		this.addrDetail = entity.getAddrDetail();
		this.homeNum = entity.getHomeNum();
		this.hobby = entity.getHobby();
		this.grade = entity.getGrade();
	}

	public String getEmpNum() {
		return empNum;
	}

	public String getPasswd() {
		return passwd;
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
}
