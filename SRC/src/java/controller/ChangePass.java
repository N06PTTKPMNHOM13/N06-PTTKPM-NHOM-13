
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

public class ChangePass extends HttpServlet {
   
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        try {
            HttpSession session = request.getSession();
            int id = Integer.parseInt(request.getParameter("id"));
            String oldPass = request.getParameter("oldPass");
            String newPass = request.getParameter("newPass");
            String confirmPass = request.getParameter("confirmPass");
            // Kiểm tra xem mật khẩu mới và xác nhận mật khẩu có khớp nhau không
            if (!newPass.equals(confirmPass)) {
                session.setAttribute("failedMsg", "Passwords do not match!");
                response.sendRedirect("register.jsp");
                return;
            }
            
            User u = new User();
            u.setId(id);
            u.setPassword(newPass);
            
            UserDAOImpl dao = new UserDAOImpl(DBConnect.getConn());
            boolean f = dao.checkPassword(id, oldPass);
            if (f) {
                boolean f2 = dao.changePass(u);
                if (f2) {
                    User updatedUser = dao.getUserById(id);
                    session.setAttribute("userObj", updatedUser);
                    session.setAttribute("succMsg", "Change password successfully!");
                    response.sendRedirect("changePass.jsp");
                } else {
                    session.setAttribute("failedMsg", "Something wrong on server...");
                    response.sendRedirect("changePass.jsp");
                }
            } else {
                session.setAttribute("failedMsg", "Your old password is incorrect!");
                response.sendRedirect("changePass.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
