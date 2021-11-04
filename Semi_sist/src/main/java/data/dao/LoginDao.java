package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import data.dto.LoginDto;
import mysql.DbConnect;

public class LoginDao {
	
	DbConnect db = new DbConnect();
	
	//login_num받아서 개인 데이터얻기_1개
	public LoginDto getOneData(String num) {
		
		Connection conn = db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		LoginDto dto = new LoginDto();
		String sql="select * from login where num=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, num);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				
				dto.setNum(rs.getString("num"));
				dto.setId(rs.getString("id"));
				dto.setPass(rs.getString("pass"));
				dto.setNick(rs.getString("nick"));
				dto.setEmail(rs.getString("email"));
				dto.setHp(rs.getString("hp"));
				dto.setPhoto(rs.getString("photo"));
				dto.setGaipday(rs.getTimestamp("gaipday"));
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		
		
		return dto;
		
	}
	
	/* 여기서부터 여은 수정 시작 211104 16:50 */
	
	// 아이디 체크_boolean(String id)
	public boolean isIdCheck(String id) {

		boolean isid = false;
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select * from login where id=?";

		try {
			pstmt = conn.prepareStatement(sql);
			// 바인딩
			pstmt.setString(1, id);
			// 실행
			rs = pstmt.executeQuery();

			if (rs.next()) {
				// 해당 아이디가 존재할경우 true
				isid = true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}

		return isid;

	}

	// 아이디에 따른 nick(String id)
	public String getNick(String id) {

		String nick = "";

		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select * from login where id=?";

		try {
			pstmt = conn.prepareStatement(sql);
			// 바인딩
			pstmt.setString(1, id);
			// 실행
			rs = pstmt.executeQuery();

			if (rs.next()) {
				nick = rs.getString("nick");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}

		return nick;

	}
	
	// insert
	public void insertData(LoginDto dto) {

		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;

		String sql = "insert into login values(null,?,?,?,?,?,?,now())";

		try {
			pstmt = conn.prepareStatement(sql);
			// 바인딩
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPass());
			pstmt.setString(3, dto.getNick());
			pstmt.setString(4, dto.getEmail());
			pstmt.setString(5, dto.getHp());
			pstmt.setString(6, dto.getPhoto());
			
			// 실행
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}

	}
	
	// 전체리스트
	public Vector<LoginDto> getAllDatas() {

		Vector<LoginDto> list = new Vector<LoginDto>();
		String sql = "select * from login order by num desc";

		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {

				LoginDto dto = new LoginDto();

				dto.setNum(rs.getString("num"));
				dto.setId(rs.getString("id"));
				dto.setNick(rs.getString("nick"));
				dto.setPass(rs.getString("pass"));
				dto.setHp(rs.getString("hp"));
				dto.setEmail(rs.getString("email"));
				dto.setPhoto(rs.getString("photo"));
				dto.setGaipday(rs.getTimestamp("gaipday"));

				list.add(dto);

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}

		return list;

	}
	
	// 비밀번호 체크(num,pass)
	public boolean isPassEqual(String num, String pass) {

		boolean b = false;
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select * from login where num=? and pass=?";

		try {
			pstmt = conn.prepareStatement(sql);
			// 바인딩
			pstmt.setString(1, num);
			pstmt.setString(2, pass);
			// 실행
			rs = pstmt.executeQuery();

			if (rs.next()) {
				b = true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		return b;

	}
	
	// 삭제
	public void deleteData(String num) {

		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;

		String sql = "delete from login where num=?";

		try {
			pstmt = conn.prepareStatement(sql);
			// 바인딩
			pstmt.setString(1, num);
			// 실행
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}

	}
	
	// update
	public void updateData(LoginDto dto) {

		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;

		String sql = "update login set nick=?,hp=?,email=?,photo=? where num=?";

		try {
			pstmt = conn.prepareStatement(sql);
			// 바인딩
			pstmt.setString(1, dto.getNick());
			pstmt.setString(2, dto.getHp());
			pstmt.setString(3, dto.getEmail());
			pstmt.setString(4, dto.getPhoto());
			pstmt.setString(5, dto.getNum());

			// 실행
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}

	}
	
	// 아이디와 비번체크_로그인을 위한
	public boolean isIdPass(String id, String pass) {

		boolean b = false;
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select * from login where id=? and pass=?";

		try {
			pstmt = conn.prepareStatement(sql);
			// 바인딩
			pstmt.setString(1, id);
			pstmt.setString(2, pass);
			// 실행
			rs = pstmt.executeQuery();

			if (rs.next()) {
				b = true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}

		return b;

	}
	
	
}
