package egovframework.board.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import egovframework.board.service.BoardDefaultVO;
import egovframework.board.service.BoardService;
import egovframework.board.service.BoardVO;
import egovframework.board.service.ReplyService;
import egovframework.board.service.ReplyVO;
import egovframework.board.service.UserVO;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
@SessionAttributes("board")
public class BoardController {
	@Resource(name="boardService")
	private BoardService boardService;
	
	@Resource(name="replyService")
	private ReplyService replyService;
	
	@RequestMapping(value="sample/insertBoard.do",method=RequestMethod.GET)
	public String insertBoardView(HttpSession session, Model model) throws Exception{
		Object loginInfo = session.getAttribute("user");
		
		if(loginInfo ==  null) {
			model.addAttribute("msg", false);
		}
		return "sample/insertBoard"; 
	}
	
	@RequestMapping(value="sample/insertBoard.do",method=RequestMethod.POST)
	public String insertBoard(BoardVO vo) throws Exception {
		
		System.out.println("등록 처리");
		boardService.insertBoard(vo);
		return "redirect:selectBoardList.do";
	}
	
	@RequestMapping("sample/updateBoard.do")
	public String updateBoard(@ModelAttribute("board") BoardVO vo, HttpSession session, HttpServletRequest req) throws Exception {
		UserVO user = (UserVO) session.getAttribute("user");
		
		if(user.getUser_id().equals(vo.getUser_id())) {
				boardService.updateBoard(vo);
				return "forward:selectBoardList.do";
		}else {
			req.setAttribute("msg", "게시글의 작성자가 아닙니다.");
			req.setAttribute("url", "selectBoardList.do");
			return "sample/alert5";
		}
		
		

	}
	
	@RequestMapping("sample/deleteBoard.do")
	public String deleteBoard(BoardVO vo, HttpSession session, HttpServletRequest req) throws Exception {
		System.out.println("삭제 ");
		UserVO user = (UserVO) session.getAttribute("user");
		
	 	BoardVO bv = boardService.selectBoard(vo);
		System.out.println(bv.getUser_id()+"유저 id 확인");
		
		if(user.getUser_id().equals(bv.getUser_id())) {
			List<ReplyVO> replyList = replyService.list(bv.getBoard_id());
			
			for(ReplyVO reply : replyList) {
				replyService.delete(reply);
			}
			boardService.deleteBoard(vo);
			return "forward:selectBoardList.do";
		}else {
			req.setAttribute("msg", "게시글의 작성자가 아닙니다.");
			req.setAttribute("url", "selectBoardList.do");
			return "sample/alert5";
		}
	}
	
	@RequestMapping("sample/selectBoard.do")
	public String selectBoard(BoardVO vo, Model model, HttpSession session) throws Exception {
		
		if (session.getAttribute("user") != null) {
			boardService.viewCount(vo.getBoard_id());
			model.addAttribute("board", boardService.selectBoard(vo));
			// 댓글 조회
			model.addAttribute("reply", replyService.list(vo.getBoard_id()));
			return "sample/selectBoard";
		} else {
			return "sample/selectBoard2";
		}
		
	}
	
	@ModelAttribute("conditionMap")
	public Map<String, String> searchConditionMap(){
		Map<String, String> conditionMap = new HashMap<String, String>();
		conditionMap.put("작성자", "REGUSER");
		conditionMap.put("내용", "CONTENT");
		conditionMap.put("제목", "TITLE");	
		return conditionMap;
	}
	
	@RequestMapping(value="sample/selectBoardList.do")
	public String selectBoardList(@RequestParam(value="searchKeyword", required=false) String searchKeyword, @RequestParam(value="searchCondition", required=false) String searchCondition, @ModelAttribute("searchVO") BoardDefaultVO searchVO, ModelMap model) throws Exception {
		if(searchVO.getSearchCondition() == null) searchVO.setSearchCondition("TITLE");
		if(searchVO.getSearchKeyword() == null) searchVO.setSearchKeyword("");

		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
		paginationInfo.setPageSize(searchVO.getPageSize());
		
		searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
		System.out.println(paginationInfo.getRecordCountPerPage());
		System.out.println(paginationInfo.getPageSize());
		
		int total = boardService.selectBoardTotal(searchVO);
		paginationInfo.setTotalRecordCount(total);
		
		model.addAttribute("searchCondition", searchVO.getSearchCondition());
		model.addAttribute("searchKeyword", searchVO.getSearchKeyword());
		model.addAttribute("total", total);
		model.addAttribute("paginationInfo", paginationInfo);
		model.addAttribute("boardList", boardService.selectBoardList(searchVO));
		return "sample/selectBoardList";
	}
}
