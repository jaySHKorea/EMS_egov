package forwiz.ems.web.dto;

// login 정보 확인 dto 

public class LoginDto {

	private String id;
	private String passwd;
	
	public void setId(String id) {
		this.id = id;
	}

	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}

	public String getId() {
		return id;
	}

	public String getPasswd() {
		return passwd;
	}
}
