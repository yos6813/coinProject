package org.zerock.service;

import java.util.List;

import org.zerock.persistence.Vote;

public interface VoteService {
	public void insertVote(Vote vote);
	public void insertVoteItems(Vote vote);
	public List<Vote> listVote(Vote vote);
	public Vote viewVote(int vNo);
	public List<Vote> viewVoteItems(int vNo);
	public void icountUpdate(int iNo);
	public void insertVoteUser(Vote vote);
	public List<Vote> voteUser(Vote vote);
	public List<Vote> homeList(Vote vote);
	public void icountUpdate2(int iNo);
	public void deleteVoteUser(int vuNo);
}
