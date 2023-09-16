package egovframework.board.web;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.board.service.BoardService;
import egovframework.board.service.QBoardService;
import egovframework.board.service.ReplyService;
import egovframework.board.service.UserService;
import egovframework.board.service.UserVO;
import egovframework.sample.service.SampleService;

@Controller
public class UserController {

	private static final Logger logger = LoggerFactory.getLogger(UserController.class);

	@Resource(name = "userService")
	private UserService userService;

	@Resource(name = "boardService")
	private BoardService boardService;

	@Resource(name = "qBoardService")
	private QBoardService qboardService;
	
	@Resource(name="replyService")
	private ReplyService replyService;
	
	@Resource(name="sampleService")
	private SampleService sampleService;

	@Autowired
	BCryptPasswordEncoder passEncoder;

	// 글 작성 get
	@RequestMapping(value = "user/register.do", method = RequestMethod.GET)
	public void getRegister() throws Exception {
		logger.info("get register");
	}

	// 글 작성 post
	@RequestMapping(value = "user/register.do", method = RequestMethod.POST)
	public String postRegister(UserVO vo) throws Exception {
		String inputPassword = vo.getPassword();
		String password = passEncoder.encode(inputPassword);
		vo.setPassword(password);
		userService.register(vo);

		return "redirect:/";

	}

	@RequestMapping(value = "login.do", method = RequestMethod.POST)
	public String login(UserVO vo, HttpServletRequest req) throws Exception {

		HttpSession session = req.getSession();

		UserVO login = userService.login(vo);
		boolean passwordMatch = false;

		if (login != null)
			passwordMatch = passEncoder.matches(vo.getPassword(), login.getPassword());

		if (login != null && passwordMatch) {
			session.setAttribute("user", login);
			req.setAttribute("msg", "로그인 성공! HOME 화면으로 이동합니다.");
			req.setAttribute("url", "/WebProject");
		} else {
			session.setAttribute("user", null);
			req.setAttribute("msg", "로그인에 실패했습니다. 아이디 또는 패스워드를 다시 입력해주십시오.");
			req.setAttribute("url", "login.jsp");

			return "user/alert";
		}
		return "user/alert3";

	}

	@RequestMapping(value = "logout.do", method = RequestMethod.GET)
	public String logout(HttpSession session, HttpServletRequest req) throws Exception {

		if (session != null) {
			session.invalidate();
			req.setAttribute("msg", "로그아웃 성공! Home 화면으로 이동합니다.");
			req.setAttribute("url", "/WebProject");
		} else {
			req.setAttribute("msg", "로그아웃 실패! 로그인 여부를 점검해 주세요");
			req.setAttribute("url", "/WebProject");
		}

		return "user/alert4";
	}

	@RequestMapping(value = "user/modifyUser.do", method = RequestMethod.GET)
	public void getModify() throws Exception {

	}

	@RequestMapping(value = "user/modifyUser.do", method = RequestMethod.POST)
	public String postModify(HttpSession session, UserVO vo) throws Exception {
		String password = passEncoder.encode(vo.getPassword());
		vo.setPassword(password);
		userService.modifyUser(vo);

		session.invalidate();

		return "redirect:/";
	}

	@RequestMapping(value = "user/withdrawal.do", method = RequestMethod.GET)
	public void getWithdrawal() throws Exception {

	}

	@RequestMapping(value = "user/withdrawal.do", method = RequestMethod.POST)
	public String postWithdrawal(HttpSession session, HttpServletRequest req, UserVO vo) throws Exception {
		System.out.println("탈퇴");
		UserVO user = (UserVO) session.getAttribute("user");

		String oldPass = user.getPassword();
		String newPass = vo.getPassword();

		System.out.println(oldPass);
		System.out.println(newPass);
		System.out.println(passEncoder.matches(newPass, oldPass));

		if (!(passEncoder.matches(newPass, oldPass))) {
			req.setAttribute("msg", "입력한 비밀번호가 잘못 되었습니다.");
			req.setAttribute("url", "/WebProject/user/withdrawal.do");
			return "user/alert2";
		}
		
		replyService.updateUser(user.getUser_id());
		boardService.updateUser(user.getUser_id());
		qboardService.updateUser(user.getUser_id());
		sampleService.updateUser(user.getUser_id());
		userService.withdrawal(vo);

		session.invalidate();

		return "redirect:/";
	}

	// 회원 확인 (아이디 중복 체크)
	@ResponseBody
	@RequestMapping(value = "/idCheck.do", method = RequestMethod.POST)
	public int postIdCheck(HttpServletRequest req) throws Exception {
		System.out.println("컨트롤러 동작");
		String user_id = req.getParameter("user_id");
		UserVO idCheck = userService.idCheck(user_id);

		int result = 0;

		if (idCheck != null) {
			result = 1;
		}

		return result;

	}
}
