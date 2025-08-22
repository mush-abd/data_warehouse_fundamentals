SELECT
    d.Year,
    cs.City,
    p.Productid,
    AVG(f.Price_PerUnit * f.QuantitySold) AS AverageSales
FROM
    SalesDW.FactSales f
INNER JOIN
    SalesDW.DimDate d ON f.Dateid = d.Dateid
INNER JOIN
    SalesDW.DimProduct p ON f.Productid = p.Productid
INNER JOIN
    SalesDW.DimCustomerSegment cs ON f.Segmentid = cs.Segmentid
GROUP BY CUBE (d.Year, cs.City, p.Productid);