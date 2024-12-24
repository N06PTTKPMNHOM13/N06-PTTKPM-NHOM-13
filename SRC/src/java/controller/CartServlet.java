package controller;

import db.DBConnect;
import entity.CarDetails;
import entity.Cart;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.CarDaoImpl;
import model.CartDAOImpl;

public class CartServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int carId = Integer.parseInt(request.getParameter("carId"));
            int uId = Integer.parseInt(request.getParameter("uId"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));

            CarDaoImpl dao = new CarDaoImpl(DBConnect.getConn());
            CarDetails car = dao.getCarById(carId);

            if (car.getQuantity() < quantity) {
                HttpSession session = request.getSession();
                session.setAttribute("error", "Selected quantity exceeds available stock");
                response.sendRedirect("view_car.jsp?carId=" + carId);
                return;
            }

            CartDAOImpl cartDao = new CartDAOImpl(DBConnect.getConn());
            Cart existingCart = cartDao.getCartByUserAndCarId(uId, carId);

            float price = Float.parseFloat(car.getPrice());
            if (car.getCarCategory().equalsIgnoreCase("Sale")) {
                price = Float.parseFloat(car.getPrice()) * 0.8f;
            }

            if (existingCart != null) {
                int newQuantity = existingCart.getQuantity() + quantity;
                if (newQuantity > car.getQuantity()) {
                    HttpSession session = request.getSession();
                    session.setAttribute("error", "Selected quantity exceeds available stock");
                    response.sendRedirect("view_car.jsp?carId=" + carId);
                    return;
                }
                float newTotalPrice = newQuantity * price;
                cartDao.updateCartQuantity(existingCart.getcId(), newQuantity, newTotalPrice);
            } else {
                Cart c = new Cart();
                c.setCarId(carId);
                c.setuId(uId);
                c.setCarName(car.getCarName());
                c.setPrice(price);
                c.setQuantity(quantity);
                c.setTotal_price(quantity * price);
                cartDao.addcart(c);
            }

            
            // Sau khi thêm vào giỏ hàng, điều hướng đến trang giỏ hàng
            HttpSession session = request.getSession();
            response.sendRedirect("checkOut.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
