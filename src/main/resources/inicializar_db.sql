drop table Usuario; 
drop table CitaMedica;
drop table Medico; 
drop table Paciente;
drop table EstadoCita;

create table Paciente (id int auto_increment primary key not null, nombre varchar (255) not null, apellido varchar (255) not null, fechaNaci date not null, telefono varchar (255) not null);

create table Medico (id int auto_increment primary key not null, 
nombre varchar (255) not null, apellido varchar (255) not null, 
telefono varchar (255) not null);

create table Usuario(id int auto_increment primary key not null, correo varchar (100) not null, password varchar(100) not null, rol varchar (20) not null);

create table EstadoCita(
  id int not null primary key auto_increment,
  nombre varchar(20) not null
 );

insert into EstadoCita(id, nombre) values(1, 'PROGRAMADA');
insert into EstadoCita(id, nombre) values(2, 'CANCELADA');
insert into EstadoCita(id, nombre) values(3, 'REALIZADA');

create table CitaMedica (id int auto_increment primary key not null, 
idPaciente int not null, 
idMedico int not null,
fechaHora dateTime not null default current_time(),
idEstadoCita int not null default 1
);

alter table CitaMedica add foreign key (idPaciente) references Paciente(id);
alter table CitaMedica add foreign key (idMedico) references Medico(id);
alter table CitaMedica add foreign key (idEstadoCita) references EstadoCita(id);


insert into Paciente (nombre, apellido, fechaNaci,telefono) values ('Noa', 'Guzman','1995/02/15','3114057896');
insert into Paciente (nombre, apellido, fechaNaci,telefono) values ('Laura', 'Gomez','1989/05/28','321059896');
insert into Paciente (nombre, apellido, fechaNaci,telefono) values ('Pedro', 'Rangel','1993/09/30','302569874');
insert into Paciente (nombre, apellido, fechaNaci,telefono) values ('Carlos','Lopez','1999/09/20','322569896');
insert into Paciente (nombre,apellido,fechaNaci,telefono) values ('Pablo','Rangel','1987-01-10','312456987');
insert into Paciente (nombre,apellido,fechaNaci,telefono) values ('Cristian','Valbuena','1981-06-25','310569874');
insert into Paciente (nombre,apellido,fechaNaci,telefono) values ('Sara','Uribe','1975-11-19','3001456233');
insert into Paciente (nombre,apellido,fechaNaci,telefono) values ('Andres','Sarria','1986-08-23','3225698745');
insert into Paciente (nombre,apellido,fechaNaci,telefono) values ('Karla','Gutierrez','1999-12-18','3101236545');


insert into Medico (nombre, apellido, telefono) values ('Piedad','Valencia','306566987');
insert into Medico (nombre, apellido, telefono) values ('Carla','Velez','311452698');
insert into Medico (nombre, apellido, telefono) values ('Luna','Rpdriguez','302956987');
insert into Medico (nombre, apellido, telefono) values ('Fernando','Sarria','3025468978');

insert into CitaMedica (idPaciente,idMedico) values (1,4);

insert into Usuario (correo, password,rol) values ('admin@hospital.com','1234','admin');
insert into Usuario (correo, password, rol) values ('medico@hospital.com', 'medico123', 'medico');
insert into Usuario (correo, password, rol) values ('paciente@test.com', 'paciente123', 'paciente');

