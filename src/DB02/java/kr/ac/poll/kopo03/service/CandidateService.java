package kr.ac.poll.kopo03.service;

import java.util.List;
import java.util.Optional;

import kr.ac.poll.kopo03.domain.Candidate;

public interface CandidateService {
	 int enroll(Candidate can);
	 void resign(Candidate can);
	 List<Candidate> viewAll();
	 Optional<Candidate> viewOne(int id);
}
