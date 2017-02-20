package org.zerock.service;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.zerock.persistence.Project;
import org.zerock.persistence.ProjectDAO;

@Service
public class ProjectServiceImpl implements ProjectService{
	
	@Inject
	private ProjectDAO dao;
	
	@Override
	public List<Project> listProject(String pNo){
		return dao.listProject(pNo);
	}

	@Override
	public List<Project> listTOA(String pNo) {
		return dao.listTOA(pNo);
	}

	@Override
	public List<Project> viewList() {
		return dao.viewList();
	}

	@Override
	public void insertProject(Project project) {
		dao.insertProject(project);
	}

	@Override
	public void insertTOA(Project project) {
		dao.insertTOA(project);
	}

	@Override
	public List<Project> viewPT() {
		return dao.viewPT();
	}

	@Override
	public Project readProject(String pNo) {
		return dao.readProject(pNo);
	}
}
