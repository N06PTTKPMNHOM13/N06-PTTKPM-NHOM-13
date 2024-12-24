package controller;

import db.DBConnect;
import entity.CarDetails;
import entity.Cart;
import entity.Order;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;
import model.CarDaoImpl;
import model.CartDAOImpl;
import model.OrderDAO;

public class OrderServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            String name = request.getParameter("userName");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String address = request.getParameter("address");
            String payment = request.getParameter("payment");

            HttpSession session = request.getSession();
            CartDAOImpl dao = new CartDAOImpl(DBConnect.getConn());
            CarDaoImpl carDao = new CarDaoImpl(DBConnect.getConn());
            List<Cart> list = dao.getCarByUser(id);
            // Kiểm tra nếu giỏ hàng trống
            if (list.isEmpty()) {
                session.setAttribute("failedMsg", "Please add item");
                response.sendRedirect("checkOut.jsp");
            } else {
                OrderDAO dao2 = new OrderDAO(DBConnect.getConn());
                Order o = null;
                ArrayList<Order> orders = new ArrayList<>();
                Random rand = new Random();
                String orderId = "ORD-" + rand.nextInt(1000);
                Date currentDate = new Date();
                for (Cart c : list) {
                    CarDetails car = carDao.getCarById(c.getCarId());
                    float p = Float.parseFloat(car.getPrice());
                    // Áp dụng giảm giá 
                    if (car.getCarCategory().equalsIgnoreCase("Sale")) {
                        p *= 0.8f;
                    }

                    o = new Order();
                    o.setOrderId(orderId);
                    o.setuId(id);
                    o.setAddress(address);
                    o.setCarName(c.getCarName());
                    o.setQuantity(c.getQuantity());
                    o.setPrice(p * c.getQuantity() + "");
                    o.setPayment(payment);
                    o.setDate(currentDate);
                    orders.add(o);

                    // Update product quantity and year
                    int newQuantity = car.getQuantity() - c.getQuantity();
                    carDao.updateCarQuantity(car.getCarId(), newQuantity);

                    if (newQuantity <= 0) {
                        String newYear = "newYear"; // Có thể thay đổi giá trị này thành năm thực tế hoặc giá trị đặc biệt
                        carDao.updateCarYear(car.getCarId(), newYear);
                    }

                }
                // Kiểm tra nếu người dùng chưa chọn phương thức thanh toán
                if ("none".equals(payment)) {
                    session.setAttribute("failedMsg", "Please choose payment method");
                    response.sendRedirect("checkOut.jsp");
                } else {
                    boolean f = dao2.saveOrder(orders);
                    if (f) {
                        dao.deleteCartByUserId(id);
                        response.sendRedirect("order_success.jsp");
                    } else {
                        session.setAttribute("failedMsg", "Something wrong on server...");
                        response.sendRedirect("checkOut.jsp");
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
