package fbm.cmm.dao;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fbm.cmm.model.SeasonVO;

@Service("ssService")
public class SeasonSerinveImpl implements SeasonService {
	
	@Autowired
	private SeasonDao ssDao;

	@Override
	public int registSeason(SeasonVO ssVO) throws Exception {
		// TODO Auto-generated method stub
		return ssDao.registSeason(ssVO);
	}

	@Override
	public SeasonVO getSeasoninfo(Map<String, String> paramSet) throws Exception {
		// TODO Auto-generated method stub
		return ssDao.getSeasonInfo(paramSet);
	}

}
