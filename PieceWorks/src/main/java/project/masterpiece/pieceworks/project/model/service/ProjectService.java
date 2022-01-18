package project.masterpiece.pieceworks.project.model.service;

import java.util.ArrayList;

import project.masterpiece.pieceworks.project.model.vo.PageInfo;
import project.masterpiece.pieceworks.project.model.vo.Project;

public interface ProjectService {

	int insertProject(Project p);

	int getListCount();

	ArrayList<Project> selectList(PageInfo pi);

	ArrayList<Project> getPList(String email);

	int insertPrJoin(Project p);

}
