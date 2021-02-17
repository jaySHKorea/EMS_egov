package forwiz.ems.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

import forwiz.ems.web.dto.EmpSaveDto;
import forwiz.ems.web.dto.EmpUpdateDto;

@Entity
@Table(name = "FORWIZ_EMP")
@SequenceGenerator(name="EMP_PK_SEQ_GENERATOR",
			sequenceName="EMP_PK_SEQ",
			initialValue=2021001,
			allocationSize=1)
public class Emp {

	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE,
					generator="EMP_PK_SEQ_GENERATOR")
	@GenericGenerator(name="EMP_PK_SEQ_GENERATOR", strategy="uuid")
	@Column(name="empNum",length=32)
	protected String empNum;
	
	@Column(name="deptNum",length=6, nullable=false)
	protected String deptNum;
	
	@Column(name="passwd",length=12, nullable=false)
	protected String passwd;
	
	@Column(name="rank", length=12, nullable=false)
	protected String rank;
	
	@Column(name="name", length=18, nullable=false)
	protected String name;
	
	@Column(name="ssm", length=13, nullable=false)
	protected String ssm;
	
	@Column(name="joinDate", length=10, nullable=false)
	protected String joinDate;
	
	@Column(name="homeNum", length=12, nullable=true)
	protected String homeNum;
	
	@Column(name="phoneNum", length=11, nullable=false)
	protected String phoneNum;
	
	@Column(name="addr", length=60, nullable=false)
	protected String addr;
	
	@Column(name="addrDetail", length=60, nullable=true)
	protected String addrDetail;
	
	@Column(name="gender", length=1, nullable=false)
	protected String gender;
	
	@Column(name="hobby", length=18, nullable=true)
	protected String hobby;
	
	@Column(name="grade", length=4, nullable=true)
	protected String grade;
	
	public Emp() {
		
	}

	public String getEmpNum() {
		return empNum;
	}

	public String getDeptNum() {
		return deptNum;
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

	public String getHomeNum() {
		return homeNum;
	}

	public String getPhoneNum() {
		return phoneNum;
	}

	public String getAddr() {
		return addr;
	}

	public String getAddrDetail() {
		return addrDetail;
	}

	public String getGender() {
		return gender;
	}

	public String getHobby() {
		return hobby;
	}

	public String getGrade() {
		return grade;
	}
	
	public Emp(EmpSaveDto saveDto) {
		this.passwd = saveDto.getPasswd();
		this.deptNum = saveDto.getDeptNum();
		this.rank = saveDto.getRank();
		this.name = saveDto.getName();
		this.ssm = saveDto.getSsm();
		this.joinDate = saveDto.getJoinDate();
		this.homeNum = saveDto.getHomeNum();
		this.phoneNum = saveDto.getPhoneNum();
		this.addr = saveDto.getAddr();
		this.addrDetail = saveDto.getAddrDetail();
		this.gender = saveDto.getGender();
		this.hobby = saveDto.getHobby();
		this.grade = saveDto.getGrade();
	}

	
	public Emp update(EmpUpdateDto updateDto) {
		this.deptNum = updateDto.getDeptNum();
		this.passwd = updateDto.getPasswd();
		this.rank = updateDto.getRank();
		this.name = updateDto.getName();
		this.ssm = updateDto.getSsm();
		this.joinDate = updateDto.getJoinDate();
		this.homeNum = updateDto.getHomeNum();
		this.phoneNum = updateDto.getPhoneNum();
		this.addr = updateDto.getAddr();
		this.addrDetail = updateDto.getAddrDetail();
		this.gender = updateDto.getGender();
		this.hobby = updateDto.getHobby();
		this.grade = updateDto.getGrade();
		return this;
	}
}
