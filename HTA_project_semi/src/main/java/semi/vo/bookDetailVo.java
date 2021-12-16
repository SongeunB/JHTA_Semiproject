package semi.vo;

public class bookDetailVo {

	private String id_item;
	private String text;
	int img_src;
	public bookDetailVo(String id_item, String text, int img_src) {
		super();
		this.id_item = id_item;
		this.text = text;
		this.img_src = img_src;
	}
	public String getId_item() {
		return id_item;
	}
	public void setId_item(String id_item) {
		this.id_item = id_item;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public int getImg_src() {
		return img_src;
	}
	public void setImg_src(int img_src) {
		this.img_src = img_src;
	}
}
