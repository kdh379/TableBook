package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

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
	
	public void updateSdate() {
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt = null;
		
		LocalDate yesterday = LocalDate.now().minusDays(1);
		LocalDate fourdays = LocalDate.now().plusDays(4);
		String sql="update schedule set sdatw=? where sdate=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, yesterday.format(DateTimeFormatter.ofPattern("yyyy-MM-dd")));
			pstmt.setString(2, fourdays.format(DateTimeFormatter.ofPattern("yyyy-MM-dd")));
			
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
		
	}

}
