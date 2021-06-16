package kr.ac.poll.kopo03.service;

import java.util.List;

import kr.ac.poll.kopo03.domain.Candidate;
import kr.ac.poll.kopo03.domain.Voter;

public interface VoterService {
	Voter vote(Voter voter);
	 int[] analyzeOne(Candidate can);
	 List<Integer> analyzeAll();
}
