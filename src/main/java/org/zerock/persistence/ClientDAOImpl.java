package org.zerock.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class ClientDAOImpl implements ClientDAO{

	@Inject
	private SqlSession session;
	
	private static String namespace = "org.zerock.persistence.ClientDAO";
	
	@Override
	public void clientRegister(Client client) {
		session.insert(namespace + ".clientRegister", client);
	}

	@Override
	public List<Client> clientList(Client client) {
		return session.selectList(namespace + ".clientList", client);
	}

	@Override
	public Client selectClient(int ctNo) {
		return session.selectOne(namespace + ".selectClient", ctNo);
	}

	@Override
	public void insertFile(Client client) {
		session.insert(namespace + ".insertFile", client);
	}

	@Override
	public List<Client> fileList(String ctNo) {
		return session.selectList(namespace + ".fileList", ctNo);
	}

	@Override
	public List<Client> taskList(String ctNo) {
		return session.selectList(namespace + ".taskList", ctNo);
	}

	@Override
	public Client fileView(String fNo) {
		return session.selectOne(namespace + ".fileView", fNo);
	}

	@Override
	public Client selectClient(String ctNo) {
		return session.selectOne(namespace + ".selectClient", ctNo);
	}

	@Override
	public void updateClient(Client client) {
		session.update(namespace + ".updateClient", client);
	}

	@Override
	public void deleteClient(String ctNo) {
		session.delete(namespace+ ".deleteClient", ctNo);
	}

	@Override
	public void deleteWorkLog(String ctNo) {
		session.delete(namespace + ".deleteWorkLog", ctNo);
	}

	@Override
	public void deleteContract(String ctNo) {
		session.delete(namespace + ".deleteContract", ctNo);
	}
}
