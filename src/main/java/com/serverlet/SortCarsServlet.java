package com.serverlet;

import com.service.CarService;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet("/sortCars")
public class SortCarsServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String sortOption = request.getParameter("sortOption");
        CarService carService = new CarService();

        if ("price".equals(sortOption)) {
            request.setAttribute("sortedCars", carService.sortByPrice());
        } else if ("year".equals(sortOption)) {
            request.setAttribute("sortedCars", carService.sortByYear());
        } else {
            request.setAttribute("sortedCars", carService.getAllCars());
        }

        request.getRequestDispatcher("/views/sortCars.jsp").forward(request, response);
    }
}
