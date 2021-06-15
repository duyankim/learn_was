package kr.ac.poll.kopo03.dao;

import java.util.List;
import java.util.Optional;

import kr.ac.poll.kopo03.domain.Candidate;
import kr.ac.poll.kopo03.domain.Voter;

public interface VoterDao {
	Voter save(Voter vote) throws Exception;
	int[] selectOne(Candidate can) throws Exception;
	List<Integer> selectAll() throws Exception;
}
