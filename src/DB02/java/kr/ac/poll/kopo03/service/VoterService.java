package kr.ac.poll.kopo03.service;

import java.util.List;

import kr.ac.poll.kopo03.domain.Candidate;
import kr.ac.poll.kopo03.domain.Voter;

public interface VoterService {
	 Voter vote(int age, int huboId) throws Exception;
	 String singleCandidateVoteAges(int id) throws Exception;
	 int totalVotes() throws Exception;
	 int oneCandidateVotes(int id, String name) throws Exception;
	 int[]  allCandidateVotes() throws Exception;
	 double calcVoteRate(int votes, int total) throws Exception;
}
