CREATE TABLE usuario(
	idusuario  VARCHAR(10) NOT NULL PRIMARY KEY,
	nombre VARCHAR(80) ,
	apellidos VARCHAR(80) ,
	usuario varchar(50) NOT NULL unique,
	contrasenia text not null unique,	
	estado boolean not null,
	fecharegistro TIMESTAMP DEFAULT CURRENT_TIMESTAMP 
 );

INSERT INTO usuario(idusuario, nombre, apellidos, usuario, contrasenia, estado)
    VALUES ('1u','Leydi Rosmery','Maldonado C.','Ley','1234',true);

    
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