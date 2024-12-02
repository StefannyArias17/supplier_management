REM **********************************************************
REM Script para poblar las tablas del modelo de proveedores, productos y stock.
REM Fecha de creación: 15 de Noviembre 2024
REM Última modificación: 2 de Diciembre 2024
REM Creado por [Ibeth Stefanny Pulido]
REM **********************************************************

   SET VERIFY OFF;
alter session set nls_language = american;

REM **********************************************************
REM Insertar datos en la tabla SUPPLIER.
Prompt ****** Populating SUPPLIER table ....

insert into supplier values ( 811022876,
                              'OSAKA S.A.S',
                              'active' );
insert into supplier values ( 890900317,
                              'AUTOTECNICA COLOMBIANA S.A.S',
                              'active' );
insert into supplier values ( 890900943,
                              'COLOMBIANA DE COMERCIO S.A',
                              'active' );
insert into supplier values ( 900440961,
                              'YOKOMAR S.A.S',
                              'active' );
insert into supplier values ( 900452215,
                              'MULTIPROYECTOS DMC S.A.S.',
                              'active' );
insert into supplier values ( 900547437,
                              'REDEMOTOS S.A.S.',
                              'active' );
insert into supplier values ( 901249413,
                              'AUTECO MOBILITY SAS',
                              'active' );

REM **********************************************************
REM Insertar datos en la tabla SUPPLIER_CONTACT.
Prompt ****** Populating SUPPLIER_CONTACT table ....

insert into supplier_contact values ( 1,
                                      811022876,
                                      'contabilidad@osaka.com.co',
                                      '(601) 800-0000',
                                      'CR 48 C 100 SUR 72 BG 12' );
insert into supplier_contact values ( 2,
                                      890900317,
                                      'notificaciones@auteco.com.co',
                                      '(601) 800-0001',
                                      'CR 43 44 60' );
insert into supplier_contact values ( 3,
                                      890900943,
                                      'legal@corbeta.com.co',
                                      '(601) 800-0002',
                                      'CL 11 31 A 42' );
insert into supplier_contact values ( 4,
                                      900440961,
                                      'contabilidad@yokomar.com',
                                      '(601) 351-5119',
                                      'CR 39 43 60' );
insert into supplier_contact values ( 5,
                                      900452215,
                                      'contabilidad@mapacheparts.com',
                                      '(601) 800-0003',
                                      'CLL 10 A 45 12' );
insert into supplier_contact values ( 6,
                                      900547437,
                                      'contabilidad.01@redemotos.com',
                                      '(601) 800-0004',
                                      'CR 18 46 83 BRR BOLIVAR' );
insert into supplier_contact values ( 7,
                                      901249413,
                                      'notificacionesjuridicas@autecomobility.com',
                                      '(601) 800-0005',
                                      'VIA LAS PALMAS KM 15 750 LC L 104' );

REM **********************************************************
REM Insertar datos en la tabla SUPPLIER_LOCATION.
Prompt ****** Populating SUPPLIER_LOCATION table ....

insert into supplier_location values ( 1,
                                       811022876,
                                       'Antioquia',
                                       'La Estrella' );
insert into supplier_location values ( 2,
                                       890900317,
                                       'Antioquia',
                                       'Itagüí' );
insert into supplier_location values ( 3,
                                       890900943,
                                       'Cundinamarca',
                                       'Bogotá' );
insert into supplier_location values ( 4,
                                       900440961,
                                       'Atlántico',
                                       'Barranquilla' );
insert into supplier_location values ( 5,
                                       900452215,
                                       'Cundinamarca',
                                       'Bogotá' );
insert into supplier_location values ( 6,
                                       900547437,
                                       'Santander',
                                       'Bucaramanga' );
insert into supplier_location values ( 7,
                                       901249413,
                                       'Antioquia',
                                       'Envigado' );

REM **********************************************************
REM Insertar datos en la tabla CATEGORY.
Prompt ****** Populating CATEGORY table ....

insert into category values ( 1,
                              'Parte del motor' );
insert into category values ( 2,
                              'Lujo' );
insert into category values ( 3,
                              'General' );
insert into category values ( 4,
                              'Repuestos eléctricos' );
insert into category values ( 5,
                              'Accesorios exteriores' );

REM **********************************************************
REM Insertar datos en la tabla PRODUCT_STORE.
Prompt ****** Populating PRODUCT_STORE table ....

insert into product_store values ( 1,
                                   'Pistón Compacto',
                                   1,
                                   811022876,
                                   280000,
                                   'available' );
insert into product_store values ( 2,
                                   'Cadena de Distribución',
                                   1,
                                   890900317,
                                   350000,
                                   'available' );
insert into product_store values ( 3,
                                   'Manillar de Lujo',
                                   2,
                                   890900943,
                                   150000,
                                   'available' );
