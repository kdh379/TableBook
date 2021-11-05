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
	
	//login_num諛쏆븘�꽌 媛쒖씤 �뜲�씠�꽣�뼸湲�_1媛�
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
	
	// login_id받아서 개인 데이터얻기_1개
	public LoginDto getById(String id) {

		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		LoginDto dto = new LoginDto();
		String sql = "select * from login where id=?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) {

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

	/* �뿬湲곗꽌遺��꽣 �뿬�� �닔�젙 �떆�옉 211104 16:50 */
	
	// �븘�씠�뵒 泥댄겕_boolean(String id)
	public boolean isIdCheck(String id) {

		boolean isid = false;
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select * from login where id=?";

		try {
			pstmt = conn.prepareStatement(sql);
			// 諛붿씤�뵫
			pstmt.setString(1, id);
			// �떎�뻾
			rs = pstmt.executeQuery();

			if (rs.next()) {
				// �빐�떦 �븘�씠�뵒媛� 議댁옱�븷寃쎌슦 true
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

	// �븘�씠�뵒�뿉 �뵲瑜� nick(String id)
	public String getNick(String id) {

		String nick = "";

		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select * from login where id=?";

		try {
			pstmt = conn.prepareStatement(sql);
			// 諛붿씤�뵫
			pstmt.setString(1, id);
			// �떎�뻾
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
			// 諛붿씤�뵫
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPass());
			pstmt.setString(3, dto.getNick());
			pstmt.setString(4, dto.getEmail());
			pstmt.setString(5, dto.getHp());
			pstmt.setString(6, dto.getPhoto());
			
			// �떎�뻾
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}

	}
	
	// �쟾泥대━�뒪�듃
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
	
	// 鍮꾨�踰덊샇 泥댄겕(num,pass)
	public boolean isPassEqual(String num, String pass) {

		boolean b = false;
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select * from login where num=? and pass=?";

		try {
			pstmt = conn.prepareStatement(sql);
			// 諛붿씤�뵫
			pstmt.setString(1, num);
			pstmt.setString(2, pass);
			// �떎�뻾
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
	
	// �궘�젣
	public void deleteData(String num) {

		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;

		String sql = "delete from login where num=?";

		try {
			pstmt = conn.prepareStatement(sql);
			// 諛붿씤�뵫
			pstmt.setString(1, num);
			// �떎�뻾
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
			// 諛붿씤�뵫
			pstmt.setString(1, dto.getNick());
			pstmt.setString(2, dto.getHp());
			pstmt.setString(3, dto.getEmail());
			pstmt.setString(4, dto.getPhoto());
			pstmt.setString(5, dto.getNum());

			// �떎�뻾
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}

	}
	
	// �븘�씠�뵒�� 鍮꾨쾲泥댄겕_濡쒓렇�씤�쓣 �쐞�븳
	public boolean isIdPass(String id, String pass) {

		boolean b = false;
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select * from login where id=? and pass=?";

		try {
			pstmt = conn.prepareStatement(sql);
			// 諛붿씤�뵫
			pstmt.setString(1, id);
			pstmt.setString(2, pass);
			// �떎�뻾
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