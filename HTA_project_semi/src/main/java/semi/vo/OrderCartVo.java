package semi.vo;

public class OrderCartVo {
	private String id_item;
	private String title;
	private int price;
	private int item_count;
	private String id_cart;
	private String id_customer;
	
	public OrderCartVo() {}
	
	public OrderCartVo(String id_item, String title, int price, int item_count, String id_cart,String id_customer) {
		super();
		this.id_item = id_item;
		this.title = title;
		this.price = price;
		this.item_count = item_count;
		this.id_cart = id_cart;
		this.id_customer = id_customer;
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

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getItem_count() {
		return item_count;
	}

	public void setItem_count(int item_count) {
		this.item_count = item_count;
	}

	public String getId_cart() {
		return id_cart;
	}

	public void setId_cart(String id_cart) {
		this.id_cart = id_cart;
	}

	public String getId_customer() {
		return id_customer;
	}

	public void setId_customer(String id_customer) {
		this.id_customer = id_customer;
	}
	
	
}
