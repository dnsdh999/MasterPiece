package project.masterpiece.pieceworks.fileBox.model.service;

import java.util.ArrayList;

import project.masterpiece.pieceworks.common.FileBox;
import project.masterpiece.pieceworks.project.model.vo.PageInfo;

public interface FileService {

	ArrayList<FileBox> selectFile(int projectNo);
	
}
