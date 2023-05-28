USE RETO2;

CREATE TABLE CLIENTES(
	nombre varchar(32),
    apellidoP varchar(32),
    apellidoM varchar(32),
    CURP char(18),
    vigenciaINE char(4),
    emision char(4),
    claveINE char(18),
    registroINE char(4),
    numEmision char(2),
    CIC char(9),
    OCR char(13),
    sexo char(1),
    RFC char(13),
    pais varchar(20),
    estado varchar(32),
    regimenFiscal varchar(50),
    CP char(5),
    celular char(10),
    email varchar(50),
    primary key (CURP)
);
INSERT INTO reto2.clientes VALUES("Juan Jose","Lopez","Reyes","LORFJ30526HNLGTRA9","2031", "2021","LRRTJU03052619H000" ,"2021","00","123456789","1234567890123","H","LORF030526XX6","Mexico","Nuevo Leon", "Sueldos y Salarios", "67140","8112345678","example@email,com");
INSERT INTO reto2.clientes VALUES("Sin cuenta","","","000000000000000000","0000", "0000","000000000000000000", "0000","00","000000000","0000000000","X","0000000000000","Mexico","", "", "00000","0000000000","example@email.com");

CREATE TABLE CONTRATO(
	tipoCuenta varchar(50),
    numCuenta char(10),
    cliente char(18),
    saldo int,
    fecha date,
    pass varchar(255),
    primary key (numCuenta),
    foreign key (cliente) references CLIENTES(CURP)
);
INSERT INTO reto2.contrato VALUES("Enlace digital","0123456789","LORFJ30526HNLGTRA9",2500,"2023-05-27","passw0rd");
INSERT INTO reto2.contrato VALUES("Ninguna","0000000000","000000000000000000",0,"2023-05-27","passw0rd");

CREATE TABLE TARJETA(
	tipoTarjeta varchar(50),
    numTarjeta char(16),
    numContrato char(10),
    fechaContratacion date,
    fechaExpiracion date,
    primary key (numTarjeta),
    foreign key (numContrato) references CONTRATO(numCuenta)
);
INSERT INTO reto2.tarjeta VALUES("debito","1234567890012345","0123456789","2023-05-27","2030-05-01");


CREATE TABLE SUCURSAL(
	numSucursal int,
    ciudad varchar(32),
    estado varchar(32),
	calle varchar(32),
    numero int,
    primary key (numSucursal)
);
INSERT INTO reto2.sucursal VALUES(1,"Monterrey","Nuevo Leon","David Alfaro Siqueiros",106);

CREATE TABLE TURNOS(
	numTurno int auto_increment NOT NULL,
    sucursal int NOT NULL,
    cuenta char(10),
    fecha date,
    hora time,
    motivo varchar(50),
    tipo char(1),
    primary key (numTurno),
    foreign key (sucursal) references SUCURSAL(numSucursal),
    foreign key (cuenta) references CONTRATO(numCuenta)
);
INSERT INTO reto2.turnos(sucursal, cuenta, fecha, hora, motivo, tipo) VALUES(1,"0000000000","2023-05-27","16:50:00","Deposito","V");
INSERT INTO reto2.turnos(sucursal, cuenta, fecha, hora, motivo, tipo) VALUES(1,"0000000000","2023-05-27","16:30:00","Nueva Cuenta","E");

CREATE TABLE TRANSACCIONES(
	numTrans int,
    cuentaOrigen char(10),
    cuentaDest char(10),
    tipo varchar(64),
    primary key (numTrans),
    foreign key (cuentaOrigen) references CONTRATO(numCuenta),
    foreign key (cuentaDest) references CONTRATO(numCuenta)
);
insert INTO reto2.transacciones(cuentaOrigen, cuentaDest, tipo, monto) VALUES("0000000000","0123456789","deposito",2500);

CREATE TABLE LOGINADM(
	userLogin varchar(32),
    userPass varchar(255),
    userRole varchar(255),
    primary key (userLogin)
);
insert into reto2.loginadm VALUES("CAJNLMTY00101","passw0rd","CAJER@");