package forwiz.ems.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name = "FORWIZ_DEPT")
@SequenceGenerator(name="DEPT_PK_SEQ_GENERATOR",
			sequenceName="DEPT_PK_SEQ",
			initialValue=10,
			allocationSize=5)
public class Dept {
	
	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE,
					generator="DEPT_PK_SEQ_GENERATOR")
	@Column(name="deptNum",length=3)
	protected String deptNum;
	
	@Column(name="deptName",length=20, nullable=false)
	protected String deptName;
	
	@Column(name="deptCall",length=14, nullable=false)
	protected String deptCall;
	
	public Dept() {
		
	}

	public String getDeptNum() {
		return deptNum;
	}

	public String getDeptName() {
		return deptName;
	}

	public String getDeptCall() {
		return deptCall;
	}
}
