package org.zerock.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class ProjectDAOImpl implements ProjectDAO{
	
	@Inject
	private SqlSession session;
	
	private static String namespace = "org.zerock.persistence.ProjectDAO";
	
	@Override
	public List<Project> listProject(String pNo){
		return session.selectList(namespace + ".listProject", pNo);
	}

	@Override
	public List<Project> listTOA(String pNo) {
		return session.selectList(namespace + ".listTOA", pNo);
	}

	@Override
	public List<Project> viewList() {
		return session.selectList(namespace + ".viewList");
	}

	@Override
	public void insertProject(Project project) {
		session.insert(namespace + ".insertProject", project);
	}

	@Override
	public void insertTOA(Project project) {
		session.insert(namespace + ".insertTOA", project);
	}

	@Override
	public List<Project> viewPT() {
		return session.selectList(namespace + ".viewPT");
	}

	@Override
	public Project readProject(String pNo) {
		return session.selectOne(namespace + ".readProject", pNo);
	}
}
