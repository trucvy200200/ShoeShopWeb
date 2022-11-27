package com.ShoeShopProject.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.ShoeShopProject.model.OrdersModel;


public class OrdersMapper implements  RowMapper<OrdersModel> {

	@Override
	public OrdersModel mapRow(ResultSet rs) {
		try {
		    OrdersModel order = new OrdersModel();
		    order.setQty(rs.getInt("qty"));
		    order.setOrderId(rs.getInt("id"));
			order.setProductId(rs.getInt("product_id"));
			order.setStatus(rs.getInt("status"));
			return order;
			}
			catch (SQLException e)
			{
				return null;
			}
	}
	
}
