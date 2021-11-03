package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import data.dto.MenuDto;
import mysql.DbConnect;

public class MenuDao {
	
	DbConnect db = new DbConnect();
	
	//insert
	public void insertMenu(MenuDto dto) {
		
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		
		String sql="insert into menu(shop_num,menu,price) values(?,?,?)";
		
		try {
			pstmt=conn.prepareStatement(sql);
			//바인딩
			pstmt.setString(1, dto.getShop_num());
			pstmt.setString(2, dto.getMenu());
			pstmt.setInt(3, dto.getPrice());
			//실행
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
		
	}

}
