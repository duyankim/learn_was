package kr.ac.poll.kopo03.dao;

import java.sql.*;
import java.util.*;

import kr.ac.poll.kopo03.domain.Candidate;
import kr.ac.poll.kopo03.domain.Voter;

public class VoterDaoImpl implements VoterDao {
	private static VoterDaoImpl instance = new VoterDaoImpl();
	
	private VoterDaoImpl() {
		
	}
	
	public static VoterDaoImpl getInstance() {
		if (instance == null) {
			instance = new VoterDaoImpl();
		}
		return instance; 
	}
	
	@Override
	public Voter save(Voter vote) {
		String sql = "insert into tupyo_table values(?, ?)";

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
					"jdbc:mysql://192.168.23.27:3306/kopoctc", 
					"root", 
					"kopoctc");
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, vote.getId());
			pstmt.setInt(2, vote.getAge());
			pstmt.executeQuery();
			
			if (rset.next()) {
				vote.setId(rset.getInt(1));
				vote.setAge(rset.getInt(2));
			} else {
				throw new SQLException("id가 존재하지 않습니다.");
			}
			return vote;
		} catch (Exception e1) {
			throw new IllegalStateException(e1);
		} finally {
			close(conn, pstmt, rset);
		}
	}

	@Override
	public int[] selectOne(Candidate can) {		
		String sql = "select count(age) as cnt from tupyo_table where id = ? group by age order by age";

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
					"jdbc:mysql://192.168.23.27:3306/kopoctc", 
					"root", 
					"kopoctc");
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, can.getId());
			
			rset = pstmt.executeQuery();
			
			int[] voteCnt = new int[9];
			while(rset.next()) {
				for (int cnt : voteCnt) {
					cnt += rset.getInt("cnt");
				}
			}
			return voteCnt;
		} catch (Exception e1) {
			throw new IllegalStateException("존재하지 않는 후보입니다.");
		} finally {
			close(conn, pstmt, rset);
		}
	}

	@Override
	public List<Integer> selectAll() {
		
		String sql = "select count(*) as cnt from tupyo_table group by id";
		
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
					"jdbc:mysql://192.168.23.27:3306/kopoctc", 
					"root", 
					"kopoctc");
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();

			List<Integer> voteCnt = new ArrayList<Integer>();
			while(rset.next()) {
				for (int cnt : voteCnt) {
					cnt += rset.getInt("cnt");
				}
			}
			return voteCnt;
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
