package egovframework.board.web;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import egovframework.board.service.QBoardDefaultVO;
import egovframework.board.service.QBoardService;
import egovframework.board.service.QBoardVO;
import egovframework.board.service.UserVO;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
@SessionAttributes("QBoard")
public class QBoardController {

	@Resource(name = "qBoardService")
	private QBoardService qBoardService;

	@Resource(name = "uploadPath")
	private String uploadPath;

	@RequestMapping(value = "qboard/insertQBoard.do", method = RequestMethod.GET)
	public String insertQBoardView(HttpSession session, Model model, QBoardVO vo) {
		System.out.println(uploadPath);

		return "qboard/insertQBoard";
	}

	@RequestMapping(value = "qboard/insertQBoard.do", method = RequestMethod.POST)
	public String insertQBoard(QBoardVO vo) throws Exception {

		// 파일 업로드 처리
		String fileName = null;
		MultipartFile uploadFile = vo.getUploadFile();

		if (!uploadFile.isEmpty()) {
			// 파일명 (년월일시분초-글번호-uuid-파일명.확장자)
			SimpleDateFormat simpl = new SimpleDateFormat("yyyyMMddHHmmss");
			Calendar calendar = Calendar.getInstance();
			String uuid = UUID.randomUUID().toString().substring(0, 5);
			String originalFileName = uploadFile.getOriginalFilename();
			fileName = simpl.format(calendar.getTime()) + "-" + vo.getNo() + "-" + uuid + "-" + originalFileName;

			File dirPath = new File(uploadPath);
			// File dirPath=new File("C:\\upload\\");

			if (!dirPath.exists()) {
				System.out.println(!dirPath.exists());
				dirPath.mkdir();
			}

			// 파일 저장 경로 지정
			uploadFile.transferTo(new File(uploadPath + fileName));
		}

		vo.setFileName(fileName);

		qBoardService.insertQBoard(vo);

		return "forward:selectQBoardList.do";
	}

	@RequestMapping("qboard/selectQBoardList.do")
	public String selectBoardList(@RequestParam(value = "typeCondition", required = false) String typeCondition,
			@ModelAttribute("searchVO") QBoardDefaultVO searchVO, ModelMap model, HttpSession session)
			throws Exception {
		if (searchVO.getTypeCondition() == null)
			searchVO.setTypeCondition("");

		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
		paginationInfo.setPageSize(searchVO.getPageSize());

		searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		System.out.println(paginationInfo.getRecordCountPerPage());
		System.out.println(paginationInfo.getPageSize());

		int total = qBoardService.selectQBoardTotal(searchVO);
		paginationInfo.setTotalRecordCount(total);

		model.addAttribute("typeCondition", searchVO.getTypeCondition());
		model.addAttribute("total", total);
		model.addAttribute("paginationInfo", paginationInfo);
		model.addAttribute("QBoardList", qBoardService.selectQBoardList(searchVO));

		UserVO user = (UserVO) session.getAttribute("user");
		model.addAttribute("sessionId", user.getUser_id());

		return "qboard/selectQBoardList";
	}

	@RequestMapping("qboard/selectQBoard.do")
	public String selectQBoard(HttpSession session, QBoardVO vo, Model model) throws Exception {
		UserVO user = (UserVO) session.getAttribute("user");

		System.out.println("로그인===" + user.getUser_id());
		System.out.println("작성자===" + vo.getUsers());

		System.out.println(vo.getGroupId());

		if (user.getUser_id().equals("ad")) {
			model.addAttribute("QBoard", qBoardService.selectQBoard(vo));
			model.addAttribute("maxLayer", qBoardService.maxLayer(vo));
			return "qboard/insertQReply";
		} else {
			qBoardService.updateReadCount(vo);
			model.addAttribute("QBoard", qBoardService.selectQBoard(vo));
			model.addAttribute("maxLayer", qBoardService.maxLayer(vo));
			System.out.println(qBoardService.maxLayer(vo));
			model.addAttribute("sessionId", user.getUser_id());
			return "qboard/selectQBoard";
		}
	}

	@RequestMapping("qboard/updateQBoard.do")
	public String updateQBoard(@ModelAttribute("QBoard") QBoardVO vo) throws Exception {
		// 파일 업로드 처리

		String fileName = null;
		MultipartFile uploadFile = vo.getUploadFile();

		System.out.println("업데이트 기능 작동");

		if (uploadFile != null && !uploadFile.isEmpty()) {
			// 파일명 (년월일시분초-글번호-uuid-파일명.확장자)
			SimpleDateFormat simpl = new SimpleDateFormat("yyyyMMddHHmmss");
			Calendar calendar = Calendar.getInstance();
			String uuid = UUID.randomUUID().toString().substring(0, 5);
			String originalFileName = uploadFile.getOriginalFilename();
			fileName = simpl.format(calendar.getTime()) + "-" + vo.getNo() + "-" + uuid + "-" + originalFileName;

			File dirPath = new File(uploadPath);

			if (!dirPath.exists()) {
				System.out.println(!dirPath.exists());
				dirPath.mkdir();
			}

			// 파일 저장 경로 지정
			uploadFile.transferTo(new File(uploadPath + fileName));

			vo.setFileName(fileName);
		}

		qBoardService.updateQBoard(vo);

		return "forward:selectQBoardList.do";
	}

