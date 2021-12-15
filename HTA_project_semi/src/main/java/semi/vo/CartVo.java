package semi.vo;

public class CartVo {
	private String id_cart;
	private String id_customer;
	private String id_item;
	private int item_count;
	
	public CartVo(String id_cart, String id_customer, String id_item, int item_count) {
		super();
		this.id_cart = id_cart;
		this.id_customer = id_customer;
		this.id_item = id_item;
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
	
	
}
