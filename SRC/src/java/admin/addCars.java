package admin;

import db.DBConnect;
import entity.CarDetails;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import model.CarDaoImpl;

@MultipartConfig
public class addCars extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet addCars</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet addCars at " + request.getContextPath() + "</h1>");
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
            String carName = request.getParameter("carName");
            String price = request.getParameter("price");
            String categories = request.getParameter("categories");
            String year = request.getParameter("year");
            Part part = request.getPart("carImg");
            String fileName = getSubmittedFileName(part);
            int quantity = Integer.parseInt(request.getParameter("quantity"));

            CarDetails car = new CarDetails(carName, price, categories, year, fileName, quantity);

            CarDaoImpl dao = new CarDaoImpl(DBConnect.getConn());
            HttpSession session = request.getSession();
            boolean f = dao.addCars(car);
            if (f) {
                String uploadPath = getServletContext().getRealPath("") + File.separator + "cds";
                File uploadDir = new File(uploadPath);
                if (!uploadDir.exists()) {
                    uploadDir.mkdir();
                }
                part.write(uploadPath + File.separator + fileName);
                session.setAttribute("succMsg", "Car added successfully!");
                response.sendRedirect(request.getContextPath() + "/admin/add_Cars.jsp");
            } else {
                session.setAttribute("failedMsg", "Failed to add car. Please try again.");
                response.sendRedirect(request.getContextPath() + "/admin/add_Cars.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private String getSubmittedFileName(Part part) {
        String submittedFileName = part.getSubmittedFileName();
        return System.currentTimeMillis() + "_" + submittedFileName; // Append current timestamp to ensure unique filename
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