insert into product_store values ( 4,
                                   'Parrilla Trasera',
                                   5,
                                   900440961,
                                   90000,
                                   'available' );
insert into product_store values ( 5,
                                   'Carburador Completo',
                                   1,
                                   900452215,
                                   850000,
                                   'unavailable' );
insert into product_store values ( 6,
                                   'Retrovisor Premium',
                                   2,
                                   900547437,
                                   120000,
                                   'available' );
insert into product_store values ( 7,
                                   'Bujía Alta Potencia',
                                   3,
                                   901249413,
                                   35000,
                                   'available' );
insert into product_store values ( 8,
                                   'Cámara de Aire',
                                   3,
                                   811022876,
                                   40000,
                                   'available' );
insert into product_store values ( 9,
                                   'Amortiguador Delantero',
                                   1,
                                   890900317,
                                   400000,
                                   'unavailable' );
insert into product_store values ( 10,
                                   'Silenciador Cromado',
                                   2,
                                   890900943,
                                   600000,
                                   'available' );
insert into product_store values ( 11,
                                   'Filtro de Aceite',
                                   3,
                                   900440961,
                                   20000,
                                   'available' );
insert into product_store values ( 12,
                                   'Farola Delantera',
                                   4,
                                   900452215,
                                   120000,
                                   'available' );
insert into product_store values ( 13,
                                   'Kit de Arrastre',
                                   1,
                                   900547437,
                                   420000,
                                   'unavailable' );
insert into product_store values ( 14,
                                   'Luz Trasera LED',
                                   4,
                                   901249413,
                                   65000,
                                   'available' );
insert into product_store values ( 15,
                                   'Escape Deportivo',
                                   2,
                                   811022876,
                                   500000,
                                   'available' );
insert into product_store values ( 16,
                                   'Espejo Convexo',
                                   2,
                                   890900317,
                                   85000,
                                   'available' );
insert into product_store values ( 17,
                                   'Pastillas de Freno',
                                   3,
                                   890900943,
                                   75000,
                                   'available' );
insert into product_store values ( 18,
                                   'Llanta Delantera',
                                   3,
                                   900440961,
                                   320000,
                                   'unavailable' );
insert into product_store values ( 19,
                                   'Tapa de Gasolina',
                                   5,
                                   900452215,
                                   30000,
                                   'available' );
insert into product_store values ( 20,
                                   'Radiador Compacto',
                                   1,
                                   900547437,
                                   580000,
                                   'available' );
insert into product_store values ( 21,
                                   'Intermitentes LED',
                                   4,
                                   901249413,
                                   50000,
                                   'available' );
insert into product_store values ( 22,
                                   'Asiento Ergonómico',
                                   2,
                                   811022876,
                                   220000,
                                   'available' );
insert into product_store values ( 23,
                                   'Disco de Freno',
                                   3,
                                   890900317,
                                   120000,
                                   'unavailable' );
insert into product_store values ( 24,
                                   'Protector de Cadena',
                                   5,
                                   890900943,
                                   70000,
                                   'available' );
insert into product_store values ( 25,
                                   'Bobina de Encendido',
                                   4,
                                   900440961,
                                   180000,
                                   'available' );
insert into product_store values ( 26,
                                   'Kit de Suspensión',
                                   1,
                                   900452215,
                                   920000,
                                   'available' );
insert into product_store values ( 27,
                                   'Parabrisas Transparente',
                                   5,
                                   900547437,
                                   150000,
                                   'available' );
insert into product_store values ( 28,
                                   'Interruptor de Luces',
                                   4,
                                   901249413,
                                   70000,
                                   'unavailable' );
insert into product_store values ( 29,
                                   'Rejilla de Ventilación',
                                   5,
                                   811022876,
                                   55000,
                                   'available' );
insert into product_store values ( 30,
                                   'Motor Completo',
                                   1,
                                   890900317,
                                   3200000,
                                   'unavailable' );
insert into product_store values ( 31,
                                   'Protector de Amortiguador',
                                   5,
                                   890900943,
                                   50000,
                                   'available' );
insert into product_store values ( 32,
                                   'Cilindro de Freno',
                                   3,
                                   900440961,
                                   230000,
                                   'available' );
insert into product_store values ( 33,
                                   'Interruptor de Encendido',
                                   4,
                                   900452215,
                                   80000,
                                   'available' );
insert into product_store values ( 34,
                                   'Protector de Escape',
                                   5,
                                   900547437,
                                   60000,
                                   'available' );
insert into product_store values ( 35,
                                   'Filtro de Aire',
                                   3,
                                   901249413,
                                   18000,
                                   'available' );
insert into product_store values ( 36,
                                   'Cargador de Batería',
                                   4,
                                   811022876,
                                   95000,
                                   'unavailable' );
