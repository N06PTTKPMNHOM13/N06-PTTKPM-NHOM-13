package model;

import entity.Order;
import java.sql.Connection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class OrderDAO {

    private Connection conn;

    public OrderDAO(Connection conn) {
        this.conn = conn;
    }

    public boolean saveOrder(List<Order> list) {
        boolean f = false;
        try {
            String sql = "insert into [order](order_id, uId, [address], car_name, quantity, price, payment, [date]) "
                    + "values(?, ?, ?, ?, ?, ?, ?, ?)";
            conn.setAutoCommit(false);
            PreparedStatement ps = conn.prepareStatement(sql);
            for (Order b : list) {
                ps.setString(1, b.getOrderId());
                ps.setInt(2, b.getuId());
                ps.setString(3, b.getAddress());
                ps.setString(4, b.getCarName());
                ps.setInt(5, b.getQuantity());
                ps.setString(6, b.getPrice());
                ps.setString(7, b.getPayment());
                ps.setDate(8, new java.sql.Date(b.getDate().getTime()));
                ps.addBatch();
            }
            int[] cnt = ps.executeBatch();
            conn.commit();
            f = true;
            conn.setAutoCommit(true);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return f;
    }

    public List<Order> getCar(String email) {
        List<Order> list = new ArrayList<>();
        Order o = null;
        try {
            String sql= "select o.id, o.order_id, u.id, u.name, u.email, o.address, u.phone, o.car_name, o.quantity, o.price, o.payment, o.date"
                    + " from [order] o join [user] u on o.uId = u.id where u.email = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                o = new Order();
                o.setId(rs.getInt(1));
                o.setOrderId(rs.getString(2));
                o.setuId(rs.getInt(3));
                o.setUserName(rs.getString(4));
                o.setEmail(rs.getString(5));
                o.setAddress(rs.getString(6));
                o.setPhone(rs.getString(7));
                o.setCarName(rs.getString(8));
                o.setQuantity(rs.getInt(9));
                o.setPrice(rs.getString(10));
                o.setPayment(rs.getString(11));
                o.setDate(rs.getDate(12));
                list.add(o);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
    public List<Order> getAllOrders() {
        List<Order> list = new ArrayList<>();
        Order o = null;
        try {
            String sql= "select o.id, o.order_id, u.id, u.name, u.email, o.address, u.phone, o.car_name, o.quantity, o.price, o.payment, o.date"
                    + " from [order] o join [user] u on o.uId = u.id";;
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                o = new Order();
                o.setId(rs.getInt(1));
                o.setOrderId(rs.getString(2));
                o.setuId(rs.getInt(3));
                o.setUserName(rs.getString(4));
                o.setEmail(rs.getString(5));
                o.setAddress(rs.getString(6));
                o.setPhone(rs.getString(7));
                o.setCarName(rs.getString(8));
                o.setQuantity(rs.getInt(9));
                o.setPrice(rs.getString(10));
                o.setPayment(rs.getString(11));
                o.setDate(rs.getDate(12));
                list.add(o);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}
