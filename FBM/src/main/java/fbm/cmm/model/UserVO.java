package fbm.cmm.model;

import java.io.Serializable;

import org.apache.ibatis.type.Alias;

@Alias("usrVO")
public class UserVO implements Serializable{
	
	private String id;
	
	private String pw;
	
	private String name;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
}
