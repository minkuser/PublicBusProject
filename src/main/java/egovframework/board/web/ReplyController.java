package egovframework.board.web;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import egovframework.board.service.ReplyService;
import egovframework.board.service.ReplyVO;
import egovframework.board.service.UserVO;

@Controller
public class ReplyController {
	@Resource(name="replyService")
	private ReplyService replyService;
	
	// 댓글 작성
	@RequestMapping(value = "sample/write.do", method = RequestMethod.POST)
	public String write(ReplyVO rvo) throws Exception {		
		replyService.write(rvo);
		
		return "redirect:selectBoard.do?board_id=" + rvo.getBoard_id();
	}
	
	@RequestMapping(value = "sample/modifyReply.do", method = RequestMethod.GET)
	public String getModify(@RequestParam("board_id") int board_id, @RequestParam("reply_id") int reply_id, Model model, HttpServletRequest req, HttpSession session) throws Exception {		
		UserVO user = (UserVO)session.getAttribute("user");		
		ReplyVO rvo = new ReplyVO();
		rvo.setBoard_id(board_id);
		rvo.setReply_id(reply_id);
		
		ReplyVO reply = replyService.select(rvo);
		
		if(user.getUser_id().contentEquals(reply.getUser_id())) {
			model.addAttribute("reply", reply);
			return "sample/modifyReply";
		}else {
			req.setAttribute("msg", "댓글의 작성자가 아닙니다.");
			req.setAttribute("url", "selectBoard.do?board_id=" + rvo.getBoard_id());
			return "sample/alert5";
		}
	}
	
	@RequestMapping(value = "sample/modifyReply.do", method = RequestMethod.POST)
	public String postModify(ReplyVO rvo) throws Exception {
		replyService.modify(rvo);
		return "redirect:selectBoard.do?board_id=" + rvo.getBoard_id();
	}
	
	@RequestMapping(value="sample/delete.do")
	public String delete(ReplyVO rvo, HttpServletRequest req, HttpSession session) throws Exception{
		UserVO user = (UserVO)session.getAttribute("user");		
		ReplyVO reply = replyService.select(rvo);
		
		if(user.getUser_id().contentEquals(reply.getUser_id())) {
			replyService.delete(rvo);
			req.setAttribute("msg", "댓글을 삭제합니다.");
			req.setAttribute("url", "selectBoard.do?board_id=" + rvo.getBoard_id());
		}else {
			req.setAttribute("msg", "댓글의 작성자가 아닙니다.");
			req.setAttribute("url", "selectBoard.do?board_id=" + rvo.getBoard_id());
		}
		
		return "sample/alert5";

		
	}
}
