package fbm.cmm.model;

import java.io.Serializable;

import org.apache.ibatis.type.Alias;

@Alias("seasonVO")
public class SeasonVO implements Serializable{
	
	private int season_id;
	private String season_nm;
	private int tot_games;
	private String manager_id;
	
	
	public int getSeason_id() {
		return season_id;
	}
	public void setSeason_id(int season_id) {
		this.season_id = season_id;
	}
	public String getSeason_nm() {
		return season_nm;
	}
	public void setSeason_nm(String season_nm) {
		this.season_nm = season_nm;
	}
	public int getTot_games() {
		return tot_games;
	}
	public void setTot_games(int tot_games) {
		this.tot_games = tot_games;
	}
	public String getManager_id() {
		return manager_id;
	}
	public void setManager_id(String manager_id) {
		this.manager_id = manager_id;
	}
	
	
	
}
