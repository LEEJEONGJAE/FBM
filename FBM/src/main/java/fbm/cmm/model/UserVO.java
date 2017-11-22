package fbm.cmm.model;

import java.io.Serializable;

import org.apache.ibatis.type.Alias;

@Alias("usrVO")
public class UserVO implements Serializable{
	
	private int seq;
	private String id;
	private String pw;
	private String name;
	private String nick_name;
	private String team_id;
	private String captain;
	private int back_no;
	private String major_leg;
	private int height;
	private int weight;
	
	
	
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
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
	public String getNick_name() {
		return nick_name;
	}
	public void setNick_name(String nick_name) {
		this.nick_name = nick_name;
	}
	public String getTeam_id() {
		return team_id;
	}
	public void setTeam_id(String team_id) {
		this.team_id = team_id;
	}
	public String getCaptain() {
		return captain;
	}
	public void setCaptain(String captain) {
		this.captain = captain;
	}
	public int getBack_no() {
		return back_no;
	}
	public void setBack_no(int back_no) {
		this.back_no = back_no;
	}
	public String getMajor_leg() {
		return major_leg;
	}
	public void setMajor_leg(String major_leg) {
		this.major_leg = major_leg;
	}
	public int getHeight() {
		return height;
	}
	public void setHeight(int height) {
		this.height = height;
	}
	public int getWeight() {
		return weight;
	}
	public void setWeight(int weight) {
		this.weight = weight;
	}

	
}
