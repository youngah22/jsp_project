package dao;

import java.util.ArrayList;


import dto.Product;

public class ProductRepository {
	private ArrayList<Product> listOfProducts;
	private static ProductRepository instance = new ProductRepository();
//	private static ProductRepository intstance;

	// 상품 데이터 접근 클래스 만들기 신규 상품 데이터를 저장하는 메소드
	public static ProductRepository getInstance() {
		return instance;
	}

	// 자바빈즈로 사용할 상품 데이터 접근 클래스 만들기
	public ProductRepository() {

		listOfProducts = new ArrayList<Product>();

		Product sh1 = new Product("FD0884-025", "(W) Nike Zoom Vomero 5 Photon Dust and Metallic Silver", 189000);
		sh1.setColor("Photon Dust/Metallic Silver");
		sh1.setManufacturer("Nike");
		//sh1.setUnitsInStock(100);
		sh1.setReleaseDate("2023-02-28");
		sh1.setImage("FD0884-025.png");

		Product sh2 = new Product("MR993", "New Balance 993 Made in USA Grey", 259000);
		sh2.setColor("Grey/White");
		sh2.setManufacturer("New Balance");
		//sh2.setUnitsInStock(10);
		sh2.setReleaseDate("2018-08-21");
		sh2.setImage("MR993GL.png");
		
		Product sh3 = new Product("B75806", "Adidas Samba OG Cloud White", 139000);
		sh3.setColor("Cloud White/Core");
		sh3.setManufacturer("Adidas");
		//sh3.setUnitsInStock(59);
		sh3.setReleaseDate("2018-01-01");
		sh3.setImage("B75806.png");

		listOfProducts.add(sh1);
		listOfProducts.add(sh2);
		listOfProducts.add(sh3);
	}

	public void addProduct(Product product) {
		listOfProducts.add(product);
	}

	// 상품 목록을 가져오는 메소드 만들기
	public ArrayList<Product> getAllProducts() {
		return listOfProducts;
	}

	// 상품 데이터 접근 클래스
	// 상품 상세 정보를 가져오기
	public Product getProductById(String productId) {
		Product productById = null;

		for (int i = 0; i < listOfProducts.size(); i++) {
			Product product = listOfProducts.get(i);
			if (product != null && product.getProductId() != null && product.getProductId().equals(productId)) {
				productById = product;
				break;
			}
		}
		return productById;
	}
}
