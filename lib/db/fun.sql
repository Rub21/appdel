S/*ELECT tipo , count(tipo)  FROM crimen GROUP BY tipo;


SELECT 13456512::date from crimen;

SELECT CAST(fecha/10000 AS date) from crimen

select to_char(fecha/1000,'mm/dd/yy') from crimen;


SELECT EXTRACT(EPOCH FROM TIMESTAMP '2011-05-17 10:40:28.876944') * 1000;

SELECT fecha from crimen;

SELECT to_timestamp(fecha/1000) from crimen;

SELECT to_char(fecha/1000) from crimen;
SELECT to_char((fecha/1000), 'Dy, Mon DD, YY') from crimen;


*/

CREATE OR REPLACE FUNCTION puntos(_fecha varchar(50))
RETURNS  INTEGER
AS $$
DECLARE
	_count INTEGER;	
	BEGIN
		_count=(select count(*) as day   FROM crimen where substring(to_timestamp(fecha/1000)::text,0,8)=_fecha and estado=true);	
	RETURN _count;
	END;
$$ LANGUAGE plpgsql;


--select puntos('2013-11');


--select * from crimen

CREATE OR REPLACE VIEW data_por_mes AS
	select substring(to_timestamp(fecha/1000)::text,0,8) as mes ,puntos(substring(to_timestamp(fecha/1000)::text,0,8)) 
	from crimen GROUP BY  mes ORDER By mes ASC;
select * from data_por_mes




/******************************selecion por tipo y fechapor mes*/

CREATE OR REPLACE FUNCTION puntos_tipo_fecha(_tipo varchar(50),_fecha varchar(50))
RETURNS  INTEGER
AS $$
DECLARE
	_count INTEGER;	
	BEGIN
		_count=(select count(*) as day   FROM crimen where substring(to_timestamp(fecha/1000)::text,0,8)=_fecha and tipo=_tipo);	
	RETURN _count;
	END;
$$ LANGUAGE plpgsql;



---Robo

CREATE OR REPLACE VIEW data_robo AS
	select substring(to_timestamp(fecha/1000)::text,0,8) as mes ,puntos_tipo_fecha('Robo',substring(to_timestamp(fecha/1000)::text,0,8)) as cantidad
	from crimen GROUP BY  mes ORDER By mes ASC;
	
select mes, cantidad from data_robo



--Agresión
CREATE OR REPLACE VIEW data_agresion AS
	select substring(to_timestamp(fecha/1000)::text,0,8) as mes ,puntos_tipo_fecha('Agresión',substring(to_timestamp(fecha/1000)::text,0,8)) as cantidad
	from crimen GROUP BY  mes ORDER By mes ASC;
	
select * from data_agresion

--Accidente
CREATE OR REPLACE VIEW data_acidente AS
	select substring(to_timestamp(fecha/1000)::text,0,8) as mes ,puntos_tipo_fecha('Accidente',substring(to_timestamp(fecha/1000)::text,0,8)) as cantidad
	from crimen GROUP BY  mes ORDER By mes ASC;
	
select * from data_acidente


/*

select substring(to_timestamp(fecha/1000)::text,0,8) as mes ,puntos_tipo_fecha('Robo',substring(to_timestamp(fecha/1000)::text,0,8))from crimen GROUP BY  mes ORDER By mes ASC;

---Robo
select substring(to_timestamp(fecha/1000)::text,0,8) as mes ,puntos_tipo_fecha('Robo',substring(to_timestamp(fecha/1000)::text,0,8))from crimen GROUP BY  mes ORDER By mes ASC;


*/

select tipo, count(*) as cantidad  from crimen GROUP BY  tipo ORDER By tipo ASC;

select substring(to_timestamp(fecha/1000)::text,0,8) as mes , count(*) as cantidad  from crimen GROUP BY  mes ORDER By mes ASC;