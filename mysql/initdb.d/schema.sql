CREATE TABLE sample_db.stations (
    `id` INT(11) NOT NULL AUTO_INCREMENT,
    `station_cd` INT(11),
    `station_g_cd` INT(11),
    `station_name` TEXT,
    `station_name_k` TEXT,
    `station_name_r` TEXT,
    `line_cd` INT(11),
    `pref_cd` INT(11),
    `post` TEXT,
    `add` TEXT,
    `lon` FLOAT,
    `lat` FLOAT,
    `open_ymd` DATETIME,
    `close_ymd` DATETIME,
    `e_status` INT(11),
    `e_sort` INT(11),
    PRIMARY KEY (id)
);
