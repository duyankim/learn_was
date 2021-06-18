package kr.ac.poll.kopo03.dao;

import java.sql.*;
import java.util.*;

import kr.ac.poll.kopo03.domain.Candidate;
import kr.ac.poll.kopo03.domain.Voter;

public class VoterDaoImpl implements VoterDao {
	private static VoterDaoImpl instance = new VoterDaoImpl();
	
	VoterDaoImpl() {
		
	}
	
	public static VoterDaoImpl getInstance() {
		if (instance == null) {
			instance = new VoterDaoImpl();
		}
		return instance; 
	}
	
	@Override
	public Voter save(Voter vote) {
		String sql = "insert into tupyo_table(age, huboId) values(?, ?)";

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		try {
			conn = DriverManager.getConnection(
					"jdbc:mysql://192.168.23.27:3306/pollsystem", 
					"root", 
					"kopoctc");
			pstmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			pstmt.setInt(1, vote.getAge());
			pstmt.setInt(2, vote.getCandidate().getId());
			pstmt.executeUpdate();
			rset = pstmt.getGeneratedKeys();
			return vote;
		} catch (Exception e1) {
			throw new IllegalStateException(e1);
		} finally {
			close(conn, pstmt, rset);
		}
	}
	@Override
	public int[] selectOneCandidateAges(Candidate can) {		
		String sql = "select age, count(age) as cnt from tupyo_table where huboId = ? group by age order by age";

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		try {
			conn = DriverManager.getConnection(
					"jdbc:mysql://192.168.23.27:3306/pollsystem", 
					"root", 
					"kopoctc");
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, can.getId());
			
			rset = pstmt.executeQuery();
			
			int[] voteAgeCnt = new int[9];
			while(rset.next()) {
				voteAgeCnt[rset.getInt("age")-1] = rset.getInt("cnt");
			}			
			return voteAgeCnt;
		} catch (Exception e1) {
			throw new IllegalStateException("존재하지 않는 후보입니다.");
		} finally {
			close(conn, pstmt, rset);
		}
	}

	@Override
	public List<Integer> selectAllCandidates() {
		String sql = "select count(*) as cnt from tupyo_table group by huboId";
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		try {
			conn = DriverManager.getConnection(
					"jdbc:mysql://192.168.23.27:3306/pollsystem", 
					"root", 
					"kopoctc");
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();

			List<Integer> voteCnt = new ArrayList<Integer>();
			while(rset.next()) {
				voteCnt.add(rset.getInt("cnt"));
			}
			return voteCnt;
		} catch (Exception e1) {
			throw new IllegalStateException(e1);
		} finally {
			close(conn, pstmt, rset);
		}
	}
	
	 public int totalVotesCntOfOneCandidate(Candidate can) {
		 String sql = "select count(*) as totalCnt from tupyo_table where huboId = ?";
			
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}

			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rset = null;

			try {
				conn = DriverManager.getConnection(
						"jdbc:mysql://192.168.23.27:3306/pollsystem", 
						"root", 
						"kopoctc");
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, can.getId());
				
				rset = pstmt.executeQuery();
				int totalCnt = 0;
				while(rset.next()) {
					totalCnt = rset.getInt("totalCnt");
				}
				return totalCnt;
			} catch (Exception e1) {
				throw new IllegalStateException(e1);
			} finally {
				close(conn, pstmt, rset);
			}
	 }
	
	 public int totalVotesCntOfAllCandidates() {
		 String sql = "select count(*) as totalCnt from tupyo_table";
			
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}

			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rset = null;

			try {
				conn = DriverManager.getConnection(
						"jdbc:mysql://192.168.23.27:3306/pollsystem", 
						"root", 
						"kopoctc");
				
				pstmt = conn.prepareStatement(sql);
				
				rset = pstmt.executeQuery();
				int totalCnt = 0;
				while(rset.next()) {
					totalCnt = rset.getInt("totalCnt");
				}
				return totalCnt;
			} catch (Exception e1) {
				throw new IllegalStateException(e1);
			} finally {
				close(conn, pstmt, rset);
			}
	 }
	 
	 public List<Voter> votersListOfOneCandidate(Candidate can) {
		List<Voter> voters = new ArrayList<Voter>();
		Voter voter = new Voter();

		String sql = "SELECT t.id, t.age FROM hubo_table h INNER JOIN tupyo_table t ON h.id = t.huboId and h.id = ?";
			
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}

			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rset = null;

			try {
				conn = DriverManager.getConnection(
						"jdbc:mysql://192.168.23.27:3306/pollsystem", 
						"root", 
						"kopoctc");
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, can.getId());
				rset = pstmt.executeQuery();

				while(rset.next()) {
					voter.setId(rset.getInt("id"));
					voter.setAge(rset.getInt("age"));
					voter.setCandidate(can);
					voters.add(voter);
				}
				return voters;
			} catch (Exception e1) {
				throw new IllegalStateException(e1);
			} finally {
				close(conn, pstmt, rset);
			}
	 }
	 
	private void close(Connection conn, PreparedStatement pstmt, ResultSet rset) {
		try {
			if (rset != null) {
				rset.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		try {
			if (pstmt != null) {
				pstmt.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		try {
			if (conn != null) {
				conn.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
