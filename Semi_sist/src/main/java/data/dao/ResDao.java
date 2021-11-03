package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import data.dto.ResDto;
import mysql.DbConnect;

public class ResDao {
	
	DbConnect db = new DbConnect();
	
	//insert
	public void insertRes(ResDto dto) {
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		
		String sql = "insert into reservation(login_num, shop_num,shop_name, res_date, persons, price, paymentdate)"
				+ " values(null, null, ?, ?, ?, ?, now())"; //login, shop num 추가 필요
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			//바인딩
			//pstmt.setString(1, dto.getLogin_num()); //login num 수정 필요
			//pstmt.setString(2, dto.getShop_num()); //shop num 추가 필요
			pstmt.setString(1, dto.getShop_name());
			pstmt.setString(2, dto.getRes_date());
			pstmt.setString(3, dto.getPersons());
			pstmt.setString(4, dto.getPrice());
		
			pstmt.execute();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	//login num과 일치하는 Data
	
}
