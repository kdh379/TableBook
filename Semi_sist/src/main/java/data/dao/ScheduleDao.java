package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Vector;

import data.dto.MenuDto;
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
			//諛붿씤�뵫
			pstmt.setString(1, dto.getShop_num());
			pstmt.setInt(2, dto.getStime());
			pstmt.setInt(3, dto.getRoom());
			pstmt.setInt(4, dto.getHall());
			pstmt.setString(5, dto.getSdate());
			//�떎�뻾
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
		String sql="update schedule set sdate=?,hall_cnt=0, room_cnt=0 where sdate=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, fourdays.format(DateTimeFormatter.ofPattern("yyyy-MM-dd")));
			pstmt.setString(2, yesterday.format(DateTimeFormatter.ofPattern("yyyy-MM-dd")));
			
			
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
		
	}
	
	//가게 번호에 맞는 스케쥴 불러오기
	public List<ScheduleDto> getSchedulData(String shop_num){
		
		List<ScheduleDto> list = new Vector<ScheduleDto>();
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from schedule where shop_num = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, shop_num);
			rs = pstmt.executeQuery();
			
			
			while(rs.next()) {
				ScheduleDto dto = new ScheduleDto();
				
				dto.setNum(rs.getString("num"));
				dto.setShop_num(rs.getString("shop_num"));
				dto.setStime(rs.getInt("stime"));
				dto.setRoom(rs.getInt("room"));
				dto.setHall(rs.getInt("hall"));
				dto.setRoom_cnt(rs.getInt("room_cnt"));
				dto.setHall_cnt(rs.getInt("hall_cnt"));
				dto.setSdate(rs.getString("sdate"));
				
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
	
	//room_cnt 증가
	public void updateRoom(String sdate, String shop_num, String stime) {
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		
		String sql = "update schedule set room_cnt = room_cnt+1 where sdate=? and shop_num=? and stime=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, sdate);
			pstmt.setString(2, shop_num);
			pstmt.setString(3, stime);
			
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	// room_cnt 증가
	public void updateHall(String sdate, String shop_num, String stime) {
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;

		String sql = "update schedule set hall_cnt = hall_cnt+1 where sdate=? and shop_num=? and stime=?";

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, sdate);
			pstmt.setString(2, shop_num);
			pstmt.setString(3, stime);

			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
	}
}