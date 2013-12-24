   ruben@rub21:~$  sudo su postgres
   postgres@rub21:/home/ruben$  psql -U postgres -d dbappdel -f /usr/share/postgresql/9.1/contrib/postgis-2.0/postgis.sql
   postgres@rub21:/home/ruben$  psql -U postgres -d dbappdel -f /usr/share/postgresql/9.1/contrib/postgis-2.0/spatial_ref_sys.sql

## imporatcion del SHP

postgres@rub21:/home/ruben$ shp2pgsql -I -s 4326 inters.shp polygon | psql -d dbappdel
Shapefile type: Polygon
Postgis type: MULTIPOLYGON[2]
SET
SET
BEGIN
NOTICE:  CREATE TABLE will create implicit sequence "polygon_gid_seq" for serial column "polygon.gid"
CREATE TABLE
NOTICE:  ALTER TABLE / ADD PRIMARY KEY will create implicit index "polygon_pkey" for table "polygon"
ALTER TABLE
                    addgeometrycolumn                    
---------------------------------------------------------
 public.polygon.geom SRID:4326 TYPE:MULTIPOLYGON DIMS:2 
(1 row)

INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
CREATE INDEX
COMMIT
postgres@rub21:/home/ruben$ 