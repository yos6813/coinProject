package org.zerock.service;

import java.util.List;

import org.zerock.persistence.Project;

public interface ProjectService {
	public List<Project> listProject(String pNo);
	public List<Project> listTOA(String pNo);
	public List<Project> viewList();
	public List<Project> viewPT();
	public void insertProject(Project project);
	public void insertTOA(Project project);
	public Project readProject(String pNo);
}
