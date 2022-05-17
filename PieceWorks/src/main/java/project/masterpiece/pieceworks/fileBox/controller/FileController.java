package project.masterpiece.pieceworks.fileBox.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import project.masterpiece.pieceworks.board.model.exception.BoardException;
import project.masterpiece.pieceworks.board.model.vo.Board;
import project.masterpiece.pieceworks.common.FileBox;
import project.masterpiece.pieceworks.common.Pagination;
import project.masterpiece.pieceworks.fileBox.model.service.FileService;
import project.masterpiece.pieceworks.member.model.vo.Member;
import project.masterpiece.pieceworks.project.model.vo.PageInfo;

@Controller
public class FileController {
	
	@Autowired
	private FileService fService;
	
	@RequestMapping(value="fileList.bo", method = RequestMethod.GET)
	public ModelAndView fileList(@RequestParam(value = "page", required = false) Integer page, ModelAndView mv,
			HttpSession session) {

		Member loginUser = (Member)session.getAttribute("loginUser");
		//세션에서 mamber받아와서 선택한 projectNo 넘기기

	
		int projectNo = loginUser.getCurrPno(); //프로젝트마다 파일함 있음으로 프로젝트 번호로 검색		
		ArrayList<FileBox> list = fService.selectFile(projectNo);//파일 리스트
		
		if (list != null) {
			mv.addObject("list", list);
			mv.setViewName("fileList");
			System.out.println("파일" + list);

		} else {

			throw new BoardException("파일 조회 실패");
		}
		
			return mv;
			
		
		

	}

}
