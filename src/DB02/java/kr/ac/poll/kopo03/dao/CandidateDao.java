package kr.ac.poll.kopo03.dao;

import java.util.List;
import java.util.Optional;

import kr.ac.poll.kopo03.domain.Candidate;

public interface CandidateDao{
    Candidate save(String name) throws Exception;
    void delete(Candidate can) throws Exception;
    Optional<Candidate> selectOne(int id) throws Exception;
    List<Candidate> selectAll() throws Exception;
}
