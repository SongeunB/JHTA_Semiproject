package semi.vo;

public class OrderDetailVo {
	private String order_detail;
	private String order_num;
	private String id_item;
	private int item_price;
	private int item_count;
	
	private String title;
	private String author;
	
	public OrderDetailVo() {}
	public OrderDetailVo(String order_detail, String order_num, String id_item, int item_price, int item_count) {
		super();
		this.order_detail = order_detail;
		this.order_num = order_num;
		this.id_item = id_item;
		this.item_price = item_price;
		this.item_count = item_count;
	}
	public OrderDetailVo(String order_detail, String order_num, String id_item, int item_price, int item_count,
			String title, String author) {
		super();
		this.order_detail = order_detail;
		this.order_num = order_num;
		this.id_item = id_item;
		this.item_price = item_price;
		this.item_count = item_count;
		this.title = title;
		this.author = author;
	}

	public String getOrder_detail() {
		return order_detail;
	}

	public void setOrder_detail(String order_detail) {
		this.order_detail = order_detail;
	}

	public String getOrder_num() {
		return order_num;
	}

	public void setOrder_num(String order_num) {
		this.order_num = order_num;
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
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
}