insert into product_store values ( 37,
                                   'Llanta Trasera',
                                   3,
                                   890900317,
                                   310000,
                                   'available' );
insert into product_store values ( 38,
                                   'Caja de Herramientas',
                                   5,
                                   890900943,
                                   85000,
                                   'available' );
insert into product_store values ( 39,
                                   'Regulador de Voltaje',
                                   4,
                                   900440961,
                                   140000,
                                   'available' );
insert into product_store values ( 40,
                                   'Guarda Barro',
                                   5,
                                   900452215,
                                   35000,
                                   'available' );
insert into product_store values ( 41,
                                   'Tornillo de Ajuste',
                                   3,
                                   900547437,
                                   1500,
                                   'available' );
insert into product_store values ( 42,
                                   'Cadena de Seguridad',
                                   5,
                                   901249413,
                                   30000,
                                   'available' );
insert into product_store values ( 43,
                                   'Lubricante Multiuso',
                                   3,
                                   811022876,
                                   12000,
                                   'available' );
insert into product_store values ( 44,
                                   'Control de Manubrio',
                                   4,
                                   890900317,
                                   110000,
                                   'available' );
insert into product_store values ( 45,
                                   'Correa de Transmisión',
                                   1,
                                   890900943,
                                   240000,
                                   'available' );

REM **********************************************************
REM Poblar la tabla SUPPLIER_PRODUCT.
Prompt ****** Populating SUPPLIER_PRODUCT table ....

insert into supplier_product values ( 1,
                                      811022876,
                                      1,
                                      500 );
insert into supplier_product values ( 2,
                                      890900317,
                                      2,
                                      300 );
insert into supplier_product values ( 3,
                                      890900943,
                                      3,
                                      150 );
insert into supplier_product values ( 4,
                                      900440961,
                                      4,
                                      400 );
insert into supplier_product values ( 5,
                                      900452215,
                                      5,
                                      0 );
insert into supplier_product values ( 6,
                                      900547437,
                                      6,
                                      50 );
insert into supplier_product values ( 7,
                                      901249413,
                                      7,
                                      700 );

REM **********************************************************
REM Poblar la tabla PRODUCT_IMPORT_LOCATION.
Prompt ****** Populating PRODUCT_IMPORT_LOCATION table ....

insert into product_import_location values ( 811022876,
                                             'Japan',
                                             'Kyoto' );
insert into product_import_location values ( 890900317,
                                             'Colombia',
                                             'Medellín' );
insert into product_import_location values ( 890900943,
                                             'China',
                                             'Guangzhou' );
insert into product_import_location values ( 900440961,
                                             'India',
                                             'Mumbai' );
insert into product_import_location values ( 900452215,
                                             'Colombia',
                                             'Bogotá' );
insert into product_import_location values ( 900547437,
                                             'China',
                                             'Shenzhen' );
insert into product_import_location values ( 901249413,
                                             'Japan',
                                             'Osaka' );

REM **********************************************************
REM Poblar la tabla STOCK.
Prompt ****** Populating STOCK table ....

insert into stock values ( 1,
                           1,
                           100,
                           to_date('2024-11-01','YYYY-MM-DD') );
insert into stock values ( 2,
                           2,
                           50,
                           to_date('2024-11-02','YYYY-MM-DD') );
insert into stock values ( 3,
                           3,
                           20,
                           to_date('2024-11-03','YYYY-MM-DD') );
insert into stock values ( 4,
                           4,
                           80,
                           to_date('2024-11-04','YYYY-MM-DD') );
insert into stock values ( 5,
                           5,
                           0,
                           to_date('2024-11-05','YYYY-MM-DD') );
insert into stock values ( 6,
                           6,
                           15,
                           to_date('2024-11-06','YYYY-MM-DD') );
insert into stock values ( 7,
                           7,
                           200,
                           to_date('2024-11-07','YYYY-MM-DD') );

REM **********************************************************
REM Poblar la tabla PURCHASE_HISTORY.
Prompt ****** Populating PURCHASE_HISTORY table ....

insert into purchase_history values ( 1,
                                      811022876,
                                      1,
                                      to_date('2024-11-01','YYYY-MM-DD'),
                                      20);
insert into purchase_history values ( 2,
                                      890900317,
                                      2,
                                      to_date('2024-11-02','YYYY-MM-DD'),
                                      15);
insert into purchase_history values ( 3,
                                      890900943,
                                      3,
                                      to_date('2024-11-03','YYYY-MM-DD'),
                                      5);
insert into purchase_history values ( 4,
                                      900440961,
                                      4,
                                      to_date('2024-11-04','YYYY-MM-DD'),
                                      10);
insert into purchase_history values ( 5,
                                      900452215,
                                      5,
                                      to_date('2024-11-05','YYYY-MM-DD'),
                                      0);

commit;

REM **********************************************************
REM Datos poblados exitosamente.