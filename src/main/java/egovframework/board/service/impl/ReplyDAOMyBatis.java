package egovframework.board.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import egovframework.board.service.ReplyDAO;
import egovframework.board.service.ReplyVO;

@Repository("replyDAOMyBatis")
public class ReplyDAOMyBatis implements ReplyDAO{
	@Resource(name="replyMapper")
	private ReplyMapper mybatis;
	
	public ReplyDAOMyBatis() {
		System.out.println("===> ReplyDAOMyBatis 생성");
	}
	
	public List<ReplyVO> list(int bno) throws Exception{
		return mybatis.list(bno);

	}

	public void write(ReplyVO vo) throws Exception{
		mybatis.write(vo);
	}

	public void modify(ReplyVO vo) throws Exception{
		mybatis.modify(vo);
	}

	public void delete(ReplyVO vo) throws Exception{
		mybatis.delete(vo);
	}
	
	public ReplyVO select(ReplyVO vo) throws Exception {		
		return mybatis.select(vo);
	}

	public void updateUser(String user_id) throws Exception {
		mybatis.updateUser(user_id);
		
	}
}
