package egovframework.board.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.board.service.BoardDAO;
import egovframework.board.service.BoardDefaultVO;
import egovframework.board.service.BoardService;
import egovframework.board.service.BoardVO;
import egovframework.board.service.ReplyVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("boardService")
public class BoardServiceImpl extends EgovAbstractServiceImpl implements BoardService {
	
	@Resource(name="daoMyBatis")
	private BoardDAO boardDAO;
	
	public BoardServiceImpl() {
		System.out.println("===> BoardServiceImpl 생성");
	}
	
	public void insertBoard(BoardVO vo) throws Exception{
		boardDAO.insertBoard(vo);
	}
	
	public void updateBoard(BoardVO vo) throws Exception{
		boardDAO.updateBoard(vo);
	}
	
	public void deleteBoard(BoardVO vo) throws Exception{
		boardDAO.deleteBoard(vo);
	}
	
	public BoardVO selectBoard(BoardVO vo) throws Exception{
		return boardDAO.selectBoard(vo);
	}
	
	public List<BoardVO> selectBoardList(BoardDefaultVO searchVO) throws Exception{
		return boardDAO.selectBoardList(searchVO);
	}
	
	public void viewCount(int board_id) throws Exception {
		boardDAO.viewCount(board_id);
	}

	public int selectBoardTotal(BoardDefaultVO searchVO) throws Exception {
		return boardDAO.selectBoardTotal(searchVO);
	}

	public void updateUser(String user_id) throws Exception { 
		boardDAO.updateUser(user_id);
	}
	
}
