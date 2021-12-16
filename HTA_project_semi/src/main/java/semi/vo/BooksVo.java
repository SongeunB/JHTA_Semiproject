package semi.vo;

import java.sql.Date;

public class BooksVo {
	private String id_item;
	private int price;
	private String status;
	private int stock;
	private String title;
	private String author;
	private String translator;
	private String publisher;
	private Date ymd;
	private String genre;
	private String genre_detail;
	private String org_title;
	private String org_author;
	
	public BooksVo() {}

	public BooksVo(String id_item, int price, String status, int stock, String title, String author, String translator,
			String publisher, Date ymd, String genre, String genre_detail, String org_title, String org_author) {
		super();
		this.id_item = id_item;
		this.price = price;
		this.status = status;
		this.stock = stock;
		this.title = title;
		this.author = author;
		this.translator = translator;
		this.publisher = publisher;
		this.ymd = ymd;
		this.genre = genre;
		this.genre_detail = genre_detail;
		this.org_title = org_title;
		this.org_author = org_author;
	}

	public String getId_item() {
		return id_item;
	}

	public void setId_item(String id_item) {
		this.id_item = id_item;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getStock() {
		return stock;
	}

	public void setStock(int stock) {
		this.stock = stock;
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

	public String getTranslator() {
		return translator;
	}

	public void setTranslator(String translator) {
		this.translator = translator;
	}

	public String getPublisher() {
		return publisher;
	}

	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}

	public Date getYmd() {
		return ymd;
	}

	public void setYmd(Date ymd) {
		this.ymd = ymd;
	}

	public String getGenre() {
		return genre;
	}

	public void setGenre(String genre) {
		this.genre = genre;
	}

	public String getGenre_detail() {
		return genre_detail;
	}

	public void setGenre_detail(String genre_detail) {
		this.genre_detail = genre_detail;
	}

	public String getOrg_title() {
		return org_title;
	}

	public void setOrg_title(String org_title) {
		this.org_title = org_title;
	}

	public String getOrg_author() {
		return org_author;
	}

	public void setOrg_author(String org_author) {
		this.org_author = org_author;
	}
}
