/*IMPORTANTE: Se debe de crear la base de datos "tiendatrivial" antes de
implementar el codigo. Posteriormente, se ejecuta este codigo dentro de ella.
V 1.0.2*/

CREATE TABLE Usuario (idusuario varchar(15) not null,
                        nombre varchar(30) not null,
                        apellido varchar(40) not null,
                        password varchar(10) not null,
                        nivelacceso char(1) not null,
                        correo varchar(30) not null,
                        intentosfallidos char(1) not null,
                        Primary Key(idusuario));
					  

CREATE TABLE Cliente (idcliente char(10) not null,
                        nombre varchar(30) not null,
                        apellido varchar(40) not null,
                        sexo char(1) not null,
                        fechanac datetime not null,
                        correo varchar(30) not null,
                        direccion text not null,
                        colonia varchar(20) not null,
                        codigopostal varchar(20) not null,
                        ciudad varchar(20) not null,
                        estado varchar(20) not null,
                        telefono varchar(20) not null,
                        celular varchar(20) null,
                        Primary Key(idcliente));
					  
CREATE TABLE Producto (upc varchar(10) not null,
                        cantidad int not null,   
                        tipo varchar(15) not null,     
                        marca varchar(30) not null,  
                        talla varchar(4) not null,              
                        descripcion varchar(60) not null,
                        costo varchar(10) not null,
                        precio varchar(10) not null,
                        foto varchar(10) not null,
                        Primary Key(upc));
					   
CREATE TABLE Venta (idventa char(10) not null,
                    idcliente char(10) not null,
                    upc varchar(10) not null,
                    idusuario varchar(15) not null,
                    cantidad int not null,
                    fechaventa datetime not null,
                    Primary Key(idventa, idcliente, upc),
                    Foreign Key(idcliente) references Cliente(idcliente),
                    Foreign Key(upc) references Producto(upc),
                    Foreign Key(idusuario) references Usuario(idusuario));
					 

CREATE TABLE Devolucion	(iddevolucion char(10) not null,
                            idcliente char(10) not null,
                            idventa char(10) not null,
                            upc char(10) not null,
                            idusuario varchar(15) not null,
                            cantidad int not null,
                            total int not null,
                            fechadevolucion datetime not null,
                            defectuoso boolean not null,
                            razon text null,
                            Primary Key(iddevolucion, idcliente, idventa, upc),
                            Foreign Key(idcliente) references Cliente(idcliente),
                            Foreign Key(idventa) references Venta(idventa),
                            Foreign Key(upc) references Producto(upc),
                            Foreign Key(idusuario) references Usuario(idusuario));
						 						 