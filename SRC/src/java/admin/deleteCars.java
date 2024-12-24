
package admin;

import db.DBConnect;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.CarDaoImpl;

public class deleteCars extends HttpServlet {
   
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet deleteCars</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet deleteCars at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        try {
            int carId = Integer.parseInt(request.getParameter("carId"));
            CarDaoImpl dao = new CarDaoImpl(DBConnect.getConn());
            HttpSession session = request.getSession();
            boolean f = dao.deleteCars(carId);
            // Xử lý kết quả và điều hướng tới trang admin/all_Cars.jsp
            if (f) {
                session.setAttribute("succMsg", "Car delete successfully!");
                response.sendRedirect("admin/all_Cars.jsp");
            } else {
                session.setAttribute("failedMsg", "Something wrong on server...");
                response.sendRedirect("admin/all_Cars.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    } 

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
