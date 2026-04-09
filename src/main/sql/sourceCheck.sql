select count(*) cnt_rows
      ,sum(population) sum_population
      ,count(distinct country_name) cnt_countries
      ,count(distinct region_name) cnt_region
from   datamig_src.cities
;

select count(*) cnt_rows
      ,count(distinct iso_3166_1) cnt_countries
      ,count(distinct iso_3166_2) cnt_region
from   datamig_src.country_region
;
