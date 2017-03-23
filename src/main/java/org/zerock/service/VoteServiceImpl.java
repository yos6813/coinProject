package org.zerock.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.zerock.persistence.Vote;
import org.zerock.persistence.VoteDAO;

@Service
public class VoteServiceImpl implements VoteService{

	@Inject
	private VoteDAO dao;
	
	@Override
	public void insertVote(Vote vote) {
		dao.insertVote(vote);
	}

	@Override
	public void insertVoteItems(Vote vote) {
		dao.insertVoteItems(vote);
	}

	@Override
	public List<Vote> listVote(Vote vote) {
		return dao.listVote(vote);
	}

	@Override
	public Vote viewVote(int vNo) {
		return dao.viewVote(vNo);
	}

	@Override
	public List<Vote> viewVoteItems(int vNo) {
		return dao.viewVoteItems(vNo);
	}

	@Override
	public void icountUpdate(int iNo) {
		dao.icountUpdate(iNo);
	}

	@Override
	public void insertVoteUser(Vote vote) {
		dao.insertVoteUser(vote);
	}

	@Override
	public List<Vote> voteUser(Vote vote) {
		return dao.voteUser(vote);
	}

}
