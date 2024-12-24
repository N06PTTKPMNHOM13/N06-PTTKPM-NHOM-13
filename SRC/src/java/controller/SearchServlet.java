package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import entity.CarDetails; // Import your CarDetails model
import model.CarDaoImpl; // Import your CarDao interface or class

public class SearchServlet extends HttpServlet {

    private CarDaoImpl carDaoImpl; // Initialize your DAO instance

    @Override
    public void init() throws ServletException {
        super.init();
        // Initialize your DAO instance here (e.g., using dependency injection or manually)
        // Example: carDao = new CarDaoImpl(); // Assuming you have a CarDaoImpl class
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            // Output HTML here as needed
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Search Results</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Search Results</h1>");

            String key = request.getParameter("key");
            if (key != null && !key.isEmpty()) {
                List<CarDetails> cars = carDaoImpl.getCarBySearch(key); // Call DAO method
                if (!cars.isEmpty()) {
                    out.println("<ul>");
                    for (CarDetails car : cars) {
                        out.println("<li>" + car.getCarName() + " - " + car.getPrice() + "</li>");
                    }
                    out.println("</ul>");
                } else {
                    out.println("<p>No cars found for the search key: " + key + "</p>");
                }
            } else {
                out.println("<p>Please provide a search key.</p>");
            }

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
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
