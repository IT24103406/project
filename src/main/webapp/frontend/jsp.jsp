<!-- sortCars.jsp -->
<form action="sortCars" method="post">
    <select name="sortOption">
        <option value="price">Sort by Price</option>
        <option value="year">Sort by Year</option>
    </select>
    <button type="submit">Sort</button>
</form>

<table>
    <tr>
        <th>Make</th>
        <th>Model</th>
        <th>Year</th>
        <th>Price</th>
        <th>Mileage</th>
    </tr>
    <c:forEach items="${sortedCars}" var="car">
        <tr>
            <td>${car.make}</td>
            <td>${car.model}</td>
            <td>${car.year}</td>
            <td>${car.price}</td>
            <td>${car.mileage}</td>
        </tr>
    </c:forEach>
</table>
<!-- filterCars.jsp -->
<form action="filterCars" method="post">
    <label>Make: <input type="text" name="make"></label>
    <label>Min Year: <input type="number" name="minYear"></label>
    <label>Max Year: <input type="number" name="maxYear"></label>
    <label>Min Price: <input type="number" step="0.01" name="minPrice"></label>
    <label>Max Price: <input type="number" step="0.01" name="maxPrice"></label>
    <button type="submit">Filter</button>
</form>

<!-- Display filtered results similar to sort page -->

<!-- compareCars.jsp -->
<form action="compareCars" method="post">
    <label>Car 1 ID: <input type="text" name="carId1" required></label>
    <label>Car 2 ID: <input type="text" name="carId2" required></label>
    <button type="submit">Compare</button>
</form>

<c:if test="${not empty comparison}">
    <table>
        <tr>
            <th>Feature</th>
            <th>${comparison.car1.make} ${comparison.car1.model}</th>
            <th>${comparison.car2.make} ${comparison.car2.model}</th>
        </tr>
        <tr>
            <td>Year</td>
            <td>${comparison.car1.year}</td>
            <td>${comparison.car2.year}</td>
        </tr>
        <tr>
            <td>Price</td>
            <td>${comparison.car1.price}</td>
            <td>${comparison.car2.price}</td>
        </tr>
        <tr>
            <td>Price Difference</td>
            <td colspan="2">${comparison.priceDifference}</td>
        </tr>
        <!-- Add more comparison rows as needed -->
    </table>
</c:if>