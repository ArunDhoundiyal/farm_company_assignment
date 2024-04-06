SELECT
  Vehicles.Vehicle_id,
  Orders.Product_Name AS Product,
  SUM(Orders.Quantity) AS Total_Quantity
FROM
  Orders
  JOIN Customers ON Orders.Customer_id = Customers.Customer_id
  JOIN Routes ON Routes.Route_id = Customers.Route_id
  JOIN Vehicles ON Vehicles.Vehicle_id = Routes.Vehicle_id
WHERE
  Orders.Order_status = 'confirmed'
  AND Orders.Delivery_date BETWEEN 'start_date'
  AND 'end_date'
GROUP BY
  Vehicles.Vehicle_id,
  Orders.Product_Name;