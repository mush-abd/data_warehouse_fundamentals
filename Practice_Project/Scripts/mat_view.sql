CREATE MATERIALIZED VIEW salesdw.max_sales AS
SELECT
    cs.City,
    p.Productid,
    p.Producttype,
    MAX(f.Price_PerUnit * f.QuantitySold) AS MaxSales
FROM
    SalesDW.FactSales f
JOIN
    SalesDW.DimProduct p ON f.Productid = p.Productid
JOIN
    SalesDW.DimCustomerSegment cs ON f.Segmentid = cs.Segmentid
GROUP BY
    cs.City,
    p.Productid,
    p.Producttype
WITH DATA;