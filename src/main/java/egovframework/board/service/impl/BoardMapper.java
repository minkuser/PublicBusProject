package egovframework.board.service.impl;

import java.util.List;

import egovframework.board.service.BoardDefaultVO;
import egovframework.board.service.BoardVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("boardMapper")
public interface BoardMapper{
	void insertBoard(BoardVO vo) throws Exception;
	
	void updateBoard(BoardVO vo) throws Exception;
	
	void deleteBoard(BoardVO vo) throws Exception;
	
	BoardVO selectBoard(BoardVO vo) throws Exception;
	
	List<BoardVO> selectBoardList(BoardDefaultVO searchVO) throws Exception;
	
	void viewCount(int board_id) throws Exception;
	
	int selectBoardTotal(BoardDefaultVO defaultVO) throws Exception;
	
	void updateUser(String user_id) throws Exception;
	
}
