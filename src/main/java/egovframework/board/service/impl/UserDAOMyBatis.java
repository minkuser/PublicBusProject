package egovframework.board.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import egovframework.board.service.UserDAO;
import egovframework.board.service.UserVO;

@Repository("userDAOMyBatis")
public class UserDAOMyBatis implements UserDAO{
	@Resource(name="userMapper")
	private UserMapper mybatis;
	
	public UserDAOMyBatis() {
		System.out.println("===> MemberDAOMyBatis 생성");
	}
	
	public void register(UserVO vo) throws Exception {
		mybatis.register(vo);		
	}
	
	public UserVO login(UserVO vo) throws Exception{
		return mybatis.loginBcrypt(vo);
	}
	
	public void modifyUser(UserVO vo) throws Exception{
		mybatis.modifyUser(vo);
	}
	
	public void withdrawal(UserVO vo) throws Exception{
		mybatis.withdrawal(vo);
	}
	
	public UserVO idCheck(String user_id) throws Exception{
		return mybatis.idCheck(user_id);
	}

}
