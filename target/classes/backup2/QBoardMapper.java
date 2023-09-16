package egovframework.board.service.impl;

import java.util.List;

import egovframework.board.service.QBoardDefaultVO;
import egovframework.board.service.QBoardVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("QBoardMapper")
public interface QBoardMapper {
	
	
	void insertQBoard(QBoardVO vo) throws Exception;

	void updateQBoard(QBoardVO vo) throws Exception;

	void deleteQBoard(QBoardVO vo) throws Exception;

	QBoardVO selectQBoard(QBoardVO vo) throws Exception;

	List<QBoardVO> selectQBoardList(QBoardDefaultVO searchVO) throws Exception;
	
	void updateReadCount(QBoardVO vo) throws Exception;
	
	void insertQReply(QBoardVO vo) throws Exception;
	
	Integer maxLayer(QBoardVO vo) throws Exception;
	
	int selectQBoardTotal(QBoardDefaultVO searchVO) throws Exception;
	
	void deleteQReply(QBoardVO vo) throws Exception;
	
}
