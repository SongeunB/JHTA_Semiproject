package semi.vo;

public class BannerVo {
	private String id_item;
	private String sentence;
	private String left_color;
	private String right_color;
	private String font_color;
	
	private String title;
	private String author;
	
	public BannerVo() {}
	public BannerVo(String id_item, String sentence, String left_color, String right_color, String font_color) {
		super();
		this.id_item = id_item;
		this.sentence = sentence;
		this.left_color = left_color;
		this.right_color = right_color;
		this.font_color = font_color;
	}
	
	public BannerVo(String id_item, String sentence, String left_color, String right_color, String font_color,
			String title, String author) {
		super();
		this.id_item = id_item;
		this.sentence = sentence;
		this.left_color = left_color;
		this.right_color = right_color;
		this.font_color = font_color;
		this.title = title;
		this.author = author;
	}
	public String getId_item() {
		return id_item;
	}
	public void setId_item(String id_item) {
		this.id_item = id_item;
	}
	public String getSentence() {
		return sentence;
	}
	public void setSentence(String sentence) {
		this.sentence = sentence;
	}
	public String getLeft_color() {
		return left_color;
	}
	public void setLeft_color(String left_color) {
		this.left_color = left_color;
	}
	public String getRight_color() {
		return right_color;
	}
	public void setRight_color(String right_color) {
		this.right_color = right_color;
	}
	public String getFont_color() {
		return font_color;
	}
	public void setFont_color(String font_color) {
		this.font_color = font_color;
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
