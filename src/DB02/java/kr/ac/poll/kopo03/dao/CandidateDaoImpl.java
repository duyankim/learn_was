package kr.ac.poll.kopo03.dao;

import java.sql.*;
import java.util.*;

import kr.ac.poll.kopo03.domain.Candidate;

public class CandidateDaoImpl implements CandidateDao {
	private static CandidateDaoImpl instance = new CandidateDaoImpl();
	
	private CandidateDaoImpl() {
		
	}
	
	public static CandidateDaoImpl getInstance() {
		if (instance == null) {
			instance = new CandidateDaoImpl();
		}
		return instance; 
	}

	@Override
	public Candidate save(String name) throws SQLException {
		String sql = "insert into hubo_table(name) values(?)";

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Candidate can = new Candidate(name);

		try {
			conn = DriverManager.getConnection(
					"jdbc:mysql://192.168.23.27:3306/pollsystem", 
					"root", 
					"kopoctc");
			pstmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			pstmt.setString(1, name);
			pstmt.executeUpdate();
			rset = pstmt.getGeneratedKeys();

			if (rset.next()) {
				can.setId(rset.getInt(1));
			} else {
				throw new SQLException("id가 존재하지 않습니다.");
			}
			return can;
		} catch (Exception e1) {
			throw new IllegalStateException(e1);
		} finally {
			close(conn, pstmt, rset);
		}
	}

	@Override
	public void delete(Candidate can) {
		String sql = "delete from hubo_table where id = ?";
		String sql2 = "delete from tupyo_table where huboId = ?";

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		Connection conn = null;
		PreparedStatement pstmt2 = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		try {
			conn = DriverManager.getConnection(
					"jdbc:mysql://192.168.23.27:3306/pollsystem", 
					"root", 
					"kopoctc");
			pstmt2 = conn.prepareStatement(sql2);
			pstmt2.setInt(1, can.getId());
			pstmt2.executeUpdate();
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, can.getId());
			pstmt.executeUpdate();

		} catch (Exception e1) {
			throw new IllegalStateException(e1);
		} finally {
			try {
				pstmt2.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			close(conn, pstmt, rset);
		}
	}

	@Override
	public Optional<Candidate> selectOne(int id) {
		String sql = "select * from hubo_table where id = ?";

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
			pstmt.setInt(1, id);
			
			rset = pstmt.executeQuery();

			while(rset.next()) {
				Candidate can = new Candidate(rset.getInt("id"), rset.getString("name"));
				return Optional.of(can);
			}
			return Optional.empty();
		} catch (Exception e1) {
			throw new IllegalStateException(e1);
		} finally {
			close(conn, pstmt, rset);
		}
	}

	@Override
	public List<Candidate> selectAll() {
		String sql = "select * from hubo_table";

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Candidate can;

		try {
			conn = DriverManager.getConnection(
					"jdbc:mysql://192.168.23.27:3306/pollsystem", 
					"root", 
					"kopoctc");
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			List<Candidate> candidates = new ArrayList<Candidate>();
			while(rset.next()) {
				can = new Candidate(rset.getInt("id"), rset.getString("name"));
				candidates.add(can);
			}
			return candidates;
		} catch (Exception e1) {
			e1.printStackTrace();
			throw new IllegalStateException(e1);
		} finally {
			close(conn, pstmt, rset);
		}
	}
	
	public List<String> selectAllNames() {
		String sql = "select name from hubo_table";

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
			
			List<String> names = new ArrayList<String>();
			while(rset.next()) {
				names.add(rset.getString("name"));
			}
			return names;
		} catch (Exception e1) {
			e1.printStackTrace();
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
