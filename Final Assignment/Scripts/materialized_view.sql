CREATE MATERIALIZED VIEW max_waste_stats AS
Select 
    s.city,
    f.stationid,
    t.trucktype,
    max(f.wastecollected) AS max_waste_collected

FROM 
    star_schema.facttrips f
    inner join star_schema.dimtruck t on f.truckid = t.truckid
    inner join star_schema.dimstation s on f.stationid = s.stationid
    inner join star_schema.dimdate d on f.dateid = d.dateid

GROUP BY
    s.city,
    f.stationid,
    t.trucktype;
