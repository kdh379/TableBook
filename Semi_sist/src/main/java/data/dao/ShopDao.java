package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;

import data.dto.ShopDto;
import mysql.DbConnect;

public class ShopDao {
	
	DbConnect db = new DbConnect();
	
	//insert
	public void insertShop(ShopDto dto) {
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		String sql="insert into shop(name,telephone,tag,addr,photo,parking,opening,closing,introduce) values(?,?,?,?,?,?,?,?,?)";
		
		try {
			pstmt=conn.prepareStatement(sql);
			//바인딩
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getTelephone());
			pstmt.setString(3, dto.getTag());
			pstmt.setString(4, dto.getAddr());
			pstmt.setString(5, dto.getPhoto());
			pstmt.setString(6, dto.getParking());
			pstmt.setInt(7, dto.getOpening());
			pstmt.setInt(8, dto.getClosing());
			pstmt.setString(9, dto.getIntroduce());
			//실행
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
		
		
	}
	
	//가장 최근에 추가된 데이터의num 가져오기 _ 스케줄테이블insert할때필요
	public String getRecentNum() {
		
		String num=null;
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select num from shop order by num desc";
		
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				num = rs.getString("num");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		
		return num;
		
	}
	
	//num값을 받아서 해당 dto하나만 가져오기
	public ShopDto getOneShop(String num) {
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select * from shop where num=?";
		ShopDto dto = new ShopDto();
		
		try {
			pstmt=conn.prepareStatement(sql);
			//바인딩
			pstmt.setString(1, num);
			//실행
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				
				dto.setNum(rs.getString("num"));
				dto.setName(rs.getString("name"));
				dto.setAddr(rs.getString("addr"));
				dto.setTelephone(rs.getString("telephone"));
				dto.setTag(rs.getString("tag"));
				dto.setPhoto(rs.getString("photo"));
				dto.setParking(rs.getString("parking"));
				dto.setIntroduce(rs.getString("introduce"));
				dto.setOpening(rs.getInt("opening"));
				dto.setClosing(rs.getInt("closing"));
				dto.setAvg(rs.getDouble("avg"));
				dto.setRe_cnt(rs.getInt("re_cnt"));;
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		
		return dto;
		
	}
	
			//totalcount...페이징 처리를 위해
			public int getTotalCount() {
				
				Connection conn=db.getConnection();
				PreparedStatement pstmt=null;
				ResultSet rs=null;
				
				String sql="select count(*) from shop";
				
				int n=0;
				
				try {
					pstmt=conn.prepareStatement(sql);
					rs=pstmt.executeQuery();
					
					if(rs.next())
						n=rs.getInt(1);
					
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} finally {
					db.dbClose(rs, pstmt, conn);
				}
				
				return n;
			}
			
			//페이지에서 필요한 만큼만 리턴하기(전체출력)
			public List<ShopDto> getList(int start,int perpage){
				
				List<ShopDto> list=new Vector<ShopDto>();
				
				Connection conn=db.getConnection();
				PreparedStatement pstmt=null;
				ResultSet rs=null;
						
				String sql="select * from shop order by num desc limit ?,?";
					
				try {
					pstmt=conn.prepareStatement(sql);
					
					pstmt.setInt(1, start);
					pstmt.setInt(2, perpage);
					
					rs=pstmt.executeQuery();
					
					while(rs.next()) {
						
						ShopDto dto=new ShopDto();
						
						dto.setNum(rs.getString("num"));
						dto.setName(rs.getString("name"));
						dto.setTelephone(rs.getString("telephone"));
						dto.setTag(rs.getString("tag"));
						dto.setAddr(rs.getString("addr"));
						dto.setPhoto(rs.getString("photo"));
						dto.setParking(rs.getString("parking"));
						dto.setIntroduce(rs.getString("introduce"));
						dto.setOpening(rs.getInt("opening"));
						dto.setClosing(rs.getInt("closing"));
						dto.setAvg(rs.getDouble("avg"));
						dto.setRe_cnt(rs.getInt("re_cnt"));
						
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
			
			//search에 해당하는 dao
			public Vector<ShopDto> getSearchAllData(String search){
				
				Connection conn=db.getConnection();
				PreparedStatement pstmt=null;
				ResultSet rs=null;
				
				String sql="select * from shop where name like ? or tag like ? or addr like ?";
				
				Vector<ShopDto> list=new Vector<ShopDto>();
				
				try {
					pstmt=conn.prepareStatement(sql);
					
					pstmt.setString(1, "%"+search+"%");
					pstmt.setString(2, "%"+search+"%");
					pstmt.setString(3, "%"+search+"%");
					
					rs=pstmt.executeQuery();
					
					while(rs.next()) {
						
						ShopDto dto=new ShopDto();
						
						dto.setNum(rs.getString("num"));
						dto.setName(rs.getString("name"));
						dto.setTelephone(rs.getString("telephone"));
						dto.setTag(rs.getString("tag"));
						dto.setAddr(rs.getString("addr"));
						dto.setPhoto(rs.getString("photo"));
						dto.setParking(rs.getString("parking"));
						dto.setIntroduce(rs.getString("introduce"));
						dto.setOpening(rs.getInt("opening"));
						dto.setClosing(rs.getInt("closing"));
						dto.setAvg(rs.getDouble("avg"));
						dto.setRe_cnt(rs.getInt("re_cnt"));
						
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
			
			//avg업데이트
			public void updateAvg(String num, double avg) {
				
				Connection conn=db.getConnection();
				PreparedStatement pstmt=null;
				
				String sql = "update shop set avg=? where num=?";
				
				try {
					pstmt=conn.prepareStatement(sql);
					pstmt.setDouble(1, avg);
					pstmt.setString(2, num);
					
					pstmt.execute();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} finally {
					db.dbClose(pstmt, conn);
				}
				
			}
			
			//평점 순서로 데이터 가져오기
			public Vector<ShopDto> getAllShopOrderByAvg(){
				
				Vector<ShopDto> list = new Vector<ShopDto>();
				Connection conn=db.getConnection();
				PreparedStatement pstmt=null;
				ResultSet rs=null;
				
				String sql="select * from shop order by avg desc";
				
				try {
					pstmt=conn.prepareStatement(sql);
					rs=pstmt.executeQuery();
					
					while(rs.next()) {
						
						ShopDto dto = new ShopDto();
						
						dto.setNum(rs.getString("num"));
						dto.setName(rs.getString("name"));
						dto.setTelephone(rs.getString("telephone"));
						dto.setTag(rs.getString("tag"));
						dto.setAddr(rs.getString("addr"));
						dto.setPhoto(rs.getString("photo"));
						dto.setParking(rs.getString("parking"));
						dto.setIntroduce(rs.getString("introduce"));
						dto.setOpening(rs.getInt("opening"));
						dto.setClosing(rs.getInt("closing"));
						dto.setAvg(rs.getDouble("avg"));
						dto.setRe_cnt(rs.getInt("re_cnt"));
						
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
			
			//Re_cnt update
			public void updateRe_cnt(int re_cnt, String num) {
				
				Connection conn=db.getConnection();
				PreparedStatement pstmt=null;
				
				String sql = "update shop set re_cnt=? where num=?";
				
				try {
					pstmt=conn.prepareStatement(sql);
					pstmt.setInt(1, re_cnt);
					pstmt.setString(2, num);
					
					pstmt.execute();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} finally {
					db.dbClose(pstmt, conn);
				}
				
			}
			
			//re_cnt순서로 data가져오기
			public Vector<ShopDto> getAllShopOrderByRe_cnt(){
				
				Vector<ShopDto> list = new Vector<ShopDto>();
				Connection conn=db.getConnection();
				PreparedStatement pstmt=null;
				ResultSet rs=null;
				
				String sql="select * from shop order by re_cnt desc";
				
				try {
					pstmt=conn.prepareStatement(sql);
					rs=pstmt.executeQuery();
					
					while(rs.next()) {
						
						ShopDto dto = new ShopDto();
						
						dto.setNum(rs.getString("num"));
						dto.setName(rs.getString("name"));
						dto.setTelephone(rs.getString("telephone"));
						dto.setTag(rs.getString("tag"));
						dto.setAddr(rs.getString("addr"));
						dto.setPhoto(rs.getString("photo"));
						dto.setParking(rs.getString("parking"));
						dto.setIntroduce(rs.getString("introduce"));
						dto.setOpening(rs.getInt("opening"));
						dto.setClosing(rs.getInt("closing"));
						dto.setAvg(rs.getDouble("avg"));
						dto.setRe_cnt(rs.getInt("re_cnt"));
						
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