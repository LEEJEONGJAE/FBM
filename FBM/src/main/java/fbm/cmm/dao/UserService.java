package fbm.cmm.dao;

import fbm.cmm.dto.UserDto;

public interface UserService {
	
	public int login(UserDto usrDto) throws Exception;

}
