CREATE TABLE ENCABEZADOFACTURA (

EncIdLote int not null,
EncAñoFactura  int not null ,
EncNroDocumento nchar(15 )not null,
EncCuitAcreedor bigint not null,     
EncRazonSocial  nvarchar(50) null,                                 
EncImporteTotal float not null,
EncFechaDocumento  datetime not null,  
EncMotivoBajaModificacion nvarchar(100) null,                                                                            
IdLoteAnterior int null,
FechaCargaDocumento  datetime null, 
agrupamiento varchar(10) null,
estadoFactura smallint null,
motivoRechazoFactura smallint null,
tipoDePago smallint null,
nroCupon    int null,
cuentAlternativa varchar(10) null
);


GO
CREATE TABLE ITEMFACTURA (
ItIdLote int not null,
ItAñoFactura  int not null,
ItNroDocumento  nchar(15) not null,
ItCuitAcreedor  bigint not null,
ItNroRenglonDelGasto  int not null,
ItObjetoDelGasto bigint not null,
descripcionDelGasto nvarchar(100) null,
ItImporteDelGasto float not null,
ItConceptoGasto varchar(50) null);

INSERT INTO ITEMFACTURA (ItIdLote,ItAñoFactura,ItNroDocumento,ItCuitAcreedor,ItNroRenglonDelGasto,ItObjetoDelGasto,descripcionDelGasto,ItImporteDelGasto,ItConceptoGasto) VALUES
(1,2018,1,20303332805,1,234,'Insumos',50.00,'textolibre');

GO
CREATE TABLE RENDICION(
ReIdLote  int not null,
RePeriodo int not null,
ReDescripcion varchar(50) null,
ReNroCajaChica int null,
ReOperadorCarga varchar(11) not null,
ReFechaCarga datetime not null,
ReMontoTotalRendicion float not null,
ReTipoRendicion  int not null,
EstadoRendicion  char(1) null,
BajaModificacionEstado char(1) null,
BajaModificacionFecha datetime null,
MotivoRechazo varchar(100) null,
AdelantosEnEfectivo float null,
IncrementoAdelantosEnEfectivo float null,
Borrador bit null);


CREATE TABLE LOTE(
ReIdLote int,
fechaLote date,
descripcion varchar(50)
);
INSERT INTO dbo.LOTE (ReIdLote,fechaLote,descripcion) values(1,GETDATE(),'Desc');
select * from dbo.RENDICION;
select * from dbo.ENCABEZADOFACTURA;
select * from dbo.ITEMFACTURA;

INSERT INTO dbo.RENDICION (ReIdLote,RePeriodo,ReDescripcion,ReNroCajaChica,ReOperadorCarga,ReFechaCarga,ReMontoTotalRendicion,ReTipoRendicion)values( 1,1,'Rendicion de Enero.',1,'OPERADOR 1', GETDATE() ,100.00,1);

INSERT INTO dbo.ENCABEZADOFACTURA(EncIdLote,EncAñoFactura,EncNroDocumento,EncCuitAcreedor,EncImporteTotal,EncFechaDocumento) VALUES
(1,2018,1,20303332805,50.00,GETDATE());
INSERT INTO dbo.ENCABEZADOFACTURA(EncIdLote,EncAñoFactura,EncNroDocumento,EncCuitAcreedor,EncImporteTotal,EncFechaDocumento) VALUES
(1,2018,2,20303332805,50.00,GETDATE());

INSERT INTO ITEMFACTURA (ItIdLote,ItAñoFactura,ItNroDocumento,ItCuitAcreedor,ItNroRenglonDelGasto,ItObjetoDelGasto,descripcionDelGasto,ItImporteDelGasto,ItConceptoGasto) VALUES
(1,2018,1,20303332805,1,234,'Insumos',50.00,'textolibre');

INSERT INTO ITEMFACTURA (ItIdLote,ItAñoFactura,ItNroDocumento,ItCuitAcreedor,ItNroRenglonDelGasto,ItObjetoDelGasto,descripcionDelGasto,ItImporteDelGasto,ItConceptoGasto) VALUES
(1,2018,2,20303332805,1,234,'Insumos',25.00,'textolibre');
INSERT INTO ITEMFACTURA (ItIdLote,ItAñoFactura,ItNroDocumento,ItCuitAcreedor,ItNroRenglonDelGasto,ItObjetoDelGasto,descripcionDelGasto,ItImporteDelGasto,ItConceptoGasto) VALUES
(1,2018,2,20303332805,1,234,'Insumos',25.00,'textolibre');
