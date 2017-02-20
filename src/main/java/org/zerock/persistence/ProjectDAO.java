package org.zerock.persistence;

import java.util.List;

public interface ProjectDAO{
	public List<Project> listProject(String pNo);
	public List<Project> viewList();
	public List<Project> listTOA(String pNo);
	public List<Project> viewPT();
	public void insertProject(Project project);
	public void insertTOA(Project project);
	public Project readProject(String pNo); 
}
