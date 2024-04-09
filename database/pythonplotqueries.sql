SELECT v.color, COUNT(r.rentalID) as rental_count
FROM Rental r
JOIN Vehicles v ON r.vehicleID = v.vehicleID
GROUP BY v.color
ORDER BY rental_count DESC;

SELECT v.make, v.model, COUNT(r.rentalID) as rental_count
FROM Rental r
JOIN Vehicles v ON r.vehicleID = v.vehicleID
GROUP BY v.make, v.model
ORDER BY rental_count DESC;

SELECT u.age, COUNT(r.rentalID) AS rental_count
FROM Users u
LEFT JOIN Rental r ON u.userID = r.userID
WHERE u.age IS NOT NULL
GROUP BY u.userID;

SELECT YEAR(initialDate) as year, MONTH(initialDate) as month, SUM(totalPrice) as total_revenue
FROM Rental
GROUP BY YEAR(initialDate), MONTH(initialDate)
ORDER BY YEAR(initialDate), MONTH(initialDate);

SELECT v.make, v.model, COUNT(t.ticketID) as ticket_count
FROM Tickets t
JOIN Rental r ON t.rentalID = r.rentalID
JOIN Vehicles v ON r.vehicleID = v.vehicleID
GROUP BY v.make, v.model
ORDER BY ticket_count DESC;