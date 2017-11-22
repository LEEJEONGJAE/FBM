package fbm.cmm.dao;

import fbm.cmm.model.UserVO;

public interface UserService {
	
	public int login(UserVO usrVO) throws Exception;

	public int registUser(UserVO usrVO) throws Exception;

}
