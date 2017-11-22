package fbm.cmm.dao;

import java.util.Map;

import fbm.cmm.model.SeasonVO;


public interface SeasonService {

	int registSeason(SeasonVO ssVO) throws Exception;

	SeasonVO getSeasoninfo(Map<String, String> paramSet) throws Exception;


}
