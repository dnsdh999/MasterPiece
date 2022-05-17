package project.masterpiece.pieceworks.board.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;

import project.masterpiece.pieceworks.board.model.exception.BoardException;
import project.masterpiece.pieceworks.board.model.service.BoardService;
import project.masterpiece.pieceworks.board.model.vo.Board;
import project.masterpiece.pieceworks.board.model.vo.Reply;
//import project.masterpiece.pieceworks.board.model.vo.PageInfo;
import project.masterpiece.pieceworks.project.model.vo.PageInfo;
import project.masterpiece.pieceworks.common.FileBox;
import project.masterpiece.pieceworks.common.Pagination;
import project.masterpiece.pieceworks.member.model.vo.Member;

@Controller
public class BoardController {

	@Autowired
	private BoardService bService;

	//게시글 리스트
	@RequestMapping(value = "boardList.bo", method = RequestMethod.GET)
	public ModelAndView boardList(@RequestParam(value = "page", required = false) Integer page, ModelAndView mv, HttpSession session ) {

			Member loginUser = (Member)session.getAttribute("loginUser");
			
		
		int currentPage = 1;
		if (page != null) {
			currentPage = page;
		}
		
		int projectNo = loginUser.getCurrPno();//프로젝트 안에 게시판있으니까 프로젝트 번호 넘김
		int listCount = bService.getListCount(projectNo);

		// 페이징 계산
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		ArrayList<Board> list = bService.selectList(pi, projectNo);

		System.out.println("게시판" + list);
		
		if (list != null) {
			mv.addObject("pi", pi);
			mv.addObject("list", list);
			mv.setViewName("boardList");

		} else {

			throw new BoardException("게시글 전체조회 실패");
		}
		
		return mv;
		
		

	}

	// 게시글 상세보기
	@RequestMapping("boardDetail.bo")
	public String boardDetail(
			/* @RequestParam("loginUser") int loginUser, */@RequestParam(value = "boardNo") int boardNo, @RequestParam(value = "page", required = false) Integer page,
			Model model) {

		
		Board b = bService.selectBoard(boardNo);//게시글
		
		ArrayList<FileBox> fileBox = bService.selectFileBox(boardNo);//파일
		

		if (b != null) {
			model.addAttribute("board", b);
			model.addAttribute("page", page);
			model.addAttribute("fileBox", fileBox);
		} else {
			throw new BoardException("게시글 상세조회 실패");
		}
		
		return "boardDetail";

	}

	
	
	// 게시글 수정 이동
	@RequestMapping("boUpView.bo")
	public String boardUpdateView(@RequestParam("boardNo") int boardNo, @RequestParam("page") int page, Model model) {

		Board b = bService.selectBoard(boardNo);
		ArrayList<FileBox> fBox = bService.selectFileBox(boardNo);
		model.addAttribute("board", b).addAttribute("page", page).addAttribute("fileBox", fBox);

		return "boardUpdate";
	}

	
	// 게시글 수정 
	@RequestMapping("boardUpdate.bo")
	public String boardUpdate(@ModelAttribute Board b, @RequestParam(value = "page", required = false) int page, MultipartHttpServletRequest multipartRequest,
								 HttpServletRequest request, Model model, @RequestParam("deleteFilesNo") String deleteFilesNo) {

		
		
		//파일 추가
		if(multipartRequest != null) { //파일이 들어있을때
			List<MultipartFile> fileList = multipartRequest.getFiles("file"); //파일 가져오기
			
			List<FileBox> fBox = new ArrayList<FileBox>();
			for (int i = 0; i < fileList.size(); i++) {
				FileBox fb = new FileBox();
				
				MultipartFile mf = fileList.get(i);
				String fChangeName = saveFile(mf, request);
	            String fOriginName = mf.getOriginalFilename(); //원래 파일이름
	            long fileSize = mf.getSize();
	            int boardNo = b.getBoardNo();
	            
	            fb.setfChangeName(fChangeName);
	            fb.setFileSize(fileSize);
	            fb.setfOriginName(fOriginName);
	            fb.setFilePath("/buploadFiles");
	            fb.setBoardNo(boardNo);
	            
	            fBox.add(fb);
			}
		
			System.out.println("fBox: " + fBox);
			
			int resultF = bService.updateFile(fBox);
			
			
		} 
		
		//파일 삭제
		if(!deleteFilesNo.equals("")) {
			String[] deleteNoStr = deleteFilesNo.split("/");
			
			int[] deleteNo = new int[deleteNoStr.length - 1];
			
			
			for(int i = 1; i < deleteNoStr.length; i++) {
				deleteNo[i - 1] = Integer.parseInt(deleteNoStr[i]);
			}
			
			System.out.println(Arrays.toString(deleteNo));
						
			//파일삭제
			int resultf = bService.deleteFile(deleteNo);
	
		}

		
		
		int result = bService.updateBoard(b);

		if (result > 0) {
			model.addAttribute("page", page);
		} else {
			throw new BoardException("게시글 수정 실패");
		}

		return "redirect:boardDetail.bo?boardNo=" + b.getBoardNo();

	}

	
	//게시글 삭제
	@RequestMapping("boardDelete.bo") 
	public String boardDelete(@RequestParam("boardNo") int boardNo) {
		
		int result = bService.deleteBoard(boardNo);
		if(result > 0) {
			return "redirect:boardList.bo";
		}else {
			throw new BoardException("게시글 삭제 실패");
		}
		
		
	}
	 

