package egovframework.board.service.impl;

import java.util.List;

import egovframework.board.service.ReplyVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("replyMapper")
public interface ReplyMapper {
	public List<ReplyVO> list(int bno) throws Exception;

	public void write(ReplyVO vo) throws Exception;

	public void modify(ReplyVO vo) throws Exception;

	public void delete(ReplyVO vo) throws Exception;
	
	public ReplyVO select(ReplyVO vo) throws Exception;
	
	public void updateUser(String user_id) throws Exception;
}
