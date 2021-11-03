package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import data.dto.ScheduleDto;
import mysql.DbConnect;

public class ScheduleDao {
	
	DbConnect db = new DbConnect();
	
	//insert
	public void insertSchedule(ScheduleDto dto) {
			
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
			
		String sql="insert into schedule(shop_num,stime,room,hall,sdate) values(?,?,?,?,?)";
			
		try {
			pstmt=conn.prepareStatement(sql);
			//바인딩
			pstmt.setString(1, dto.getShop_num());
			pstmt.setInt(2, dto.getStime());
			pstmt.setInt(3, dto.getRoom());
			pstmt.setInt(4, dto.getHall());
			pstmt.setString(5, dto.getSdate());
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
