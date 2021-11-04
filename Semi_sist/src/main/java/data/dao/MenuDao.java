package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

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
	
	//shop_num 받아서 해당 음식점(1개) 메뉴,가격받기
		public Vector<MenuDto> getMenu(String shop_num) {
			
			Vector<MenuDto> list = new Vector<MenuDto>();
			
			Connection conn=db.getConnection();
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			
			String sql="select * from menu where shop_num=?";
			
			try {
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, shop_num);
				rs=pstmt.executeQuery();
				
				while(rs.next()) {
					
					MenuDto dto = new MenuDto();
					dto.setNum(rs.getString("num"));
					dto.setShop_num(rs.getString("shop_num"));
					dto.setMenu(rs.getString("menu"));
					dto.setPrice(rs.getInt("price"));
					
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

}
