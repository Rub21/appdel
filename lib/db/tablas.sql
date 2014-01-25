CREATE TABLE usuario(
	idusuario  VARCHAR(10) NOT NULL PRIMARY KEY,
	nombre VARCHAR(80) ,
	apellidos VARCHAR(80) ,
	usuario varchar(50) NOT NULL unique,
	contrasenia text not null,	
	estado boolean not null,
	fecharegistro TIMESTAMP DEFAULT CURRENT_TIMESTAMP 
 );

ALTER TABLE usuario ADD rol VARCHAR(2);
ALTER TABLE usuario ADD correo VARCHAR(50);

INSERT INTO usuario(idusuario, nombre, apellidos, usuario, contrasenia, estado,rol,correo)
    VALUES ('1u','Leydi Rosmery','Maldonado C.','Ley','1234',true,'RA', 'ley@gmail.com');

INSERT INTO usuario(idusuario, nombre, apellidos, usuario, contrasenia, estado,rol,correo)
    VALUES ('2u','Anderson','Espino Alvites','And','123',true,'R-', 'and@hotmail.com');    

select * from usuario;


CREATE TABLE crimen(
     idcrimen VARCHAR(10) not null primary key,      
     tipo VARCHAR(30),
     fecha bigint,
     hora VARCHAR(10),
     descripcion text,
     direccion_ref text,
     imagen VARCHAR(60),
     latitud numeric,
     longitud numeric,
     estado boolean,
     fecharegistro TIMESTAMP DEFAULT CURRENT_TIMESTAMP    
 );

 create table usuario_crimen(
	idusuario  VARCHAR(10) ,
	usuario varchar(50),
	idcrimen VARCHAR(10) 
 )

 alter table usuario_crimen
add constraint fk_idusuario_usuario
Foreign key (idusuario)
references usuario(idusuario);


 alter table usuario_crimen
add constraint fk_idcrimen_crimen
Foreign key (idcrimen)
references crimen(idcrimen);


select count(*) as num from crimen
---funcion 
CREATE OR REPLACE FUNCTION registrar_crimen(     
     idcrimen VARCHAR(10),      
     tipo VARCHAR(30),
     fecha bigint,
     hora VARCHAR(10),
     descripcion text,
     direccion_ref text,
     imagen VARCHAR(60),
     latitud numeric,
     longitud numeric,
     estado boolean,
     idusuario  VARCHAR(10),
     usuario varchar(50))     
RETURNS VOID
AS $$
DECLARE
BEGIN
	INSERT INTO crimen(idcrimen, tipo, fecha, hora, descripcion, direccion_ref, imagen,latitud, longitud,estado)
	VALUES (idcrimen, tipo, fecha, hora, descripcion, direccion_ref, imagen,latitud, longitud,estado);
	INSERT INTO usuario_crimen(idusuario,usuario, idcrimen) VALUES (idusuario,usuario, idcrimen);        
END;
$$ LANGUAGE plpgsql;

--select registrar_crimen( '1c', 'Robo',1382504400000,'1:0 PM','ru', 'p', 'gtg',-13.45,-74.56,true,'1u','anonimo');

CREATE OR REPLACE VIEW seleccionar_crimenes AS
	SELECT c.idcrimen, c.tipo, c.fecha, c.hora, c.descripcion, c.direccion_ref, c.imagen,c.latitud, c.longitud,c.estado, u.idusuario,uc.usuario 
	FROM crimen as c 
	left join usuario_crimen as uc on  uc.idcrimen = c.idcrimen
	left join usuario as u  on uc.idusuario = u.idusuario		

--select * from seleccionar_crimenes;






--//////////////////////////////////////////////////////////////////////////////////////////////////Puntos Criticos
    
CREATE TABLE puntos_critico(
     idpc VARCHAR(10) not null primary key,      
     tipo VARCHAR(30),
     direccion_ref text,
     descripcion text,
     latitud numeric,
     longitud numeric,
     estado boolean,
     fecharegistro TIMESTAMP DEFAULT CURRENT_TIMESTAMP    
 );


 create table usuario_puntos_critico(
	idusuario  VARCHAR(10) ,
	usuario varchar(50),
	idpc VARCHAR(10) 
 )

 alter table usuario_puntos_critico
