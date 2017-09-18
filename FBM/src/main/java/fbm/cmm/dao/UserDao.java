package fbm.cmm.dao;

import org.springframework.stereotype.Repository;

import fbm.cmm.model.UserVO;
import fbm.common.dao.AbstractDAO;

@Repository ("usrDao")
public class UserDao extends AbstractDAO{

	public int login(UserVO usrVO) throws Exception{
		return (Integer) selectOne("login", usrVO);
	}

	public int registUser(UserVO usrVO) {
		// TODO Auto-generated method stub
		return (Integer) insert("registUser", usrVO);
	}

}
