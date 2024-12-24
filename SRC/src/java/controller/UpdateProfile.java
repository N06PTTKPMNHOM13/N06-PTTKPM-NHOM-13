
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

public class UpdateProfile extends HttpServlet {
   
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UpdateProfile</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateProfile at " + request.getContextPath () + "</h1>");
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
            int id = Integer.parseInt(request.getParameter("id"));
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String pass = request.getParameter("pass");
            
            User u = new User();
            u.setId(id);
            u.setName(name);
            u.setEmail(email);
            u.setPhone(phone);
            
            HttpSession session = request.getSession();
            UserDAOImpl dao = new UserDAOImpl(DBConnect.getConn());
            boolean f = dao.checkPassword(id, pass);
            if (f) {
                boolean f2 = dao.updateProfile(u);
                if (f2) {
                    User updatedUser = dao.getUserById(id);
                    session.setAttribute("userObj", updatedUser);
                    session.setAttribute("succMsg", "Update successfully!");
                    response.sendRedirect("edit_profile.jsp");
                } else {
                    session.setAttribute("failedMsg", "Something wrong on server...");
                    response.sendRedirect("edit_profile.jsp");
                }
            } else {
                session.setAttribute("failedMsg", "Your password is incorrect!");
                response.sendRedirect("edit_profile.jsp");
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
