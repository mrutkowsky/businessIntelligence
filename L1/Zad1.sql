--1a
SELECT 
    ProductID as "Identyfikator",
    Name as "Nazwa",
    Color as "Kolor",
    ListPrice as "Cena katalogowa",
    (ListPrice-StandardCost) as "Zysk",
    CASE 
        WHEN Class = 'H' THEN 'High' 
        WHEN Class = 'M'  THEN 'Medium' 
        WHEN Class = 'L' THEN 'Low' 
    END AS "Klasa",
    CASE 
        WHEN ProductLine = 'R' THEN 'Road' 
        WHEN ProductLine = 'M'  THEN 'Mountain' 
        WHEN ProductLine = 'T' THEN 'Touring' 
        WHEN ProductLine = 'S' THEN 'Standard' 
    END AS "Nazwa typu"
FROM Production.Product
ORDER BY Nazwa;

--1b
SELECT 
    Name as "Nazwa",
    ListPrice as "Cena katalogowa"
FROM Production.Product
WHERE ListPrice > 10 AND Color = NULL OR Color = 'Red'
ORDER BY ListPrice;

--1c
SELECT p.Name as "Nazwa", ps.Name "Nazwa podkategorii"
FROM Production.Product p 
FULL OUTER JOIN  Production.ProductSubcategory ps 
ON p.ProductSubcategoryID = ps.ProductSubcategoryID;

--1d
SELECT p.Name "Nazwa", ps.Name "Nazwa podkategorii", pc.Name "Nazwa kategorii"
FROM Production.Product p 
FULL OUTER JOIN  Production.ProductSubcategory ps 
ON p.ProductSubcategoryID = ps.ProductSubcategoryID
FULL OUTER JOIN Production.ProductCategory pc 
ON ps.ProductCategoryID = pc.ProductCategoryID;

--1e
SELECT AVG(ListPrice) "Średnia cena", COUNT(*) "Ilość", ps.Name "Nazwa podkategorii",pc.Name "Nazwa kategorii"
FROM Production.Product p 
FULL OUTER JOIN  Production.ProductSubcategory ps 
ON p.ProductSubcategoryID = ps.ProductSubcategoryID
FULL OUTER JOIN Production.ProductCategory pc 
ON ps.ProductCategoryID = pc.ProductCategoryID
GROUP BY ps.Name, pc.Name;

SELECT AVG(ListPrice) "Średnia cena", COUNT(*) "Ilość", pc.Name "Nazwa kategorii"
FROM Production.Product p 
FULL OUTER JOIN  Production.ProductSubcategory ps 
ON p.ProductSubcategoryID = ps.ProductSubcategoryID
FULL OUTER JOIN Production.ProductCategory pc 
ON ps.ProductCategoryID = pc.ProductCategoryID
GROUP BY pc.Name;