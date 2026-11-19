# LiquitayaDana_MabelCastillo_TPFinal_DB_IES7
# Betel – Base de datos de una cadena de supermercados

**Trabajo Práctico Final – Base de Datos – IES7**
**Alumnos:** Liquitaya Dana Paola, Castillo Mabel Celinda
**Profesor:** Manuel Serrano
**Año:** 2026

---

## 1. Descripción del proyecto

Betel es una cadena de supermercados con sucursales en San Pedro de Jujuy, Monterrico y San Salvador de Jujuy.
Este proyecto diseña e implementa la base de datos que permite administrar sus operaciones comerciales:

- Sucursales, depósitos, cajas y puntos de venta.
- Catálogo de productos, categorías, marcas, unidades de medida y lotes.
- **Stock independiente por sucursal**, con historial de movimientos.
- Precios (globales y por sucursal) y promociones.
- Proveedores, compras y recepciones de mercadería.
- Ventas, pagos, devoluciones y transferencias entre sucursales.
- Facturación (Factura A) con IVA discriminado.
- Usuarios, roles, permisos, cargos y ascensos de empleados.

## 2. Tecnologías

| Elemento | Detalle |
|---|---|
| Motor de base de datos | MySQL 8.4.3 |
| Nombre de la base | `supermercado_betel` |
| Juego de caracteres | utf8mb4 |
| Motor de almacenamiento | InnoDB |

## 3. Estructura del repositorio

```
├── README.md
├── sql/         Scripts de la base de datos
├── docs/        Documento del proyecto (PDF)
└── diagrama/    Diagrama entidad-relación (PNG)
```

## 4. Modelo de datos

La base tiene **44 tablas**, agrupadas por módulo:

| Módulo | Tablas |
|---|---|
| Ubicación y sucursales | `provincias`, `localidades`, `sucursales`, `depositos`, `cajas`, `puntos_venta` |
| Productos | `categorias`, `marcas`, `unidades_medida`, `productos`, `lotes` |
| Stock | `stock`, `movimientos_stock` |
| Precios y promociones | `precios_globales`, `precios_sucursal`, `promociones`, `detalle_promociones` |
| Proveedores y compras | `proveedores`, `productos_proveedores`, `compras`, `detalle_compras`, `recepciones`, `detalle_recepciones` |
| Ventas | `clientes`, `ventas`, `detalle_ventas`, `pagos`, `medios_pago`, `devoluciones`, `detalle_devoluciones` |
| Transferencias | `transferencias`, `detalle_transferencias` |
| Seguridad y personal | `usuarios`, `roles`, `permisos`, `roles_permisos`, `usuarios_roles`, `cargos`, `historial_cargos`,`empresas` |
| Facturación | `condiciones_iva`, `alicuotas_iva`, `tipos_comprobante`, `facturas`, `detalle_facturas` |

Diagrama entidad-relación: ver la carpeta `diagrama/`.

## 5. Normalización (hasta 3FN)

- **1FN:** no hay grupos repetidos. Una venta no guarda sus productos en una sola fila: cada producto vendido es un renglón en `detalle_ventas`.
- **2FN:** en `stock` la clave es (producto, depósito) y la cantidad depende de ambos a la vez. Lo mismo ocurre en `productos_proveedores`.
- **3FN:** no hay dependencias transitivas. Ejemplo: la sucursal no guarda "San Pedro de Jujuy, Jujuy" como texto. Apunta a `localidades`, que apunta a `provincias`. La marca y la categoría de un producto también están en tablas propias.

**Desnormalización controlada (a propósito, para conservar el historial):**
- `detalle_ventas.precio_unitario` guarda el precio del momento, para que un cambio de precio no altere ventas pasadas.
- `facturas` copia los datos fiscales del cliente (CUIT, razón social, domicilio), porque una factura es un documento legal y no debe cambiar.

## 6. Integridad y buenas prácticas aplicadas

- **Claves primarias y foráneas** en todas las relaciones.
- **Campos únicos** (`UNIQUE`): código de sucursal, DNI, CUIT, código de barras, número de venta, entre otros.
- **Valores por defecto** (`DEFAULT`): por ejemplo `estado = 'Activo'` y stock inicial en 0.
- **Borrado lógico:** los registros no se eliminan, se marcan como inactivos mediante la columna `estado`.
- **Auditoría de registros:** las tablas principales tienen `fecha_creacion` y `fecha_modificacion` (esta última se actualiza sola con `ON UPDATE CURRENT_TIMESTAMP`).

## 7. Automatización con trigger

**`trg_detalle_ventas_descuenta_stock`** (`AFTER INSERT` sobre `detalle_ventas`):

1. Detecta la sucursal donde se hizo la venta (venta → caja → sucursal → depósito).
2. Descuenta la cantidad vendida del stock **solo de esa sucursal**.
3. Si no hay stock suficiente, cancela la operación con un error.
4. Registra el movimiento en `movimientos_stock`.

