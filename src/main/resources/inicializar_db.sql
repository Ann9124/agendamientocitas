drop table Medico; 
drop table Paciente;
drop table CitaMedica;

create table Paciente (id int auto_increment primary key not null, nombre varchar (255) not null, apellido varchar (255) not null, fechaNaci date not null, telefono varchar (255) not null);
select * from Paciente;
insert into Paciente (nombre, apellido, fechaNaci,telefono) values ('Noa', 'Guzman','1995/02/15','3114057896');
insert into Paciente (nombre, apellido, fechaNaci,telefono) values ('Laura', 'Gomez','1989/05/28','321059896');
insert into Paciente (nombre, apellido, fechaNaci,telefono) values ('Pedro', 'Rangel','1993/09/30','302569874');
insert into Paciente (nombre, apellido, fechaNaci,telefono) values ('Carlos','Lopez','1999/09/20','322569896');
insert into Paciente (nombre,apellido,fechaNaci,telefono) values ('Pablo','Rangel','1987-01-10','312456987');
insert into Paciente (nombre,apellido,fechaNaci,telefono) values ('Cristian','Valbuena','1981-06-25','310569874');
insert into Paciente (nombre,apellido,fechaNaci,telefono) values ('Sara','Uribe','1975-11-19','3001456233');
insert into Paciente (nombre,apellido,fechaNaci,telefono) values ('Andres','Sarria','1986-08-23','3225698745');
insert into Paciente (nombre,apellido,fechaNaci,telefono) values ('Karla','Gutierrez','1999-12-18','3101236545');
delete from Paciente where id =14;


create table Medico (id int auto_increment primary key not null, nombre varchar (255) not null, apellido varchar (255) not null, fechaNaci date not null, telefono varchar (255) not null);
select * from Medico;
insert into Medico (nombre, apellido, fechaNaci,telefono) values ('Piedad','Valencia','1982/12/24','302956987');
insert into Medico (nombre, apellido, fechaNaci,telefono) values ('Cristobal','Vanegas','1989/07/29','3220099878');
insert into Medico (nombre, apellido, fechaNaci,telefono) values ('Manuela','Ceballos','1979/10/24','3001499539');
insert into Medico (nombre, apellido, fechaNaci,telefono) values ('Natalia', 'Aristizabal','1987/12/31','3219696585');
insert into Medico (nombre, apellido, fechaNaci,telefono) values ('Nidia', 'Garcia','1990/04/02','3203698799');

create table CitaMedica (id int auto_increment primary key not null, idPaciente int not null, idMedico int not null);
select * from CitaMedica;
alter table CitaMedica add foreign key (idMedico) references Medico(id);
alter table CitaMedica add foreign key (idPaciente) references Paciente (id);
insert into CitaMedica (idPaciente,idMedico) values (1,4);
insert into CitaMedica (idPaciente,idMedico) values (1,5);
insert into CitaMedica (idPaciente,idMedico) values (3,2);
insert into CitaMedica (idPaciente,idMedico) values (9,2);

select * from Paciente;

desc Paciente;
desc Medico;
desc CitaMedica;
insert into Paciente(nombre,apellido,fechaNaci,telefono) values (?,?,now(),?);


create table Usuarios(id int auto_increment primary key not null, correo varchar (100) not null, contraseña varchar(100) not null, rol varchar (20) not null);
select * from Usuarios;
insert into Usuarios (correo, contraseña,rol) values ('admin@hospital.com','1234','admin');



insert into usuarios (correo, contraseña, rol) values ('admin@hospital.com', 'admin123', 'admin');


insert into usuarios (correo, contraseña, rol) values ('medico@hospital.com', 'medico123', 'medico');
-- Supongamos que el ID generado fue 2
insert into medico (nombre, especialidad, id_usuario) values ('Dr. Casa', 'Cardiología', 2);

-- 3. Insertar un Paciente
insert into usuarios (correo, contraseña, rol) values ('paciente@test.com', 'paciente123', 'paciente');
-- Supongamos que el ID generado fue 3
insert into paciente (nombre, id_usuario) values ('Juan Perez', 3);