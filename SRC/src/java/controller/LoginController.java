package controller;

import db.DBConnect;
import entity.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.UserDAOImpl;

public class LoginController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String email = request.getParameter("email");
            String password = request.getParameter("password");

            HttpSession session = request.getSession();
            UserDAOImpl dao = new UserDAOImpl(DBConnect.getConn());
            User u = dao.login(email, password);
            // Kiểm tra xem đăng nhập thành công hay không
            if (u != null) {
                if (u.getRole() == 1) {
                    //admin
                    session.setAttribute("userObj", u);
                    response.sendRedirect("admin/home.jsp");
                } else {
                    //user
                    session.setAttribute("userObj", u);
                    response.sendRedirect("index.jsp");
                }
            } else {
                session.setAttribute("failedMsg", "Email or Password invalid!");
                response.sendRedirect("login.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
