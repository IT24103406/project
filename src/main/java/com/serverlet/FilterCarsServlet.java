package com.serverlet;
import com.service.CarService;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet("/filterCars")
public class FilterCarsServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String make = request.getParameter("make");
        String minYearStr = request.getParameter("minYear");
        String maxYearStr = request.getParameter("maxYear");
        String maxPriceStr = request.getParameter("maxPrice");

        Integer minYear = null;
        Integer maxYear = null;
        Double maxPrice = null;

        try {
            if (minYearStr != null && !minYearStr.isEmpty()) {
                minYear = Integer.parseInt(minYearStr);
            }
            if (maxYearStr != null && !maxYearStr.isEmpty()) {
                maxYear = Integer.parseInt(maxYearStr);
            }
            if (maxPriceStr != null && !maxPriceStr.isEmpty()) {
                maxPrice = Double.parseDouble(maxPriceStr);
            }
        } catch (NumberFormatException e) {
            // Handle invalid number format
        }

        CarService carService = new CarService();
        request.setAttribute("filteredCars", carService.filterCars(make, minYear, maxYear, maxPrice));

        request.getRequestDispatcher("/views/filterCars.jsp").forward(request, response);
    }
}