add constraint fk_idusuario_usuario
Foreign key (idusuario)
references usuario(idusuario);

  alter table usuario_puntos_critico
add constraint fk_idpc
Foreign key (idpc)
references puntos_critico(idpc);


--Funcion
CREATE OR REPLACE FUNCTION registrar_puntos_critico(     
     idpc VARCHAR(10),      
     tipo VARCHAR(30),
     direccion_ref text,
     descripcion text,
     latitud numeric,
     longitud numeric,
     estado boolean,
     idusuario  VARCHAR(10),
     usuario varchar(50))     
RETURNS VOID
AS $$
DECLARE
BEGIN

	INSERT INTO puntos_critico(idpc, tipo, direccion_ref, descripcion, latitud, longitud, estado)
	VALUES (idpc, tipo, direccion_ref, descripcion, latitud, longitud, estado);
	INSERT INTO usuario_puntos_critico(idusuario, usuario, idpc)VALUES (idusuario, usuario, idpc);

	        
END;
$$ LANGUAGE plpgsql;

select registrar_puntos_critico( '1pc', 'cirticos','adasd', 'asdasdasd',-13.1507,-74.19917,false,'1u','Ley');

CREATE OR REPLACE VIEW seleccionar_puntos_critico AS
	SELECT c.idpc, c.tipo, c.descripcion, c.direccion_ref, c.latitud, c.longitud,c.estado, u.idusuario,uc.usuario 
	FROM puntos_critico as c 
	left join usuario_puntos_critico as uc on  uc.idpc = c.idpc
	left join usuario as u  on uc.idusuario = u.idusuario;	

SELECT idpc, tipo, descripcion, direccion_ref, latitud, longitud, estado,idusuario, usuario FROM seleccionar_puntos_critico;



 --//////////////////////////////////////////////////////////////////////////////////////////////puntos de vigilancia
     
CREATE TABLE puntos_vigilancia(
     idpv VARCHAR(10) not null primary key,      
     tipo VARCHAR(30),
     direccion_ref text,
     descripcion text,
     latitud numeric,
     longitud numeric,
     estado boolean,
     fecharegistro TIMESTAMP DEFAULT CURRENT_TIMESTAMP    
 );


 create table usuario_puntos_vigilancia(
	idusuario  VARCHAR(10) ,
	usuario varchar(50),
	idpv VARCHAR(10) 
 )

 alter table usuario_puntos_vigilancia
add constraint fk_idusuario_usuario
Foreign key (idusuario)
references usuario(idusuario);

  alter table usuario_puntos_vigilancia
add constraint fk_idpv
Foreign key (idpv)
references puntos_vigilancia(idpv);

--Funcion
CREATE OR REPLACE FUNCTION registrar_puntos_vigilancia(     
     idpv VARCHAR(10),      
     tipo VARCHAR(30),
     direccion_ref text,
     descripcion text,
     latitud numeric,
     longitud numeric,
     estado boolean,
     idusuario  VARCHAR(10),
     usuario varchar(50))     
RETURNS VOID
AS $$
DECLARE
BEGIN

	INSERT INTO puntos_vigilancia(idpv, tipo, direccion_ref, descripcion, latitud, longitud, estado)
	VALUES (idpv, tipo, direccion_ref, descripcion, latitud, longitud, estado);
	INSERT INTO usuario_puntos_vigilancia(idusuario, usuario, idpv)VALUES (idusuario, usuario, idpv);

	        
END;
$$ LANGUAGE plpgsql;

--select registrar_puntos_vigilancia( '1pv', 'werwr','werwer', 'werwe',-13.15066,-74.20913,false,'1u','Ley');

CREATE OR REPLACE VIEW seleccionar_puntos_vigilancia AS
	SELECT c.idpv, c.tipo, c.descripcion, c.direccion_ref, c.latitud, c.longitud,c.estado, u.idusuario,uc.usuario 
	FROM puntos_vigilancia as c 
	left join usuario_puntos_vigilancia as uc on  uc.idpv = c.idpv
	left join usuario as u  on uc.idusuario = u.idusuario	

SELECT idpv, tipo, descripcion, direccion_ref, latitud, longitud, estado,idusuario, usuario FROM seleccionar_puntos_vigilancia;
