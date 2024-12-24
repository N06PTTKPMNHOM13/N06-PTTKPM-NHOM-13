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

public class RegisterController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet RegisterController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RegisterController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            HttpSession session = request.getSession();
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String pass = request.getParameter("pass");
            String confirmPass = request.getParameter("confirmPass");

            if (!pass.equals(confirmPass)) {
                session.setAttribute("failedMsg", "Passwords do not match!");
                response.sendRedirect("register.jsp");
                return;
            }

            User u = new User();
            u.setName(name);
            u.setEmail(email);
            u.setPhone(phone);
            u.setPassword(pass);
            u.setRole(2);

            UserDAOImpl dao = new UserDAOImpl(DBConnect.getConn());
            boolean f2 = dao.checkUser(email);
            if (f2) {
                boolean f = dao.userRegister(u);
                if (f) {
                    session.setAttribute("succMsg", "Registartion successfully!");
                    response.sendRedirect("register.jsp");
                } else {
                    session.setAttribute("failedMsg", "Something wrong on server...");
                    response.sendRedirect("register.jsp");
                }
            } else {
                session.setAttribute("failedMsg", "Email already exist.");
                response.sendRedirect("register.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
