package egovframework.board.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.board.service.ReplyDAO;
import egovframework.board.service.ReplyService;
import egovframework.board.service.ReplyVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("replyService")
public class ReplyServiceImpl extends EgovAbstractServiceImpl implements ReplyService{
	
	@Resource(name="replyDAOMyBatis")
	private ReplyDAO replyDAO;
	
	public ReplyServiceImpl() {
		System.out.println("===> ReplyServiceImpl 생성");
	}
	
	@Override
	public List<ReplyVO> list(int bno) throws Exception {
		return replyDAO.list(bno);
	}

	@Override
	public void write(ReplyVO vo) throws Exception {
		replyDAO.write(vo);
		
	}

	@Override
	public void modify(ReplyVO vo) throws Exception {
		replyDAO.modify(vo);
		
	}

	@Override
	public void delete(ReplyVO vo) throws Exception {
		replyDAO.delete(vo);	
	}
	
	@Override
	public ReplyVO select(ReplyVO vo) throws Exception {
		return replyDAO.select(vo);
	}

	@Override
	public void updateUser(String user_id) throws Exception {
		replyDAO.updateUser(user_id);
		
	}


	
}
