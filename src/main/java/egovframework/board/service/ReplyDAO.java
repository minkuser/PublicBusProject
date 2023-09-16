package egovframework.board.service;

import java.util.List;

public interface ReplyDAO {
	// 댓글 조회
	public List<ReplyVO> list(int board_id) throws Exception;

	// 댓글 작성
	public void write(ReplyVO vo) throws Exception;

	// 댓글 수정
	public void modify(ReplyVO vo) throws Exception;

	// 댓글 삭제
	public void delete(ReplyVO vo) throws Exception;
	
	// 단일 댓글 조회
	public ReplyVO select(ReplyVO vo) throws Exception;
	
	public void updateUser(String user_id) throws Exception;

}
