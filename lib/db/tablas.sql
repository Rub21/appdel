CREATE TABLE usuario(
	idusuario  VARCHAR(10) NOT NULL PRIMARY KEY,
	nombre VARCHAR(80) ,
	apellidos VARCHAR(80) ,
	usuario varchar(20) NOT NULL unique,
	contrasenia text not null unique,	
	estado boolean not null,
	fecharegistro TIMESTAMP DEFAULT CURRENT_TIMESTAMP 
 );

INSERT INTO usuario(idusuario, nombre, apellidos, usuario, contrasenia, estado)
    VALUES ('1u','Leydi Rosmery','Maldonado C.','Ley','1234',true);
