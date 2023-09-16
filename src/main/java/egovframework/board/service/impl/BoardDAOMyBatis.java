package egovframework.board.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.hsqldb.lib.HashMap;
import org.springframework.stereotype.Repository;

import egovframework.board.service.BoardDAO;
import egovframework.board.service.BoardDefaultVO;
import egovframework.board.service.BoardVO;


@Repository("daoMyBatis")
public class BoardDAOMyBatis implements BoardDAO{
	@Resource(name="boardMapper")
	private BoardMapper mybatis;
	
	public BoardDAOMyBatis() {
		System.out.println("===> BoardDAOMyBatis 생성");
	}
	@Override
	public void insertBoard(BoardVO vo) throws Exception{
		System.out.println("===> MyBatis로 insertBoard() 기능 처리");
		mybatis.insertBoard(vo);
	}
	@Override
	public void updateBoard(BoardVO vo) throws Exception{
		System.out.println("===> MyBatis로 updateBoard() 기능 처리");
		mybatis.updateBoard(vo);
	}
	@Override
	public void deleteBoard(BoardVO vo) throws Exception{
		System.out.println("===> MyBatis로 deleteBoard() 기능 처리");
		mybatis.deleteBoard(vo);
	}
	@Override
	public BoardVO selectBoard(BoardVO vo) throws Exception{
		System.out.println("===> MyBatis로 selectBoard() 기능 처리");
		return (BoardVO) mybatis.selectBoard(vo);
	}
	@Override
	public List<BoardVO> selectBoardList(BoardDefaultVO searchVO) throws Exception{
		System.out.println("===> MyBatis로 selectBoardList() 처리");
		return mybatis.selectBoardList(searchVO);
	}
	@Override
	public void viewCount(int board_id) throws Exception {
		mybatis.viewCount(board_id);
		
	}
	@Override
	public int selectBoardTotal(BoardDefaultVO searchVO) throws Exception {
		return mybatis.selectBoardTotal(searchVO);
	}
	
	@Override
	public void updateUser(String user_id) throws Exception {
		mybatis.updateUser(user_id);
	}
	
}
