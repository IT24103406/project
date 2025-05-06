<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List, com.model.Car" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Filter Cars</title>
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
                        <a class="nav-link active" href="FilterCars.jsp">Filter Cars</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="CompareCars.jsp">Compare Cars</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="card">
        <div class="card-header">
            <h2>Filter Cars</h2>
        </div>
        <div class="card-body">
            <form action="filterCars" method="post" class="mb-4">
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="make" class="form-label">Make:</label>
                            <input type="text" name="make" id="make" class="form-control" placeholder="e.g., Toyota">
                        </div>
                        <div class="form-group">
                            <label for="minYear" class="form-label">Minimum Year:</label>
                            <input type="number" name="minYear" id="minYear" class="form-control" placeholder="e.g., 2010">
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="maxYear" class="form-label">Maximum Year:</label>
                            <input type="number" name="maxYear" id="maxYear" class="form-control" placeholder="e.g., 2020">
                        </div>
                        <div class="form-group">
                            <label for="maxPrice" class="form-label">Maximum Price ($):</label>
                            <input type="number" step="0.01" name="maxPrice" id="maxPrice" class="form-control" placeholder="e.g., 20000">
                        </div>
                    </div>
                </div>
                <div class="row mt-3">
                    <div class="col-12">
                        <button type="submit" class="btn btn-primary">Filter Cars</button>
                        <a href="filterCars.jsp" class="btn btn-secondary">Reset Filters</a>
                    </div>
                </div>
            </form>

            <%
                List<Car> filteredCars = (List<Car>) request.getAttribute("filteredCars");
                if (filteredCars != null && !filteredCars.isEmpty()) {
            %>
            <div class="table-responsive">
                <table class="table table-striped table-hover">
                    <thead>
                    <tr>
                        <th>Make</th>
                        <th>Model</th>
                        <th>Year</th>
                        <th>Price ($)</th>
                        <th>Mileage</th>
                    </tr>
                    </thead>
                    <tbody>
                    <%
                        for (Car car : filteredCars) {
                    %>
                    <tr>
                        <td><%= car.getMake() %></td>
                        <td><%= car.getModel() %></td>
                        <td><%= car.getYear() %></td>
                        <td>$<%= car.getPrice() %></td>
                        <td><%= car.getMileage() %> miles</td>
                    </tr>
                    <%
                        }
                    %>
                    </tbody>
                </table>
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