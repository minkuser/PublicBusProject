package egovframework.board.service;

import java.util.List;

import egovframework.board.service.BoardDefaultVO;

public interface BoardDAO {
	void insertBoard(BoardVO vo) throws Exception;
	
	void updateBoard(BoardVO vo) throws Exception;
	
	void deleteBoard(BoardVO vo) throws Exception;
	
	BoardVO selectBoard(BoardVO vo) throws Exception;
	
	List<BoardVO> selectBoardList(BoardDefaultVO searchVO) throws Exception;
	
	void viewCount(int board_id) throws Exception;
	
	int selectBoardTotal(BoardDefaultVO searchVO) throws Exception;
	
	void updateUser(String user_id) throws Exception;
	
}	
