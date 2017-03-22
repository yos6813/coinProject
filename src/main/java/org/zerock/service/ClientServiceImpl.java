package org.zerock.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.zerock.persistence.Client;
import org.zerock.persistence.ClientDAO;

@Service
public class ClientServiceImpl implements ClientService{

	@Inject
	private ClientDAO dao;
	
	@Override
	public void clientRegister(Client client) {
		dao.clientRegister(client);
	}

	@Override
	public List<Client> clientList(Client client) {
		return dao.clientList(client);
	}

	@Override
	public Client selectClient(int ctNo) {
		return dao.selectClient(ctNo);
	}

	@Override
	public void insertFile(Client client) {
		dao.insertFile(client);
	}

	@Override
	public List<Client> fileList(String ctNo) {
		return dao.fileList(ctNo);
	}

	@Override
	public List<Client> taskList(String ctNo) {
		return dao.taskList(ctNo);
	}

	@Override
	public Client fileView(String fNo) {
		return dao.fileView(fNo);
	}

	@Override
	public Client selectClient(String ctNo) {
		return dao.selectClient(ctNo);
	}

	@Override
	public void updateClient(Client client) {
		dao.updateClient(client);
	}

	@Override
	public void deleteClient(String ctNo) {
		dao.deleteClient(ctNo);
	}

	@Override
	public void deleteWorkLog(String ctNo) {
		dao.deleteWorkLog(ctNo);
	}

	@Override
	public void deleteContract(String ctNo) {
		dao.deleteContract(ctNo);
	}

}
