package egovframework.board.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.board.service.QBoardDAO;
import egovframework.board.service.QBoardDefaultVO;
import egovframework.board.service.QBoardService;
import egovframework.board.service.QBoardVO;

@Service("qBoardService")
public class QBoardServiceImpl implements QBoardService {

	@Resource(name = "qdaoMyBatis")
	private QBoardDAO qBoardDAO;

	
	@Override
	public void insertQBoard(QBoardVO vo) throws Exception {
		qBoardDAO.insertQBoard(vo);
	}

	@Override
	public void updateQBoard(QBoardVO vo) throws Exception {
		qBoardDAO.updateQBoard(vo);
	}

	@Override
	public void deleteQBoard(QBoardVO vo) throws Exception {
		qBoardDAO.deleteQBoard(vo);
	}

	@Override
	public QBoardVO selectQBoard(QBoardVO vo) throws Exception {
		return qBoardDAO.selectQBoard(vo);
	}

	@Override
	public void updateReadCount(QBoardVO vo) throws Exception {
		qBoardDAO.updateReadCount(vo);
	}

	
	@Override
	public void insertQReply(QBoardVO vo) throws Exception {
		qBoardDAO.insertQReply(vo);
	}

	@Override
	public Integer maxLayer(QBoardVO vo) throws Exception {
		return qBoardDAO.maxLayer(vo);
	}

	@Override
	public List<QBoardVO> selectQBoardList(QBoardDefaultVO searchVO) throws Exception {
		return qBoardDAO.selectQBoardList(searchVO);
	}

	@Override
	public int selectQBoardTotal(QBoardDefaultVO searchVO) throws Exception {
		return qBoardDAO.selectQBoardTotal(searchVO);
	}

	@Override
	public void deleteQReply(QBoardVO vo) throws Exception {
		qBoardDAO.deleteQReply(vo);
	}
	
	
}
