package egovframework.board.service;

public interface UserDAO {
	// 회원 가입
	public void register(UserVO vo) throws Exception;	
	// 로그인
	public UserVO login(UserVO vo) throws Exception;
	// 회원정보수정
	public void modifyUser(UserVO vo) throws Exception;
	// 회원 탈퇴
	public void withdrawal(UserVO vo) throws Exception;
	// 아이디 중복 체크
	public UserVO idCheck(String user_id) throws Exception;
}
