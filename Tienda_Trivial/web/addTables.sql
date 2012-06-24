/*IMPORTANTE: Se debe de crear la base de datos "tiendatrivial" antes de
implementar el codigo. Posteriormente, se ejecuta este codigo dentro de ella.
V 1.0*/

CREATE TABLE Cliente (idcliente char(10) not null,
					  nombre varchar(30) not null,
					  apellido varchar(40) not null,
					  sexo char(1) not null,
					  correo varchar(30) not null,
					  telefono varchar(20) not null,
					  celular varchar(20) null,
					  direccion1 text not null,
					  direccion2 text null,
					  colonia varchar(20) not null,
					  estado varchar(20) not null,
					  municipio varchar(20) not null,
					  codigopostal varchar(20) not null,
					  fechanac datetime not null,
					  Primary Key(idcliente));
					  
CREATE TABLE Producto (upc varchar(10) not null,
					   descripcion varchar(60) not null,
					   marca varchar(30) not null,
					   talla varchar(4) not null,
					   costo varchar(10) not null,
					   precio varchar(10) not null,
					   cantidad int not null,
					   foto varchar(10) not null,
					   Primary Key(upc));
					   
CREATE TABLE Venta (idventa char(10) not null,
					 idcliente char(10) not null,
					 upc varchar(10) not null,
					 cantidad int not null,
					 fechaventa datetime not null,
					 Primary Key(idventa),
					 Foreign Key(idcliente) references Cliente(idcliente),
					 Foreign Key(upc) references Producto(upc));

CREATE TABLE Devolucion	(iddevolucion char(10) not null,
						 idcliente char(10) not null,
						 idventa char(10) not null,
						 upc char(10) not null,
						 cantidad int not null,
						 total int not null,
						 fechadevolucion datetime not null,
						 Primary Key(iddevolucion),
						 Foreign Key(idcliente) references Cliente(idcliente),
						 Foreign Key(idventa) references Venta(idventa),
						 Foreign Key(upc) references Producto(upc));
						 