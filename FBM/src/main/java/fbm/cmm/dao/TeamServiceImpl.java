package fbm.cmm.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fbm.cmm.model.TeamVO;

@Service("tmService")
public class TeamServiceImpl implements TeamService {

	@Autowired
	TeamDao tmDao = new TeamDao();
	
	@Override
	public int registTeam(TeamVO tmVO) throws Exception {
		// TODO Auto-generated method stub
		return tmDao.registTeam(tmVO);
	}

}
