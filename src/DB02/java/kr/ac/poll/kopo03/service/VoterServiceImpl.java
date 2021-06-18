package kr.ac.poll.kopo03.service;

import java.util.Arrays;
import java.util.List;
import java.util.Optional;

import kr.ac.poll.kopo03.dao.VoterDaoImpl;
import kr.ac.poll.kopo03.domain.Candidate;
import kr.ac.poll.kopo03.domain.Voter;

public class VoterServiceImpl implements VoterService {
	VoterDaoImpl voteDao = VoterDaoImpl.getInstance();
	
	private static VoterServiceImpl instance = new VoterServiceImpl();
	
	private VoterServiceImpl() {
		
	}
	
	public static VoterServiceImpl getInstance() {
		if (instance == null) {
			instance = new VoterServiceImpl();
		}
		return instance; 
	}	
	
	@Override
	public Voter vote(int age, int huboId) {
		CandidateServiceImpl canService = CandidateServiceImpl.getInstance();
		Optional<Candidate> can = canService.viewAll().stream().filter(candidate -> candidate.getId() == huboId).findAny();
		Voter voter = new Voter(age, can.get());
		return voteDao.save(voter);
	}
	
	@Override
	public String singleCandidateVoteAges(int id) {
		Candidate can = new Candidate(id);
		return Arrays.toString(voteDao.selectOneCandidateAges(can));
	}
	
	@Override
	public int[] allCandidateVotes() {
		List<Integer> allVotes = voteDao.selectAllCandidates();
		int[] voteResult = new int[allVotes.size()];
		for (int i = 0; i < allVotes.size(); i++) {
			voteResult[i] = (int)allVotes.get(i);
		}
		return voteResult;
	}
	
	@Override
	public double calcVoteRate(int votes, int total) throws Exception {
		return votes / total * 100.0;
	}
	//인터페이스에 추가할 것
	 public double voteRateOfOneCandidate(Candidate can) {
		 double voteRate = 0;
		 try {
			 voteRate =  calcVoteRate(voteDao.totalVotesCntOfOneCandidate(can), voteDao.totalVotesCntOfAllCandidates());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return voteRate;
	 }
	//인터페이스에 추가할 것
	 public double[] voteAgeRateOfOneCandidate(Candidate can) {
		 double[] ageRate = new double[9];
		 int i;
		 int[] voterAges = voteDao.selectOneCandidateAges(can);
		 for (i = 0; i < ageRate.length; i++) {
			 try {
				ageRate[i] = calcVoteRate(voterAges[i], voteDao.totalVotesCntOfOneCandidate(can));
			} catch (Exception e) {
				e.printStackTrace();
			}
		 }
		 return ageRate;
	 }

	@Override
	public int totalVotes() throws Exception {
		return voteDao.totalVotesCntOfAllCandidates();
	}

	@Override
	public int oneCandidateVotes(int id, String name) throws Exception {
		Candidate can = new Candidate(id, name);
		return voteDao.totalVotesCntOfOneCandidate(can);
	}

}
