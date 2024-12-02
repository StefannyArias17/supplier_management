Rem
Rem $Header: sm_cre.sql 15-nov-2024.12:00:00 user Exp $
Rem
Rem sm_cre.sql
Rem
Rem Copyright (c) 2024, Tu Proyecto.
Rem
Rem Este script crea tablas, restricciones asociadas e índices para el esquema
Rem de gestión de proveedores y productos.
Rem
REM Creado por [Ibeth Stefanny Pulido]
REM Fecha de creación: 15 de Noviembre 2024
REM Última modificación: 2 de Diciembre 2024
Rem

   SET FEEDBACK 1
SET NUMWIDTH 10
SET LINESIZE 80
SET TRIMSPOOL ON
SET TAB OFF
SET PAGESIZE 100
SET ECHO OFF 

REM ********************************************************************
REM Crear la tabla SUPPLIER para almacenar la información básica de proveedores.

Prompt ****** Creating SUPPLIER table ....

create table supplier (
   supplier_id     number(10)
      constraint supplier_id_nn not null,
   name_supplier   varchar2(100),
   status_supplier varchar2(10) -- Valores posibles: 'active', 'inactive'
);

create unique index supplier_id_pk on
   supplier (
      supplier_id
   );

alter table supplier add (
   constraint supplier_id_pk primary key ( supplier_id )
);

REM ********************************************************************
REM Crear la tabla SUPPLIER_CONTACT para almacenar los contactos de los proveedores.

Prompt ****** Creating SUPPLIER_CONTACT table ....

create table supplier_contact (
   contact_id    number(10)
      constraint contact_id_nn not null,
   supplier_id   number(10),
   email         varchar2(100),
   phone         varchar2(20),
   address_local varchar2(150)
);

create unique index contact_id_pk on
   supplier_contact (
      contact_id
   );

alter table supplier_contact add (
   constraint contact_id_pk primary key ( contact_id ),
   constraint supplier_contact_fk foreign key ( supplier_id )
      references supplier ( supplier_id )
);

REM ********************************************************************
REM Crear la tabla SUPPLIER_LOCATION para la información geográfica de proveedores.

Prompt ****** Creating SUPPLIER_LOCATION table ....

create table supplier_location (
   location_id    number(10)
      constraint location_id_nn not null,
   supplier_id    number(10),
   state_supplier varchar2(50),
   city           varchar2(50)
);

create unique index location_id_pk on
   supplier_location (
      location_id
   );

alter table supplier_location add (
   constraint location_id_pk primary key ( location_id ),
   constraint supplier_location_fk foreign key ( supplier_id )
      references supplier ( supplier_id )
);

REM ********************************************************************
REM Crear la tabla CATEGORY para almacenar las categorías de productos.

Prompt ****** Creating CATEGORY table ....

create table category (
   category_id   number(10)
      constraint category_id_nn not null,
   category_name varchar2(50)
);

create unique index category_id_pk on
   category (
      category_id
   );

alter table category add (
   constraint category_id_pk primary key ( category_id )
);

REM ********************************************************************
REM Crear la tabla PRODUCT para almacenar información de los productos.

Prompt ****** Creating PRODUCT_STORE table .... 

create table product_store (
   product_id     number(10)
      constraint product_id_nn not null,
   product_name   varchar2(100) not null,
   category_id    number(10) not null,
   supplier_id    number(10) not null,
   price          number(10,2),
   status_product varchar2(20) -- Valores posibles: 'available', 'unavailable'
);

create unique index product_id_pk on
   product_store (
      product_id
   );

alter table product_store add (
   constraint product_id_pk primary key ( product_id ),
   constraint product_supplier_fk foreign key ( supplier_id )
      references supplier ( supplier_id ),
   constraint product_category_fk foreign key ( category_id )
      references category ( category_id )
);

REM ********************************************************************
REM Crear la tabla SUPPLIER_PRODUCT para la relación entre proveedores y productos.

Prompt ****** Creating SUPPLIER_PRODUCT table ....

create table supplier_product (
   supplier_product_id number(10)
      constraint supplier_product_id_nn not null,
   supplier_id         number(10),
   product_id          number(10),
   supplied_quantity   number(10)
);

create unique index supplier_product_id_pk on
   supplier_product (
      supplier_product_id
   );

alter table supplier_product add (
   constraint supplier_product_id_pk primary key ( supplier_product_id ),
   constraint supplier_fk foreign key ( supplier_id )
      references supplier ( supplier_id ),
   constraint product_fk foreign key ( product_id )
      references product_store ( product_id )
);

REM ********************************************************************
REM Crear la tabla PRODUCT_IMPORT_LOCATION para almacenar los lugares de importación.

Prompt ****** Creating PRODUCT_IMPORT_LOCATION table .... 

create table product_import_location (
   supplier_id    number(10) not null,
   import_country varchar2(50) not null,
   import_region  varchar2(50)
);

create unique index pil_supplier_id_pk on
   product_import_location (
      supplier_id
   );

alter table product_import_location add (
   constraint pil_supplier_id_pk primary key ( supplier_id ),
   constraint pil_supplier_fk foreign key ( supplier_id )
      references supplier ( supplier_id )
);


REM ********************************************************************
REM Crear la tabla STOCK para controlar el inventario.

Prompt ****** Creating STOCK table ....

create table stock (
   stock_id           number(10)
      constraint stock_id_nn not null,
   product_id         number(10),
   available_quantity number(10),
   last_update        date
);

create unique index stock_id_pk on
   stock (
      stock_id
   );

alter table stock add (
   constraint stock_id_pk primary key ( stock_id ),
   constraint stock_product_fk foreign key ( product_id )
      references product_store ( product_id )
);

REM ********************************************************************
REM Crear la tabla PURCHASE_HISTORY para registrar el historial de compras.

Prompt ****** Creating PURCHASE_HISTORY table ....

create table purchase_history (
   purchase_id        number(10)
      constraint purchase_id_nn not null,
   supplier_id        number(10),
   product_id         number(10),
   purchase_date      date,
   purchased_quantity number(10)
);

create unique index purchase_id_pk on
   purchase_history (
      purchase_id
   );

alter table purchase_history add (
   constraint purchase_id_pk primary key ( purchase_id ),
   constraint purchase_supplier_fk foreign key ( supplier_id )
      references supplier ( supplier_id ),
   constraint purchase_product_fk foreign key ( product_id )
      references product_store ( product_id )
);

commit;