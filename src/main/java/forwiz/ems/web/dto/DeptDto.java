package forwiz.ems.web.dto;

// 부서 정보에 대한 Response Dto

import forwiz.ems.domain.Dept;

public class DeptDto {
	private String deptNum;
	private String deptName;
	
	// entity -> dto
	public DeptDto(Dept entity) {
		this.deptNum = entity.getDeptNum();
		this.deptName = entity.getDeptName();
	}

	public String getDeptNum() {
		return deptNum;
	}

	public String getDeptName() {
		return deptName;
	}
}
