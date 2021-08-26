create database cycles;

\CONNECT cycles

create table cycles_results (
id SERIAL,
date date,
country varchar(50),
admin1 varchar(255),
admin2 varchar(255),
admin3 varchar(255),
production real,
grain_yield real,
crop_name varchar(50),
fertilizer_rate real,
weed_fraction real,
start_planting_day real,
primary key(id)
);


\COPY cycles_results(date, country, admin1, admin2, admin3, production, grain_yield, crop_name, fertilizer_rate, weed_fraction, start_planting_day)
FROM './data/causemos_v2_production_grain_yield_cassava.csv'
DELIMITER ',' CSV HEADER;
\COPY cycles_results(date, country, admin1, admin2, admin3, production, grain_yield, crop_name, fertilizer_rate, weed_fraction, start_planting_day)
FROM './data/causemos_v2_production_grain_yield_maize.csv'
DELIMITER ',' CSV HEADER;
\COPY cycles_results(date, country, admin1, admin2, admin3, production, grain_yield, crop_name, fertilizer_rate, weed_fraction, start_planting_day)
FROM './data/causemos_v2_production_grain_yield_sorghum.csv'
DELIMITER ',' CSV HEADER;
\COPY cycles_results(date, country, admin1, admin2, admin3, production, grain_yield, crop_name, fertilizer_rate, weed_fraction, start_planting_day)
FROM './data/causemos_v2_production_grain_yield_potato.csv'
DELIMITER ',' CSV HEADER;
\COPY cycles_results(date, country, admin1, admin2, admin3, production, grain_yield, crop_name, fertilizer_rate, weed_fraction, start_planting_day)
FROM './data/causemos_v2_production_grain_yield_millet.csv'
DELIMITER ',' CSV HEADER;
\COPY cycles_results(date, country, admin1, admin2, admin3, production, grain_yield, crop_name, fertilizer_rate, weed_fraction, start_planting_day)
FROM './data/causemos_v2_production_grain_yield_springlentil.csv'
DELIMITER ',' CSV HEADER;

CREATE INDEX cycles_results_params on cycles_results(crop_name, fertilizer_rate, weed_fraction, start_planting_day);