	// 글쓰기 화면으로 이동
	@RequestMapping("boardInsertView.bo")
	public String boardInsertView() {
		return "boardInsertForm";
	}

	
	// 게시글 작성
	@RequestMapping(value = "boardInsert.bo", method = RequestMethod.POST )
	public String boardInsert(@ModelAttribute Board b, MultipartHttpServletRequest multipartRequest, HttpServletRequest request, HttpSession session) {
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		b.setBoardCount(loginUser.getCurrPno());
		
		// board insert		
		int result = bService.insertBoard(b);
		
		System.out.println("닉네임 " + loginUser.getNickName());
		
		// file insert, 파일 첨부할 경우
		if(multipartRequest != null) {
			List<MultipartFile> fileList = multipartRequest.getFiles("file"); //파일 가져오기
			System.out.println(fileList);
			
			
			List<FileBox> fBox = new ArrayList<FileBox>();
				for (int i = 0; i < fileList.size(); i++) {
					FileBox fb = new FileBox();
					
					MultipartFile mf = fileList.get(i);
					String fChangeName = saveFile(mf, request);
		            String fOriginName = mf.getOriginalFilename(); //원래 파일이름
		            long fileSize = mf.getSize();
		            
		            fb.setfChangeName(fChangeName);
		            fb.setFileSize(fileSize);
		            fb.setfOriginName(fOriginName);
		            fb.setFilePath("/buploadFiles");
		            
		            fBox.add(fb);
					}
			
				System.out.println("fBox: " + fBox);
				
				int resultF = bService.insertFile(fBox);
			}
	
        return "redirect:boardList.bo";
	}
	

	//파일
	public String saveFile(MultipartFile file, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resource");
		String savePath = root + "/buploadFiles";
		
		File folder = new File(savePath);
		if(!folder.exists()) { //폴더 존재하지 않으면
			folder.mkdirs(); //폴더 만들어주기
		}
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyymmddHHmmssSSS");
		String originFileName = file.getOriginalFilename();
		String renameFileName = sdf.format(new Date(System.currentTimeMillis()))
								+ (int)Math.random()*100000
								+ "." + originFileName.substring(originFileName.lastIndexOf(".") + 1);
	
		String renamePath = folder + "/" + renameFileName;
		//위에서 만든 폴더에다가 filename
		 
		try {
			file.transferTo(new File(renamePath));
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	
		return renameFileName;
	}
	
	
	
		//댓글
		@RequestMapping("addReply.bo")
		public String addReply(@ModelAttribute Reply r, @RequestParam(value="page", required = false) Integer page, 
							   HttpServletRequest request, HttpServletResponse response){ 
			
			String replyWriter = ((Member)request.getSession().getAttribute("loginUser")).getEmail();

			r.setReplyWriter(replyWriter);
			
			int result = bService.insertReply(r);
			
			if(result > 0) {
				return "redirect:boardDetail.bo?boardNo=" +r.getBoardNo();
			} else {
				throw new BoardException("댓글 작성 실패");
			}
			
			
		}
		
		
		//댓글 리스트
		@RequestMapping("rList.bo")
		public void replyList(@RequestParam("boardNo") int boardNo, HttpServletResponse response) {
			
			ArrayList<Reply> list = bService.getReplyList(boardNo);//게시글 번호로 댓글리스트 조회
			
			System.out.println("댓글 list : " + list);
			
			if(!list.isEmpty()) {
				String[] emailArr = new String[list.size()]; 
				
				for(int i = 0; i < list.size(); i++) {
					emailArr[i] = list.get(i).getReplyWriter();
				}
				
				System.out.println("이메일" + Arrays.toString(emailArr));
				
				ArrayList<Member> writerList = bService.selectReplyWriter(emailArr);//이메일로 닉네임 불러오기
				
				HashMap<String, ArrayList> map = new HashMap<>();
				map.put("list", list);
				map.put("writerList", writerList);
				
				response.setContentType("application/json; charset=UTF-8");
				
				GsonBuilder gb = new GsonBuilder().setDateFormat("yyyy-MM-dd");						
				Gson gson = gb.create();
				try {
					gson.toJson(map,response.getWriter());
				} catch (JsonIOException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			
		}

}
