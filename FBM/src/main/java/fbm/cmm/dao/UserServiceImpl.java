package fbm.cmm.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fbm.cmm.dto.UserDto;

@Service("userService")
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDao usrDao;
	
	@Override
	public int login(UserDto usrDto) throws Exception {
		// TODO Auto-generated method stub
		return usrDao.login(usrDto);
	}
	

}
