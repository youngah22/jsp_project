package dto;

import java.io.Serializable;


//상품 클래스 생성
public class Product implements Serializable {
	private static final long serialVersionUID = -4274700572038677000L;
	// 멤버 변수 선언하기
	private String productId; // 모델 번호
	private String pname; // 상품명 
	private Integer unitPrice; // 상품 가격
	private String color; // 상품 색상 
	private String manufacturer; // 제조사
	//private String category; // 분류
	//private long unitsInStock; // 재고 수
	private String releaseDate; // 출시일
//	private String filename; // 이미지 파일명
	private String image; // 이미지 파일명
	private int quantity; //장바구니에 담은 개수
	
	
	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	
	

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public Product() {
		super();
	}
	
	public Product(String productId, String pname, Integer unitPrice) {
		this.productId = productId;
		this.pname = pname;
		this.unitPrice = unitPrice;
	}

	public String getProductId() {
		return productId;
	}

	public void setProductId(String productId) {
		this.productId = productId;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public Integer getUnitPrice() {
		return unitPrice;
	}

	public void setUnitPrice(Integer unitPrice) {
		this.unitPrice = unitPrice;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public String getManufacturer() {
		return manufacturer;
	}

	public void setManufacturer(String manufacturer) {
		this.manufacturer = manufacturer;
	}

	public String getReleaseDate() {
		return releaseDate;
	}

	public void setReleaseDate(String releaseDate) {
		this.releaseDate = releaseDate;
	}
	
}
