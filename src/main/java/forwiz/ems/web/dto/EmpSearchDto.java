package forwiz.ems.web.dto;

//직원 검색시 사용되는 Response Dto

public class EmpSearchDto {
	
	private String name;
	private String empNum;
	private String deptNum;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmpNum() {
		return empNum;
	}
	public void setEmpNum(String empNum) {
		this.empNum = empNum;
	}
	public String getDeptNum() {
		return deptNum;
	}
	public void setDeptNum(String deptNum) {
		this.deptNum = deptNum;
	}
	
	

}
