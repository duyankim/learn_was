package kr.ac.poll.kopo03.service;

import java.util.List;

import kr.ac.poll.kopo03.dao.VoterDaoImpl;
import kr.ac.poll.kopo03.domain.Candidate;
import kr.ac.poll.kopo03.domain.Voter;

public class VoterService {
	VoterDaoImpl voteDao = new VoterDaoImpl();
	
	public Voter vote(Voter voter) {
		return voteDao.save(voter);
	}
	
	public int[] analyzeOne(Candidate can) {
		//후보자가 존재하는지 유효성검증을 하고 싶음.
		//인스턴스를 여기에 만들어도 되는지?
		return voteDao.selectOne(can);
	}
	
	public List<Integer> analyzeAll() {
		return voteDao.selectAll();
	}
	
}
