package com.serverlet;

import com.model.Car;
import com.service.CarService;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet("/compareCars")
public class CompareCarsServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String carId1 = request.getParameter("carId1");
        String carId2 = request.getParameter("carId2");

        CarService carService = new CarService();
        Car car1 = carService.findCarById(carId1);
        Car car2 = carService.findCarById(carId2);

        if (car1 != null && car2 != null) {
            Map<String, Object> comparison = new HashMap<>();
            comparison.put("car1", car1);
            comparison.put("car2", car2);
            comparison.put("priceDifference", car1.getPrice() - car2.getPrice());
            comparison.put("yearDifference", car1.getYear() - car2.getYear());

            request.setAttribute("comparison", comparison);
        }

        request.getRequestDispatcher("/views/compareCars.jsp").forward(request, response);
    }
}