package admin;

import entity.CarDetails;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.CarDaoImpl;
import db.DBConnect;
import jakarta.servlet.http.HttpSession;

public class editCars extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet editCars</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet editCars at " + request.getContextPath() + "</h1>");
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
            int carId = Integer.parseInt(request.getParameter("carId"));
            String carName = request.getParameter("carName");
            String price = request.getParameter("price");
            String year = request.getParameter("year");
            int quantity = Integer.parseInt(request.getParameter("quantity"));

            // Tạo đối tượng CarDetails với thông tin đã chỉnh sửa
            CarDetails car = new CarDetails();
            car.setCarId(carId);
            car.setCarName(carName);
            car.setPrice(price);
            car.setYear(year);
            car.setQuantity(quantity);

            CarDaoImpl dao = new CarDaoImpl(DBConnect.getConn());
            HttpSession session = request.getSession();
            boolean f = dao.editCars(car);
            
            if (f) {
                session.setAttribute("succMsg", "Car update successfully!");
                response.sendRedirect("admin/all_Cars.jsp");
            } else {
                session.setAttribute("failedMsg", "Something wrong on server...");
                response.sendRedirect("admin/edit_Cars.jsp");
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
