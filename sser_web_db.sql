create database sser_web_db default character set utf8mb4;
use sser_web_db;

create table cargo (
  id_cargo  int primary key not null,
  nom_cargo varchar(20) not null
  );
  
  create table  usuario (
  id_usu bigint primary key not null auto_increment,
  nom_usu varchar(45) not null,
  cont_usu varchar(45) not null
);

create table empleado (
  id_empl int primary key not null,
  nom_empl varchar(45) not null,
  ape_empl varchar(45) not null,
  ced_empl bigint not null,
  tel_empl bigint not null,
  dir_empl varchar(45) not null,
  corr_empl varchar(45) not null,
  sal_empl bigint not null,  
  cargo int not null,
  usuario bigint unique not null,
  constraint cargo_empleado_fk foreign key (cargo) references cargo (id_cargo),
  constraint usuario_empleado_fk foreign key (usuario) references usuario (id_usu)
);

create table cliente (
  id_client bigint primary key not null,
  nom_client varchar(45) not null,
  ape_client varchar(45) not null,
  ced_client bigint  not null,
  tel_client bigint not null,
  dir_client varchar(45) not null,
  corr_client varchar(45) not null  
  );

create table equipo (
  id_equi bigint primary key not null,
  tipo_equip varchar(45) not null,
  marc_equip varchar(45) not null,
  mode_equip varchar(45) not null,  
  seri_equip bigint not null
);

create table orden_reparacion (
  id_orden bigint primary key not null,
  est_orden varchar(45) not null,
  serv_orden varchar(45) not null,
  obs_orden varchar(255) not null,
  cliente bigint not null,
  equipo bigint not null,
  empleado int not null,
  constraint cliente_ordenr_fk foreign key (cliente) references cliente (id_client),
  constraint equipo_ordenr_fk foreign key (equipo) references equipo (id_equi),
  constraint empleado_ordenr_fk foreign key (empleado) references empleado (id_empl)
);

insert into cargo values (1, "Técnico");
insert into cargo values (2, "Recepcionista");
insert into cargo values (3, "Control de Calidad");
insert into cargo values (4, "Administración");
insert into cargo values (5, "Usuario maestro");

insert into usuario (nom_usu, cont_usu) values ("Fernando", "Adso2023");
insert into usuario (nom_usu, cont_usu) values ("Yisela", "12345");
insert into usuario (nom_usu, cont_usu) values ("Laura", "pass123");

insert into empleado values (1, "Juan Fernando", "Ordóñez Hernádez", 1234567890, 3173341333, "Cra 47 # 29c -71 sur", "fercho24lonewolf@hotmail.com", 5555555, 1, 1);
insert into empleado values (2, "Yisela Leticia", "Hernádez Macea", 9012345678, 3100000000, "Diag 5 # 32 -60", "yiahernandez@gmail.com", 3333333, 1, 2);

insert into cliente values (1, "Laura Nataly", "Giraldo", 110120130140, 3113113031, "Cll 3 #30 -64", "Laura123@gmail.com");
insert into cliente values (2, "Laura", "Valero", 80454545, 3153453768, "Cra 32 #18 -12", "V41er0@gmail.com");

insert into equipo values (1, "TV", "SONY", "tv50s", 11122435656545);
insert into equipo values (2, "DVD", "Simply", "dvd-200p", 123423434);
insert into equipo values (3, "Equipo de Sonido", "LG", "300w-5.1c", 534322344);

insert into orden_reparacion values (1, "Por Reparar", "Garantia de fabrica", "No enciende", 1, 1, 1);
insert into orden_reparacion values (2, "Pendiente por repuesto", "Garantia Particular", "No lee CDs", 2, 2, 1);
insert into orden_reparacion values (3, "Reparado", "Particular", "No da audio", 1, 3, 2);