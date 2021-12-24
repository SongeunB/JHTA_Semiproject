package semi.vo;

import java.sql.Date;

public class OrderHistoryVo {
	
	private int order_num;
	private int total_price;
	private Date order_date;
	private String order_status;
	private String id_item;
	private int item_price;
	private int item_count;
	private String id_customer;
	private String title;
	
	public OrderHistoryVo() {}

	public OrderHistoryVo(int order_num, int total_price, Date order_date, String order_status, String id_item,
			int item_price, int item_count, String id_customer,String title) {
		super();
		this.order_num = order_num;
		this.total_price = total_price;
		this.order_date = order_date;
		this.order_status = order_status;
		this.id_item = id_item;
		this.item_price = item_price;
		this.item_count = item_count;
		this.id_customer = id_customer;
		this.title = title;
	}

	public int getOrder_num() {
		return order_num;
	}

	public void setOrder_num(int order_num) {
		this.order_num = order_num;
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

	public String getId_item() {
		return id_item;
	}

	public void setId_item(String id_item) {
		this.id_item = id_item;
	}

	public int getItem_price() {
		return item_price;
	}

	public void setItem_price(int item_price) {
		this.item_price = item_price;
	}

	public int getItem_count() {
		return item_count;
	}

	public void setItem_count(int item_count) {
		this.item_count = item_count;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getId_customer() {
		return id_customer;
	}

	public void setId_customer(String id_customer) {
		this.id_customer = id_customer;
	}

	
	
}
