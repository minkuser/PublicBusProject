package egovframework.board.service;

public interface UserService {
	public void register(UserVO vo) throws Exception;
	
	public UserVO login(UserVO vo) throws Exception;
	
	public void modifyUser(UserVO vo) throws Exception;
	
	public void withdrawal(UserVO vo) throws Exception;
	
	public UserVO idCheck(String user_id) throws Exception;
}
