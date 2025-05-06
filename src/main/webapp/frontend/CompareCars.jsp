<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.model.Car, java.util.Map" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Compare Cars</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="css/style.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">Car Sales</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" href="index.jsp">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="sortCars.jsp">Sort Cars</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="FilterCars.jsp">Filter Cars</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="CompareCars.jsp">Compare Cars</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="card">
        <div class="card-header">
            <h2>Compare Cars</h2>
        </div>
        <div class="card-body">
            <form action="compareCars" method="post" class="mb-4">
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="carId1" class="form-label">First Car ID:</label>
                            <input type="text" name="carId1" id="carId1" class="form-control" required>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="carId2" class="form-label">Second Car ID:</label>
                            <input type="text" name="carId2" id="carId2" class="form-control" required>
                        </div>
                    </div>
                </div>
                <div class="row mt-3">
                    <div class="col-12">
                        <button type="submit" class="btn btn-primary">Compare Cars</button>
                    </div>
                </div>
            </form>

            <%
                Map<String, Object> comparison = (Map<String, Object>) request.getAttribute("comparison");
                if (comparison != null) {
                    Car car1 = (Car) comparison.get("car1");
                    Car car2 = (Car) comparison.get("car2");
                    double priceDifference = (Double) comparison.get("priceDifference");
                    int yearDifference = (Integer) comparison.get("yearDifference");
            %>
            <div class="comparison-table">
                <h3 class="mb-4">Comparison Results</h3>
                <div class="table-responsive">
                    <table class="table table-bordered">
                        <thead class="table-dark">
                        <tr>
                            <th>Feature</th>
                            <th><%= car1.getMake() %> <%= car1.getModel() %></th>
                            <th><%= car2.getMake() %> <%= car2.getModel() %></th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td class="highlight">Year</td>
                            <td><%= car1.getYear() %></td>
                            <td><%= car2.getYear() %></td>
                        </tr>
                        <tr>
                            <td class="highlight">Price</td>
                            <td>$<%= car1.getPrice() %></td>
                            <td>$<%= car2.getPrice() %></td>
                        </tr>
                        <tr>
                            <td class="highlight">Mileage</td>
                            <td><%= car1.getMileage() %> miles</td>
                            <td><%= car2.getMileage() %> miles</td>
                        </tr>
                        <tr>
                            <td class="highlight">Color</td>
                            <td><%= car1.getColor() %></td>
                            <td><%= car2.getColor() %></td>
                        </tr>
                        <tr>
                            <td class="highlight">Fuel Type</td>
                            <td><%= car1.getFuelType() %></td>
                            <td><%= car2.getFuelType() %></td>
                        </tr>
                        <tr class="table-info">
                            <td class="highlight">Price Difference</td>
                            <td colspan="2">
                                <%
                                    if (priceDifference > 0) {
                                        System.out.print(car1.getMake() + " is $" + priceDifference + " more expensive");
                                    } else if (priceDifference < 0) {
                                        System.out.print(car2.getMake() + " is $" + (-priceDifference) + " more expensive");
                                    } else {
                                        System.out.print("Both cars have the same price");
                                    }
                                %>
                            </td>
                        </tr>
                        <tr class="table-info">
                            <td class="highlight">Year Difference</td>
                            <td colspan="2">
                                <%
                                    if (yearDifference > 0) {
                                        System.out.println(car1.getMake() + " is " + yearDifference + " years newer");
                                    } else if (yearDifference < 0) {
                                        System.out.println(car2.getMake() + " is " + (-yearDifference) + " years newer");
                                    } else {
                                        System.out.println("Both cars are the same year");
                                    }
                                %>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <%
                }
            %>
        </div>
    </div>

    <footer class="footer">
        <div class="container">
            <span>© 2023 Second Hand Car Sales Management System</span>
        </div>
    </footer>
</div>

<!-- Bootstrap JS Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>