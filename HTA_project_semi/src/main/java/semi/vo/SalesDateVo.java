package semi.vo;

import java.sql.Date;

public class SalesDateVo {
	private Date order_date;
	private String id_item;
	private String title;
	private int item_price;
	private int item_count;
	private int total_price;
	
	
	public SalesDateVo(Date order_date, String id_item, String title, int item_price, int item_count, int total_price) {
		super();
		this.order_date = order_date;
		this.id_item = id_item;
		this.title = title;
		this.item_price = item_price;
		this.item_count = item_count;
		this.total_price = total_price;
	}
	
	public Date getOrder_date() {
		return order_date;
	}

	public void setOrder_date(Date order_date) {
		this.order_date = order_date;
	}

	public String getId_item() {
		return id_item;
	}

	public void setId_item(String id_item) {
		this.id_item = id_item;
	}
	
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
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

	public int getTotal_price() {
		return total_price;
	}

	public void setTotal_price(int total_price) {
		this.total_price = total_price;
	}
	
	
	
}
