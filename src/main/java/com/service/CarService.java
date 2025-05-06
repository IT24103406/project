package com.service;

import com.model.Car;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class CarService {
    private List<Car> cars;

    public CarService() {
        // Initialize with sample data
        cars = new ArrayList<>();
        cars.add(new Car("1", "Toyota", "Camry", 2018, 15000.0, 45000));
        cars.add(new Car("2", "Honda", "Accord", 2020, 18000.0, 30000));
        cars.add(new Car("3", "Ford", "Mustang", 2015, 22000.0, 60000));
    }

    // Sort by price (low to high)
    public List<Car> sortByPrice() {
        List<Car> sorted = new ArrayList<>(cars);
        for (int i = 0; i < sorted.size() - 1; i++) {
            int minIndex = i;
            for (int j = i + 1; j < sorted.size(); j++) {
                if (sorted.get(j).getPrice() < sorted.get(minIndex).getPrice()) {
                    minIndex = j;
                }
            }
            if (minIndex != i) {
                Collections.swap(sorted, i, minIndex);
            }
        }
        return sorted;
    }

    // Sort by year (oldest to newest)
    public List<Car> sortByYear() {
        List<Car> sorted = new ArrayList<>(cars);
        for (int i = 0; i < sorted.size() - 1; i++) {
            int minIndex = i;
            for (int j = i + 1; j < sorted.size(); j++) {
                if (sorted.get(j).getYear() < sorted.get(minIndex).getYear()) {
                    minIndex = j;
                }
            }
            if (minIndex != i) {
                Collections.swap(sorted, i, minIndex);
            }
        }
        return sorted;
    }

    // Filter cars
    public List<Car> filterCars(String make, Integer minYear, Integer maxYear, Double maxPrice) {
        List<Car> filtered = new ArrayList<>();
        for (Car car : cars) {
            boolean matches = true;

            if (make != null && !make.isEmpty() && !car.getMake().equalsIgnoreCase(make)) {
                matches = false;
            }
            if (minYear != null && car.getYear() < minYear) {
                matches = false;
            }
            if (maxYear != null && car.getYear() > maxYear) {
                matches = false;
            }
            if (maxPrice != null && car.getPrice() > maxPrice) {
                matches = false;
            }

            if (matches) {
                filtered.add(car);
            }
        }
        return filtered;
    }

    // Get all cars
    public List<Car> getAllCars() {
        return new ArrayList<>(cars);
    }

    // Find car by ID
    public Car findCarById(String id) {
        for (Car car : cars) {
            if (car.getId().equals(id)) {
                return car;
            }
        }
        return null;
    }
}