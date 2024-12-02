REM ************************************************************
REM $Header: supplier_product_cre.sql 30-nov-2024.12:00:00 user Exp $
REM 
REM sm_comnt.sql
REM
REM 
REM Este script agrega los comentarios descriptivos para las tablas, 
REM columnas y relaciones en el esquema de gestión de proveedores y productos.
REM 
REM Fecha de creación: 15 de Noviembre 2024
REM Última modificación: 2 de Diciembre 2024
REM Creado por [Ibeth Stefanny Pulido]
REM ************************************************************

   SET FEEDBACK 1
SET NUMWIDTH 10
SET LINESIZE 80
SET TRIMSPOOL ON
SET TAB OFF
SET PAGESIZE 100
SET ECHO OFF 

REM ********************************************************************
comment on table supplier is
   'Tabla que almacena la información básica de los proveedores, 
contiene los datos esenciales como ID, nombre y estado (activo o inactivo). 
Contiene registros de proveedores con detalles clave.';

comment on column supplier.supplier_id is
   'Clave primaria de la tabla de proveedores. Identificador único para cada proveedor.';

comment on column supplier.name_supplier is
   'Nombre del proveedor. Es un campo obligatorio que describe el nombre comercial del proveedor.';

comment on column supplier.status_supplier is
   'Estado del proveedor. Indica si el proveedor está activo o inactivo. Los valores posibles son ''active'' e ''inactive''.'
   ; 

REM ********************************************************************
comment on table supplier_contact is
   'Tabla que almacena los datos de contacto de los proveedores, 
incluyendo correo electrónico, teléfono y dirección.';

comment on column supplier_contact.contact_id is
   'Clave primaria de la tabla de contactos. Identificador único para cada registro de contacto de proveedor.';

comment on column supplier_contact.supplier_id is
   'ID del proveedor al que pertenece este contacto. Clave foránea a la tabla supplier.';

comment on column supplier_contact.email is
   'Correo electrónico del proveedor. Es un campo obligatorio para la comunicación electrónica.';

comment on column supplier_contact.phone is
   'Número de teléfono del proveedor. Especifica un número de contacto telefónico.';

comment on column supplier_contact.address_local is
   'Dirección local del proveedor. Incluye la calle, ciudad y otros detalles de ubicación.'; 

REM ********************************************************************
comment on table supplier_location is
   'Tabla que almacena información geográfica de los proveedores, 
incluyendo estado y ciudad donde se encuentran.';

comment on column supplier_location.location_id is
   'Clave primaria de la tabla de ubicación. Identificador único para cada ubicación de proveedor.';

comment on column supplier_location.supplier_id is
   'ID del proveedor relacionado con esta ubicación. Clave foránea a la tabla supplier.';

comment on column supplier_location.state_supplier is
   'Estado donde se encuentra el proveedor.';

comment on column supplier_location.city is
   'Ciudad donde se localiza el proveedor.'; 

REM ********************************************************************
comment on table category is
   'Tabla que almacena las categorías de los productos disponibles. 
Contiene registros de categorías que agrupan productos similares.';

comment on column category.category_id is
   'Clave primaria de la tabla de categorías. Identificador único para cada categoría.';

comment on column category.category_name is
   'Nombre de la categoría del producto. Es un campo obligatorio que describe la categoría.'; 

REM ********************************************************************
comment on table product_store is
   'Tabla que almacena la información de los productos disponibles, 
incluyendo nombre, precio, estado, y su relación con proveedores y categorías.';

comment on column product_store.product_id is
   'Clave primaria de la tabla de productos. Identificador único para cada producto.';

comment on column product_store.product_name is
   'Nombre del producto. Es un campo obligatorio que describe el nombre del producto.';

comment on column product_store.category_id is
   'ID de la categoría del producto. Clave foránea a la tabla category.';

comment on column product_store.supplier_id is
   'ID del proveedor del producto. Clave foránea a la tabla supplier.';

comment on column product_store.price is
   'Precio del producto. Indica el costo del producto, con dos decimales.';

comment on column product_store.status_product is
   'Estado del producto. Indica si el producto está disponible o no. Los valores posibles son ''available'' e ''unavailable''.'
   ; 

REM ********************************************************************
comment on table product_import_location is
   'Tabla que almacena los lugares de importación de los productos, 
especificando el país y región donde los productos son importados.';

comment on column product_import_location.supplier_id is
   'ID del proveedor que importa productos. Clave foránea a la tabla supplier.';

comment on column product_import_location.import_country is
   'País de importación del producto. Es un campo obligatorio que define el país.';

comment on column product_import_location.import_region is
   'Región de importación del producto. Este campo es opcional y describe la región específica.'; 

REM ********************************************************************
comment on table supplier_product is
   'Tabla que gestiona la relación entre proveedores y productos. 
Contiene la cantidad suministrada por cada proveedor para cada producto.';

comment on column supplier_product.supplier_product_id is
   'Clave primaria de la tabla de proveedor-producto. Identificador único para cada relación de proveedor y producto.';

comment on column supplier_product.supplier_id is
   'ID del proveedor. Clave foránea a la tabla supplier.';

comment on column supplier_product.product_id is
   'ID del producto. Clave foránea a la tabla product_store.';

comment on column supplier_product.supplied_quantity is
   'Cantidad suministrada del producto por el proveedor. Registra la cantidad de unidades suministradas.'; 

REM ********************************************************************
comment on table stock is
   'Tabla que controla el inventario de productos. Almacena la cantidad disponible de cada producto.';

comment on column stock.stock_id is
   'Clave primaria de la tabla de inventario. Identificador único para cada registro de inventario.';

comment on column stock.product_id is
   'ID del producto. Clave foránea a la tabla product_store.';

comment on column stock.available_quantity is
   'Cantidad disponible del producto en el inventario.';

comment on column stock.last_update is
   'Fecha de la última actualización del inventario. Registra la última modificación de las existencias.'; 

REM ********************************************************************
comment on table purchase_history is
   'Tabla que almacena el historial de compras. Registra las compras realizadas por los proveedores, 
incluyendo la cantidad comprada y la fecha de compra.';

comment on column purchase_history.purchase_id is
   'Clave primaria de la tabla de historial de compras. Identificador único para cada compra.';

comment on column purchase_history.supplier_id is
   'ID del proveedor que realizó la compra. Clave foránea a la tabla supplier.';

comment on column purchase_history.product_id is
   'ID del producto adquirido. Clave foránea a la tabla product_store.';

comment on column purchase_history.purchase_date is
   'Fecha de la compra realizada. Indica el día en que se realizó la compra.';

comment on column purchase_history.purchased_quantity is
   'Cantidad adquirida del producto en la compra. Registra el número de unidades compradas.';

commit;