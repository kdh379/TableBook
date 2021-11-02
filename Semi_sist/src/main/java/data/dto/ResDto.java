package data.dto;

import java.sql.Timestamp;

public class ResDto {
	
	private String num;
	private String login_num;
	private String res_date;
	private String persons;
	private int price;
	private Timestamp paymentdate;
	
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
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public Timestamp getPaymentdate() {
		return paymentdate;
	}
	public void setPaymentdate(Timestamp paymentdate) {
		this.paymentdate = paymentdate;
	}
	
	
	
}
