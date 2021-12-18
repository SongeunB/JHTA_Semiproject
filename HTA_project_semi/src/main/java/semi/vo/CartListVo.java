package semi.vo;

public class CartListVo {
	private String id_cart;
	private String id_customer;
	private String id_item;
	private int item_count;
	private int price;
	private String title;
	private int stock;
	public CartListVo(String id_cart, String id_customer, String id_item, int item_count, int price, String title,
			int stock) {
		super();
		this.id_cart = id_cart;
		this.id_customer = id_customer;
		this.id_item = id_item;
		this.item_count = item_count;
		this.price = price;
		this.title = title;
		this.stock = stock;
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
	public String getId_item() {
		return id_item;
	}
	public void setId_item(String id_item) {
		this.id_item = id_item;
	}
	public int getItem_count() {
		return item_count;
	}
	public void setItem_count(int item_count) {
		this.item_count = item_count;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	
	
}
