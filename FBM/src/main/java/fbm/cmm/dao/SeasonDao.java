package fbm.cmm.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

import fbm.cmm.model.SeasonVO;
import fbm.common.dao.AbstractDAO;


@Repository ("ssDao")
public class SeasonDao extends AbstractDAO{

	public int registSeason(SeasonVO ssVO) {
		// TODO Auto-generated method stub
		return (Integer) insert("registSeason", ssVO);
	}

	public SeasonVO getSeasonInfo(Map<String, String> paramSet) {
		// TODO Auto-generated method stub
		return (SeasonVO) selectOne("getSeasonInfo", paramSet);
	}

}
