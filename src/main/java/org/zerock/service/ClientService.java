package org.zerock.service;

import java.util.List;

import org.zerock.persistence.Client;

public interface ClientService {
	public void clientRegister(Client client);
	public List<Client> clientList(Client client);
	public Client selectClient(int ctNo);
	public Client selectClient(String ctNo);
	public void insertFile(Client client);
	public List<Client> fileList(String ctNo);
	public List<Client> taskList(String ctNo);
	public Client fileView(String fNo);
	public void updateClient(Client client);
	public void deleteClient(String ctNo);
	public void deleteWorkLog(String ctNo);
	public void deleteContract(String ctNo);
}
