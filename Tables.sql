
create table mesa (
id_mesa integer primary key,
num_mesa integer not null
);

create table establecimientos (
    id_establecimiento integer primary key,
    num_establecimiento integer not null,
    telefono text not null,
    direccion text not null
);

create table clientes (
    id_cliente integer primary key,
    num_cliente integer not null,
    apellido_cliente text not null,
    direccion_client text,
    telefono_client text
);

create table platos (
    id_plato integer primary key,
    num_plato integer not null,
    precio_plato integer
);

create table empleados (
    id_empleado integer primary key,
    num_empleado integer not null,
    apellido_empleado text not null,
    telefono text not null,
    direccion text not null, 
    cargo text not null,
    id_establecimiento integer not null,
    foreign key (id_establecimiento) references establecimientos (id_establecimiento)
);

create table factura (
    id_factura integer primary key,
    id_cliente integer not null,
    fecha date not null,
    foreign key (id_cliente) references clientes (id_cliente)
);

create table detalle_factura (
    id_detalle_factura integer primary key,
    id_factura integer not null, 
    id_empleado integer not null, 
    id_plato integer not null,
    id_mesa integer not null,
    foreign key (id_factura) references factura (id_factura),
    foreign key (id_empleado) references empleados (id_empleado),
    foreign key (id_plato) references platos (id_plato),
    foreign key (id_mesa) references mesa (id_mesa)
);

create table reservaciones (
    id_reserva integer not null primary key,
    id_cliente integer not null,
    id_mesa integer,
    fecha_reservacion date not null,
    id_establecimiento integer not null,
    foreign key (id_cliente) references clientes (id_cliente),
    foreign key (id_mesa) references mesa (id_mesa),
    foreign key (id_establecimiento) references establecimientos (id_establecimiento)
);