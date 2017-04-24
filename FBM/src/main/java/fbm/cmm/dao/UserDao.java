package fbm.cmm.dao;

import org.springframework.stereotype.Repository;

import fbm.cmm.dto.UserDto;
import fbm.common.dao.AbstractDAO;

@Repository ("usrDao")
public class UserDao extends AbstractDAO{

	public int login(UserDto usrDto) throws Exception{
		return (Integer) selectOne("login", usrDto);
	}

}
