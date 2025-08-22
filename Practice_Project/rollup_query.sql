SELECT
    d.Year,
    cs.City,
    p.Productid,
    SUM(f.Price_PerUnit * f.QuantitySold) AS TotalSales 
    FROM
    SalesDW.FactSales f
JOIN
    SalesDW.DimDate d ON f.Dateid = d.Dateid
JOIN
    SalesDW.DimProduct p ON f.Productid = p.Productid
JOIN
    SalesDW.DimCustomerSegment cs ON f.Segmentid = cs.Segmentid
GROUP BY ROLLUP (d.Year, cs.City, p.Productid)
ORDER BY
    d.Year DESC,
    cs.City,
    p.Productid;