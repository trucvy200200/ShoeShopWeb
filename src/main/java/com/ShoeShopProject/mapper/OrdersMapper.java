package com.ShoeShopProject.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.ShoeShopProject.model.OrdersModel;
import com.ShoeShopProject.model.ProductModel;


public class OrdersMapper implements  RowMapper<OrdersModel> {

	@Override
	public OrdersModel mapRow(ResultSet rs) {
		try {
		    OrdersModel order = new OrdersModel();
		    order.setQty(rs.getInt("a.qty"));
		    order.setOrderId(rs.getInt("a.id"));
			order.setProductId(rs.getInt("a.product_id"));
			order.setProductName(rs.getString("c.name"));
			order.setSize(rs.getInt("b.size"));
			order.setPrice(rs.getInt("c.price"));
			order.setProductsId(rs.getInt("b.idProducts"));
			order.setProductImage(rs.getString("image_pd"));
			return order;
			}
			catch (SQLException e)
			{
				return null;
			}
	}
}
