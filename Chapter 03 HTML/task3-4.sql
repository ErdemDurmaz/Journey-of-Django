/* 

1A) 
Yes

1B) 
Yes

1C) 
SalesOrderID int - Detail/Header
SalesOrderDetailID int - Detail/Header
OrderQty smallint - Detail/Header
SalesOrderNumber nvarchar(25) - Header
PurchaseOrderNumber - Header

*/

/* 1D */
SELECT SUM(sode.OrderQty) as "Order Amount",
       soh.[Status]
FROM Sales.SalesOrderDetailEnlarged sode
       INNER JOIN Sales.SalesOrderHeader soh
       on sode.SalesOrderId = soh.SalesOrderId
Group BY soh.Status;

/*

3A) 
Yes, We have different types, We can find out their:
CustomerId
PersonalId
AccountNumber
FirstName
MiddleName
LastName

3B)
Yes
*/ 

/* 3C)
*/
SELECT SUM(sode.SubTotal) as "Order Amount",
       soh.TerritoryID
FROM Sales.SalesOrderHeader sode
       INNER JOIN Sales.SalesTerritoryHistory soh
       on sode.TerritoryID = soh.TerritoryID
Group BY soh.TerritoryID;
