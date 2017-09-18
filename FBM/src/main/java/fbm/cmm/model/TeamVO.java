package fbm.cmm.model;

import java.io.Serializable;

import org.apache.ibatis.type.Alias;

@Alias("tmVO")
public class TeamVO implements Serializable{
	
	int team_id;
	String team_nm;
	int season_id;
	int wp;
	int win;
	int draw;
	int lose;
	
	
	public int getTeam_id() {
		return team_id;
	}
	public void setTeam_id(int team_id) {
		this.team_id = team_id;
	}
	public String getTeam_nm() {
		return team_nm;
	}
	public void setTeam_nm(String team_nm) {
		this.team_nm = team_nm;
	}
	public int getSeason_id() {
		return season_id;
	}
	public void setSeason_id(int season_id) {
		this.season_id = season_id;
	}
	public int getWp() {
		return wp;
	}
	public void setWp(int wp) {
		this.wp = wp;
	}
	public int getWin() {
		return win;
	}
	public void setWin(int win) {
		this.win = win;
	}
	public int getDraw() {
		return draw;
	}
	public void setDraw(int draw) {
		this.draw = draw;
	}
	public int getLose() {
		return lose;
	}
	public void setLose(int lose) {
		this.lose = lose;
	}
	
	
	
}
