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
			pstmt.setString(1, dto.getNick());
			pstmt.setString(2, dto.getId());
			pstmt.setString(3, dto.getPass());
			pstmt.setString(4, dto.getHp());
			pstmt.setString(5, dto.getEmail());
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
	
	
}
