package fbm.cmm.dao;

import org.springframework.stereotype.Repository;

import fbm.cmm.model.TeamVO;
import fbm.common.dao.AbstractDAO;

@Repository("tmDao")
public class TeamDao extends AbstractDAO{

	public int registTeam(TeamVO tmVO) {
		// TODO Auto-generated method stub
		return (Integer) insert("registTeam", tmVO);
	}

}
