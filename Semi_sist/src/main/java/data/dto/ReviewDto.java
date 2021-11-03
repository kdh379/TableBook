package data.dto;

import java.sql.Timestamp;

public class ReviewDto {
	
	private String num;
	private String login_num;
	private String shop_num;
	private String score;
	private String content;
	private String writer;
	private String photo;
	private Timestamp writeday;
	
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}
	public String getLogin_num() {
		return login_num;
	}
	public void setLogin_num(String login_num) {
		this.login_num = login_num;
	}
	public String getShop_num() {
		return shop_num;
	}
	public void setShop_num(String shop_num) {
		this.shop_num = shop_num;
	}
	public String getScore() {
		return score;
	}
	public void setScore(String score) {
		this.score = score;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public Timestamp getWriteday() {
		return writeday;
	}
	public void setWriteday(Timestamp writeday) {
		this.writeday = writeday;
	}
	
	

}
