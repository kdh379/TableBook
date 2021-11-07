package data.dto;

import java.sql.Timestamp;

public class ResDto {
	
	private String num;
	private String login_num;
	private String shop_num;
	private String res_date;
	private String shop_name;
	private String seat;
	private String persons;
	private String price;
	private Timestamp paymentdate;
	private boolean review;
	
	
	public boolean isReview() {
		return review;
	}
	public void setReview(boolean review) {
		this.review = review;
	}
	public String getSeat() {
		return seat;
	}
	public void setSeat(String seat) {
		this.seat = seat;
	}
	public String getShop_num() {
		return shop_num;
	}
	public void setShop_num(String shop_num) {
		this.shop_num = shop_num;
	}
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
	public String getRes_date() {
		return res_date;
	}
	public void setRes_date(String res_date) {
		this.res_date = res_date;
	}
	public String getPersons() {
		return persons;
	}
	public void setPersons(String persons) {
		this.persons = persons;
	}
	public Timestamp getPaymentdate() {
		return paymentdate;
	}
	public void setPaymentdate(Timestamp paymentdate) {
		this.paymentdate = paymentdate;
	}
	public String getShop_name() {
		return shop_name;
	}
	public void setShop_name(String shop_name) {
		this.shop_name = shop_name;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	
	
	
}
