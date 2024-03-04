<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dto.Product" %>
<%@ page import="dao.ProductRepository" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>장바구니 등록</title>
</head>
<body>
<%@ include file="dbconn.jsp" %>
    <%
    String id = request.getParameter("id");

    if (id == null || id.trim().equals("")) {
        response.sendRedirect("main.jsp");
        return;
    }

    PreparedStatement pstmt = null;
    ResultSet rs = null;
    String sql = "SELECT MI.p_id, MI.p_image, P1.p_name, P1.p_color, P1.p_unitprice, " +
                 "P1.p_manufacturer, P1.p_releasedate " +
                 "FROM model_image MI " +
                 "INNER JOIN product1 P1 ON MI.p_id = P1.p_id AND P1.p_color = MI.p_color " +
                 "WHERE P1.p_id=?";

    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, id);
    rs = pstmt.executeQuery();

    Product product = null;
    if (rs.next()) {
        product = new Product();
        product.setProductId(rs.getString("p_id"));
        product.setPname(rs.getString("p_name"));
        product.setUnitPrice(rs.getInt("p_unitprice"));
        product.setColor(rs.getString("p_color"));
        product.setManufacturer(rs.getString("p_manufacturer"));
        product.setReleaseDate(rs.getString("p_releasedate"));
    }

    if (product == null) {
        response.sendRedirect("exceptionNoProductId.jsp");
    }

    ArrayList<Product> goodsList = new ArrayList<Product>();

    String goodsSql = "SELECT MI.p_id, MI.p_image, P1.p_name, P1.p_color, P1.p_unitprice, " +
                      "P1.p_manufacturer, P1.p_releasedate " +
                      "FROM model_image MI " +
                      "INNER JOIN product1 P1 ON MI.p_id = P1.p_id AND P1.p_color = MI.p_color";

    pstmt = conn.prepareStatement(goodsSql);
    rs = pstmt.executeQuery();
    while (rs.next()) {
        Product p1 = new Product();
        p1.setProductId(rs.getString("p_id"));
        p1.setPname(rs.getString("p_name"));
        p1.setUnitPrice(rs.getInt("p_unitprice"));
        p1.setColor(rs.getString("p_color"));
        p1.setManufacturer(rs.getString("p_manufacturer"));
        p1.setReleaseDate(rs.getString("p_releasedate"));
        
        goodsList.add(p1);
    }

    Product goods = null;

    for (int i = 0; i < goodsList.size(); i++) {
        goods = goodsList.get(i);
        if (goods.getProductId().equals(id)) {
            break;
        }
    }

    ArrayList<Product> list = (ArrayList<Product>) session.getAttribute("cartlist");
    if (list == null) {
        list = new ArrayList<Product>();
        session.setAttribute("cartlist", list);
    }

    int cnt = 0;
    Product goodsQnt = null;
    for (int i = 0; i < list.size(); i++) {
        goodsQnt = list.get(i);
        if (goodsQnt.getProductId().equals(id)) {
            cnt++;
            int orderQuantity = goodsQnt.getQuantity() + 1;
            goodsQnt.setQuantity(orderQuantity);
        }
    }

    if (cnt == 0) {
        goods.setQuantity(1);
        list.add(goods);
    }

    response.sendRedirect("product1.jsp?id=" + id);
    %>
</body>
</html>
