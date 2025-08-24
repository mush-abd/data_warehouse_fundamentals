SELECT
    d.year,
    s.city,
    s.stationid,
    SUM(f.wastecollected) AS total_waste_collected
FROM star_schema.facttrips f
JOIN star_schema.dimdate d ON f.dateid = d.dateid
JOIN star_schema.dimstation s ON f.stationid = s.stationid
GROUP BY ROLLUP (d.year, s.city, s.stationid);