## 8. Facturación y ascensos

- **Factura A:** `facturas` y `detalle_facturas` guardan el IVA discriminado por renglón. Los clientes tienen CUIT y condición frente al IVA, y cada producto tiene su alícuota.
- **Ascensos:** `cargos` define los puestos y `ascensos` guarda el historial de cambios de cargo de cada empleado, con motivo y quién lo autorizó.

## 9. Instalación y ejecución

1. Instalar MySQL 8.4 o superior.
2. Abrir una consola de MySQL con un usuario con permisos para crear bases de datos.
3. Ejecutar los scripts de la carpeta `sql/` **en este orden**:
   1.-- 1) Catálogos / tablas padre (sin FK)
--    provincias, alicuotas_iva, condiciones_iva, tipos_comprobante,
--    medios_pago, unidades_medida, categorias, marcas, cargos,
--    roles, permisos, empresas, promociones

-- 2) Segundo nivel
--    localidades (→ provincias), sucursales, roles_permisos,
--    clientes (→ condiciones_iva), proveedores, productos

-- 3) Operativas
--    depositos, cajas, puntos_venta, usuarios, usuarios_roles,
--    historial_cargos, lotes, stock, precios_globales,
--    precios_sucursal, productos_proveedores, detalle_promociones

-- 4) Movimientos y comprobantes
--    ventas, detalle_ventas, pagos, facturas, detalle_facturas,
--    compras, detalle_compras, recepciones, detalle_recepciones,
--    transferencias, detalle_transferencias,
--    devoluciones, detalle_devoluciones, movimientos_stock
   2. -- A) Datos base (lo que ya tenés cargado: alícuotas, cargos, categorías,
--    sucursales, cajas, puntos de venta, etc.)
INSERT INTO alicuotas_iva (descripcion, porcentaje, codigo_arca)
VALUES ('IVA 21%',21.00,5), ('IVA 10,5%',10.50,4),
       ('IVA 27%',27.00,6), ('IVA 0%',0.00,3);

-- B) Cambios sobre la estructura (ALTER)
ALTER TABLE stock
  ADD CONSTRAINT chk_stock_no_negativo CHECK (cantidad_disponible >= 0);

-- C) Vista: stock por sucursal
CREATE OR REPLACE VIEW v_stock_sucursal AS
SELECT s.nombre AS sucursal, p.nombre AS producto,
       st.cantidad_disponible, st.cantidad_reservada
FROM stock st
JOIN depositos d  ON d.id_deposito = st.id_deposito
JOIN sucursales s ON s.id_sucursal = d.id_sucursal
JOIN productos p  ON p.id_producto = st.id_producto;

-- D) Trigger: descontar stock al vender
--    (necesita saber de qué depósito sale; ver nota abajo)

-- E) Usuarios y permisos de MySQL
CREATE USER 'cajero'@'localhost' IDENTIFIED BY '...';
GRANT SELECT, INSERT ON supermercado_betel.ventas TO 'cajero'@'localhost';
   3. DELIMITER $$
CREATE TRIGGER trg_detalle_ventas_descuenta_stock
AFTER INSERT ON detalle_ventas
FOR EACH ROW
BEGIN
  DECLARE v_id_deposito  INT;
  DECLARE v_id_usuario   INT UNSIGNED;
  DECLARE v_numero_venta VARCHAR(30);

  SELECT d.id_deposito, v.id_usuario, v.numero_venta
    INTO v_id_deposito, v_id_usuario, v_numero_venta
    FROM ventas v
    JOIN cajas c     ON c.id_caja = v.id_caja
    JOIN depositos d ON d.id_sucursal = c.id_sucursal AND d.estado = 'Activo'
   WHERE v.id_venta = NEW.id_venta
   ORDER BY d.id_deposito
   LIMIT 1;

  UPDATE stock
     SET cantidad_disponible = cantidad_disponible - NEW.cantidad
   WHERE id_producto = NEW.id_producto
     AND id_deposito = v_id_deposito
     AND cantidad_disponible >= NEW.cantidad;

  IF ROW_COUNT() = 0 THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Stock insuficiente en la sucursal';
  END IF;

  INSERT INTO movimientos_stock
    (id_producto, id_deposito, id_usuario, tipo_movimiento, cantidad, fecha_movimiento, observaciones)
  VALUES
    (NEW.id_producto, v_id_deposito, v_id_usuario, 'Venta', NEW.cantidad, NOW(), CONCAT('Venta ', v_numero_venta));
END$$
DELIMITER ;

```bash
mysql -u TU_USUARIO -p < sql/NOMBRE_DEL_SCRIPT.sql
```

## 10. Autores

Liquitaya Dana Paola, Castillo Mabel Celinda – IES7 – 2026