	@RequestMapping("qboard/deleteQBoard.do")
	public String deleteQBoard(QBoardVO vo, HttpServletRequest req) throws Exception {
		System.out.println("==============" + vo.getGroupId());
		qBoardService.deleteQBoard(vo);

		req.setAttribute("msg", "삭제가 완료되었습니다.");
		req.setAttribute("url", "selectQBoardList.do");
		return "qboard/deleteAlert";
	}

	@RequestMapping("/fileDownload.do")
	public void fileDownload(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String filename = request.getParameter("fileName");
		String realFilename = "";
		System.out.println(filename);

		try {
			// 운영체제 정보
			String browser = request.getHeader("User-Agent");

			// 파일 인코딩 (파일명 한글 처리)
			if (browser.contains("MSIE") || browser.contains("Trident") || browser.contains("Chrome")) {
				filename = URLEncoder.encode(filename, "UTF-8").replaceAll("\\+", "%20");
			} else {
				filename = new String(filename.getBytes("UTF-8"), "ISO-8859-1");
			}

		} catch (UnsupportedEncodingException e) {
			System.out.println("UnsupportedEncodingException 발생");
		}

		realFilename = uploadPath + filename;
		// realFilename = "C:\\upload\\" + filename;
		System.out.println(realFilename);

		File file = new File(realFilename);
		if (!file.exists()) {
			return;
		}

		response.setContentType("application/octer-stream");
		response.setHeader("Content-Transfer-Encoding", "binary");
		// 파일 링크를 클릭했을때 다운로드 화면이 출력되게 처리함
		response.setHeader("Content-Disposition", "attachment; filename=\"" + filename + "\"");

		try {
			OutputStream os = response.getOutputStream();
			FileInputStream fis = new FileInputStream(realFilename);

			byte[] bytes = new byte[512]; // 읽은 바이트를 저장할 배열 생성 (최대 512 바이트 읽기)

			while (true) {
				int cnt = fis.read(bytes); // 입력 스트림으로부터 주어진 배열의 길이만큼 바이트를 읽고 배열에 저장 - 읽은 바이트 수 리턴
				if (cnt == -1)
					break; // 파일을 다 읽으면
				os.write(bytes, 0, cnt); // 읽은 바이트 수만큼 출력
			}

			os.flush(); // 내부 버퍼 잔류 바이트 출력 후 버퍼 비우기
			fis.close(); // 배열의 모든 바이트 출력
			os.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	@RequestMapping(value = "/showImage.do", method = RequestMethod.GET)
	public ResponseEntity<byte[]> view(String fileName) throws Exception {
		File file = new File(uploadPath + fileName);

		ResponseEntity<byte[]> result = null;

		try {
			HttpHeaders header = new HttpHeaders();

			header.add("Content-type", Files.probeContentType(file.toPath()));

			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);

		} catch (IOException e) {
			e.printStackTrace();
		}

		return result;
	}

	@RequestMapping(value = "qboard/insertQReply.do", method = RequestMethod.POST)
	public String insertQReply(@ModelAttribute("QBoard") QBoardVO vo, HttpSession session) throws Exception {
		System.out.println(vo.toString());

		UserVO user = (UserVO) session.getAttribute("user");
		System.out.println(user.getUser_id());
		vo.setUsers(user.getUser_id());
		qBoardService.insertQReply(vo);

		return "forward:selectQBoardList.do";
	}

	@RequestMapping("qboard/selectQReply.do")
	public String selectQReply(HttpSession session, QBoardVO vo, Model model) throws Exception {
		UserVO user = (UserVO) session.getAttribute("user");

		if (user.getUser_id().equals("ad")) {
			model.addAttribute("QBoard", qBoardService.selectQBoard(vo));
			model.addAttribute("sessionId", user.getUser_id());

			return "qboard/selectQReply";
		} else {
			qBoardService.updateReadCount(vo);
			model.addAttribute("QBoard", qBoardService.selectQBoard(vo));
			model.addAttribute("sessionId", user.getUser_id());

			return "qboard/selectQReply";
		}
	}

	@RequestMapping("qboard/updateQReply.do")
	public String updateQReply(@ModelAttribute("QBoard") QBoardVO vo) throws Exception {

		qBoardService.updateQBoard(vo);

		return "forward:selectQBoardList.do";
	}

	@RequestMapping("qboard/deleteQReply.do")
	public String deleteQReply(QBoardVO vo, HttpServletRequest req) throws Exception {

		qBoardService.deleteQReply(vo);

		req.setAttribute("msg", "삭제가 완료되었습니다.");
		req.setAttribute("url", "selectQBoardList.do");
		return "qboard/deleteAlert";
	}

	@ModelAttribute("typeConditionMap")
	public Map<String, String> typeConditionMap() {
		Map<String, String> conditionMap = new HashMap<>();

		conditionMap.put("회원/로그인", "USER");
		conditionMap.put("예약/반납", "RENTAL");
		conditionMap.put("대여소", "PLACE");
		conditionMap.put("기타", "ETC");

		return conditionMap;
	}

}
