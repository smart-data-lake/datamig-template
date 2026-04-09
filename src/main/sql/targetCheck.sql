select count(*) cnt_rows
      ,sum(population) sum_population
      ,count(distinct iso_3166_1) cnt_countries
      ,count(distinct iso_3166_2) cnt_region
from   datamig_tgt.cities
;

select count(*) cnt_rows from datamig_tgt.country
;

select count(*) cnt_rows from datamig_tgt.region
;

select reason, count(*) cnt_rows
from   datamig_tgt.error_cities
group by reason
order by reason
;