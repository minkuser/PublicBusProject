package egovframework.board.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.board.service.UserDAO;
import egovframework.board.service.UserService;
import egovframework.board.service.UserVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("userService")
public class UserServiceImpl extends EgovAbstractServiceImpl implements UserService{
	
	@Resource(name="userDAOMyBatis")
	private UserDAO userDAO;

	@Override
	public void register(UserVO vo) throws Exception {
		userDAO.register(vo);		
	}
	
	@Override
	public UserVO login(UserVO vo) throws Exception{
		return userDAO.login(vo);
	}

	@Override
	public void modifyUser(UserVO vo) throws Exception {
		userDAO.modifyUser(vo);		
	}
	
	@Override
	public void withdrawal(UserVO vo) throws Exception{
		userDAO.withdrawal(vo);
	}
	
	@Override
	public UserVO idCheck(String id) throws Exception{
		return userDAO.idCheck(id);
	}
		
}
