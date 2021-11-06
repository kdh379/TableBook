package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;


import data.dto.ReviewDto;
import mysql.DbConnect;

public class ReviewDao {

	DbConnect db = new DbConnect();
	
	//shop_num값을 받아서 해당 음식점의 리뷰개수 얻기
	public int getTotalCount(String shop_num) {
			
		Connection conn = db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
			
		String sql="select count(*) from review where shop_num=?";
		int n=0;
			
		try {
			pstmt=conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
				
			if(rs.next()) {
				n=rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
			
		return n;
			
	}
	
	//페이지에서 필요한 만큼만 리턴하기(전체출력)_shop_num에 해당하는 음식점의 리뷰만!
		public Vector<ReviewDto> getList(int start, int perpage, String shop_num){
			
			Vector<ReviewDto> list = new Vector<ReviewDto>();
			
			Connection conn=db.getConnection();
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			
			String sql="select * from review where shop_num=? order by num desc limit ?,?";
			
			try {
				pstmt=conn.prepareStatement(sql);
				//바인딩
				pstmt.setString(1, shop_num);
				pstmt.setInt(2, start);
				pstmt.setInt(3, perpage);
				//실행
				rs=pstmt.executeQuery();
				
				while(rs.next()) {
					
					ReviewDto dto = new ReviewDto();
					
					dto.setNum(rs.getString("num"));
					dto.setShop_num(rs.getString("shop_num"));
					dto.setLogin_num(rs.getString("login_num"));
					dto.setScore(rs.getString("score"));
					dto.setContent(rs.getString("content"));
					dto.setWriter(rs.getString("writer"));
					dto.setWriteday(rs.getTimestamp("writeday"));
					
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
		
		//insert
		public void insertReview(ReviewDto dto) {
			
			Connection conn = db.getConnection();
			PreparedStatement pstmt=null;
			
			String sql="insert into review(login_num,shop_num,score,content,writer,writeday) values(?,?,?,?,?,now())";
			
			try {
				pstmt=conn.prepareStatement(sql);
				//바인딩
				pstmt.setString(1, dto.getLogin_num());
				pstmt.setString(2, dto.getShop_num());
				pstmt.setString(3, dto.getScore());
				pstmt.setString(4, dto.getContent());
				pstmt.setString(5, dto.getWriter());
				
				//실행
				pstmt.execute();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				db.dbClose(pstmt, conn);
			}
			
		}
		
		
		//delete
		public void deleteReview(String num) {
			
			Connection conn = db.getConnection();
			PreparedStatement pstmt=null;
			
			String sql="delete from review where num=?";
			
			try {
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, num);
				pstmt.execute();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				db.dbClose(pstmt, conn);
			}
			
		}
		
		//update
		public void updateReview(ReviewDto dto) {
			
			Connection conn = db.getConnection();
			PreparedStatement pstmt=null;
			
			String sql="update review set score=?,content=? where num=?";
			
			try {
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, dto.getScore());
				pstmt.setString(2, dto.getContent());
				pstmt.setString(3, dto.getNum());
				
				pstmt.execute();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				db.dbClose(pstmt, conn);
			}
			
			
		}
		
		//num값을 받아서 한개의 리뷰 데이터 가져오기
		public ReviewDto getOneReview(String num) {
			
			Connection conn=db.getConnection();
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			
			String sql="select * from review where num=?";
			ReviewDto dto = new ReviewDto();
			
			try {
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, num);
				rs=pstmt.executeQuery();
				
				if(rs.next()) {
					
					dto.setNum(rs.getString("num"));
					dto.setShop_num(rs.getString("shop_num"));
					dto.setLogin_num(rs.getString("login_num"));
					dto.setScore(rs.getString("score"));
					dto.setContent(rs.getString("content"));
					dto.setWriter(rs.getString("writer"));
					dto.setWriteday(rs.getTimestamp("writeday"));
					
				}
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			return dto;
			
		}
		
		//shop_num받아서 리뷰 score의 합얻기
		public int getSumScore(String shop_num) {
			
			int sum=0;
			Connection conn=db.getConnection();
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			
			String sql = "select score from review where shop_num=?";
			
			try {
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, shop_num);
				rs=pstmt.executeQuery();
				
				while(rs.next()) {
					sum+= rs.getInt("score");
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				db.dbClose(rs, pstmt, conn);
			}
			
			
			
			return sum;
			
		}
		
		
		
	
}