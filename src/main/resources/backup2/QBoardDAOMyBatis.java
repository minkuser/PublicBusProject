package egovframework.board.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import egovframework.board.service.QBoardDAO;
import egovframework.board.service.QBoardDefaultVO;
import egovframework.board.service.QBoardVO;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;

@Repository("qdaoMyBatis")
public class QBoardDAOMyBatis extends EgovAbstractMapper implements QBoardDAO{
	@Resource(name = "QBoardMapper")
	private QBoardMapper qBoard;
	
	
	@Override
	public void insertQBoard(QBoardVO vo) throws Exception {
		qBoard.insertQBoard(vo);
	}

	@Override
	public void updateQBoard(QBoardVO vo) throws Exception {
		qBoard.updateQBoard(vo);
	}

	@Override
	public void deleteQBoard(QBoardVO vo) throws Exception {
		qBoard.deleteQBoard(vo);
	}

	@Override
	public QBoardVO selectQBoard(QBoardVO vo) throws Exception {
		return qBoard.selectQBoard(vo);
	}
	
	@Override
	public void updateReadCount(QBoardVO vo) throws Exception {
		qBoard.updateReadCount(vo);
	}

	@Override
	public void insertQReply(QBoardVO vo) throws Exception {
		qBoard.insertQReply(vo);
	}

	@Override
	public Integer maxLayer(QBoardVO vo) throws Exception {
		return qBoard.maxLayer(vo);
	}

	@Override
	public List<QBoardVO> selectQBoardList(QBoardDefaultVO searchVO) throws Exception {
		return qBoard.selectQBoardList(searchVO);
	}

	@Override
	public int selectQBoardTotal(QBoardDefaultVO searchVO) throws Exception {
		return qBoard.selectQBoardTotal(searchVO);
	}

	@Override
	public void deleteQReply(QBoardVO vo) throws Exception {
		qBoard.deleteQReply(vo);
	}


	
}
