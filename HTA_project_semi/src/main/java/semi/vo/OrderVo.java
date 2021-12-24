package semi.vo;

import java.sql.Date;

public class OrderVo {
	private int order_num;
	private String id_customer;
	private String name_order;
	private String email_order;
	private String phone_order;
	private String address_order;
	private int total_price;
	private Date order_date;
	private String order_status;
	
	public OrderVo() {}

	public OrderVo(int order_num, String id_customer, String name_order, String email_order, String phone_order,
			String address_order, int total_price, Date order_date, String order_status) {
		super();
		this.order_num = order_num;
		this.id_customer = id_customer;
		this.name_order = name_order;
		this.email_order = email_order;
		this.phone_order = phone_order;
		this.address_order = address_order;
		this.total_price = total_price;
		this.order_date = order_date;
		this.order_status = order_status;
	}

	public int getOrder_num() {
		return order_num;
	}

	public void setOrder_num(int order_num) {
		this.order_num = order_num;
	}

	public String getId_customer() {
		return id_customer;
	}

	public void setId_customer(String id_customer) {
		this.id_customer = id_customer;
	}

	public String getName_order() {
		return name_order;
	}

	public void setName_order(String name_order) {
		this.name_order = name_order;
	}

	public String getEmail_order() {
		return email_order;
	}

	public void setEmail_order(String email_order) {
		this.email_order = email_order;
	}

	public String getPhone_order() {
		return phone_order;
	}

	public void setPhone_order(String phone_order) {
		this.phone_order = phone_order;
	}

	public String getAddress_order() {
		return address_order;
	}

	public void setAddress_order(String address_order) {
		this.address_order = address_order;
	}

	public int getTotal_price() {
		return total_price;
	}

	public void setTotal_price(int total_price) {
		this.total_price = total_price;
	}

	public Date getOrder_date() {
		return order_date;
	}

	public void setOrder_date(Date order_date) {
		this.order_date = order_date;
	}

	public String getOrder_status() {
		return order_status;
	}

	public void setOrder_status(String order_status) {
		this.order_status = order_status;
	}
	
}
