package kr.ac.poll.kopo03.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Optional;

import kr.ac.poll.kopo03.dao.CandidateDaoImpl;
import kr.ac.poll.kopo03.dao.VoterDaoImpl;
import kr.ac.poll.kopo03.domain.Candidate;

public class CandidateServiceImpl implements CandidateService{
	CandidateDaoImpl canDao = CandidateDaoImpl.getInstance();
	
	private static CandidateServiceImpl instance = new CandidateServiceImpl();
	
	private CandidateServiceImpl() {
		
	}
	
	public static CandidateServiceImpl getInstance() {
		if (instance == null) {
			instance = new CandidateServiceImpl();
		}
		return instance; 
	}
	
	@Override
	public int enroll(Candidate can) {
		try {
			canDao.save(can.getName());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return can.getId();
	}
	
	@Override
	public void resign(Candidate can) {
		canDao.selectOne(can.getId()).ifPresent(c -> {
			canDao.delete(can);
		});
	}
	
	@Override
	public List<Candidate> viewAll() {
		return canDao.selectAll();
	}
	// DAO레벨로 옮길 것
	public String allCandidateNames() {
		List<String> cans = canDao.selectAllNames();
		String names = "['" + String.join("', '", cans) + "']";
		return names;
	}
	// DAO레벨로 옮길 것
	public List<String> allCandidateNamesList() {
		return canDao.selectAllNames();
	}
	
	@Override
	public Optional<Candidate> viewOne(int id) {
		return canDao.selectOne(id);
	}
	
} 
