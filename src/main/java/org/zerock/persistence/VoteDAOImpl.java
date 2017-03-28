package org.zerock.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class VoteDAOImpl implements VoteDAO{

	@Inject
	private SqlSession session;
	
	private static String namespace = "org.zerock.persistence.VoteDAO";
	
	@Override
	public void insertVote(Vote vote) {
		session.insert(namespace + ".insertVote", vote);
	}

	@Override
	public void insertVoteItems(Vote vote) {
		session.insert(namespace + ".insertVoteItems", vote);
	}

	@Override
	public List<Vote> listVote(Vote vote) {
		return session.selectList(namespace + ".listVote", vote);
	}

	@Override
	public Vote viewVote(int vNo) {
		return session.selectOne(namespace + ".viewVote", vNo);
	}

	@Override
	public List<Vote> viewVoteItems(int vNo) {
		return session.selectList(namespace + ".viewVoteItems", vNo);
	}

	@Override
	public void icountUpdate(Vote vote) {
		session.update(namespace + ".icountUpdate", vote);
	}

	@Override
	public void insertVoteUser(Vote vote) {
		session.insert(namespace + ".insertVoteUser", vote);
	}

	@Override
	public List<Vote> voteUser(Vote vote) {
		return session.selectList(namespace + ".voteUser", vote);
	}

	@Override
	public List<Vote> homeList(Vote vote) {
		return session.selectList(namespace + ".homeList", vote);
	}

	@Override
	public void icountUpdate2(Vote vote) {
		session.update(namespace + ".icountUpdate2", vote);
	}

	@Override
	public void deleteVoteUser(int vuNo) {
		session.delete(namespace + ".deleteVoteUser", vuNo);
	}

	@Override
	public List<Vote> commentList(Vote vote) {
		return session.selectList(namespace + ".commentList", vote);
	}

	@Override
	public void commentWrite(Vote vote) {
		session.insert(namespace + ".commentWrite", vote);
	}

	@Override
	public void deleteComment(int coNo) {
		session.delete(namespace + ".deleteComment", coNo);
	}

	@Override
	public void updateComment(Vote vote) {
		session.update(namespace + ".updateComment", vote);
	}

}
