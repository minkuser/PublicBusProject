package egovframework.board.service.impl;

import egovframework.board.service.UserVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("userMapper")
public interface UserMapper {
	public void register(UserVO vo) throws Exception;
	
	public UserVO loginBcrypt(UserVO vo) throws Exception;
	
	public void modifyUser(UserVO vo) throws Exception;
	
	public void withdrawal(UserVO vo) throws Exception;
	
	public UserVO idCheck(String user_id) throws Exception;
}
