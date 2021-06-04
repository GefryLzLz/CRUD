-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 04-06-2021 a las 05:52:04
-- Versión del servidor: 10.4.18-MariaDB
-- Versión de PHP: 8.0.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `proyecto`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cambios`
--

CREATE TABLE `cambios` (
  `idcambio` int(11) NOT NULL,
  `idproducto` int(11) DEFAULT NULL,
  `idfactura` int(11) DEFAULT NULL,
  `cantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `idcliente` int(11) NOT NULL,
  `DPI` int(11) NOT NULL,
  `NIT` int(11) NOT NULL,
  `nombres` varchar(100) NOT NULL,
  `apellidos` varchar(50) NOT NULL,
  `edad` int(11) NOT NULL,
  `sexo` varchar(50) NOT NULL,
  `fecha_nacimiento` varchar(150) NOT NULL,
  `telefono` int(11) NOT NULL,
  `correo` varchar(100) DEFAULT NULL,
  `direccion` varchar(150) DEFAULT NULL,
  `fecha_de_ingreso_del_cliente` varchar(150) NOT NULL,
  `estado` int(11) NOT NULL,
  `idtipo_cliente` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compras`
--

CREATE TABLE `compras` (
  `idcompra` int(11) NOT NULL,
  `codigo` int(11) NOT NULL,
  `descripcion` varchar(150) NOT NULL,
  `tipo_de_pago` varchar(150) NOT NULL,
  `cantidad` varchar(100) NOT NULL,
  `total` varchar(100) NOT NULL,
  `fecha_de_compra` varchar(100) NOT NULL,
  `estado` int(11) NOT NULL,
  `idproducto` int(11) DEFAULT NULL,
  `idproveedor` int(11) DEFAULT NULL,
  `idusuario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `compras`
--

INSERT INTO `compras` (`idcompra`, `codigo`, `descripcion`, `tipo_de_pago`, `cantidad`, `total`, `fecha_de_compra`, `estado`, `idproducto`, `idproveedor`, `idusuario`) VALUES
(1, 0, '11', '111', '1111', '111', '2021-05-07', 0, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `devoluciones`
--

CREATE TABLE `devoluciones` (
  `iddevolucion` int(11) NOT NULL,
  `idproducto` int(11) DEFAULT NULL,
  `idfactura` int(11) DEFAULT NULL,
  `cantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE `factura` (
  `idfactura` int(11) NOT NULL,
  `idventa` int(11) DEFAULT NULL,
  `idcliente` int(11) DEFAULT NULL,
  `idproducto` int(11) DEFAULT NULL,
  `iva` varchar(100) NOT NULL,
  `total_a_pagar` varchar(100) NOT NULL,
  `descuento` varchar(100) DEFAULT NULL,
  `serie_de_factura` varchar(150) NOT NULL,
  `no_de_factura` int(150) NOT NULL,
  `tipo_de_pago` varchar(150) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `total_recibido` varchar(100) NOT NULL,
  `cambio` varchar(100) DEFAULT NULL,
  `estado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `factura`
--

INSERT INTO `factura` (`idfactura`, `idventa`, `idcliente`, `idproducto`, `iva`, `total_a_pagar`, `descuento`, `serie_de_factura`, `no_de_factura`, `tipo_de_pago`, `cantidad`, `total_recibido`, `cambio`, `estado`) VALUES
(2, NULL, NULL, NULL, '0.12', '200', '0.10', 'ghghg', 125, 'conta', 2, '200', '0', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventario`
--

CREATE TABLE `inventario` (
  `idinventario` int(11) NOT NULL,
  `idcompra` int(11) DEFAULT NULL,
  `idventa` int(11) DEFAULT NULL,
  `idproducto` int(11) DEFAULT NULL,
  `idusuario` int(11) DEFAULT NULL,
  `fecha_de_ingreso` varchar(150) NOT NULL,
  `iddevolucion` int(11) DEFAULT NULL,
  `idcambio` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `login`
--

CREATE TABLE `login` (
  `idlogue` int(11) NOT NULL,
  `user_nombre` varchar(150) NOT NULL,
  `pass` varchar(150) NOT NULL,
  `idusuario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `idproducto` int(11) NOT NULL,
  `nombres_producto` varchar(100) NOT NULL,
  `costo_producto` varchar(100) NOT NULL,
  `fecha_caducidad` varchar(150) NOT NULL,
  `marca` varchar(150) NOT NULL,
  `stock` varchar(150) DEFAULT NULL,
  `descuento` varchar(150) DEFAULT NULL,
  `fecha_ingreso` varchar(150) NOT NULL,
  `idtipo_producto` int(11) DEFAULT NULL,
  `idproveedor` int(11) DEFAULT NULL,
  `estado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`idproducto`, `nombres_producto`, `costo_producto`, `fecha_caducidad`, `marca`, `stock`, `descuento`, `fecha_ingreso`, `idtipo_producto`, `idproveedor`, `estado`) VALUES
(1, '111', '1111', '2021-05-07', '111', '111', '111', '2021-05-06', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `idproveedor` int(11) NOT NULL,
  `NIT` int(11) NOT NULL,
  `marca` varchar(150) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `razonsocial` varchar(100) NOT NULL,
  `telefono` int(11) NOT NULL,
  `direccion` varchar(150) NOT NULL,
  `correo` varchar(100) DEFAULT NULL,
  `estado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `proveedores`
--

INSERT INTO `proveedores` (`idproveedor`, `NIT`, `marca`, `nombre`, `razonsocial`, `telefono`, `direccion`, `correo`, `estado`) VALUES
(2, 11222, 'Pumas', 'Megapaca', '1235', 12345678, 'asfdsa', 'sfadf', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `puestos_de_trabajo`
--

CREATE TABLE `puestos_de_trabajo` (
  `idpuestos_de_trabajo` int(11) NOT NULL,
  `codigo_puesto` int(11) NOT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `area_laboral` varchar(50) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_cliente`
--

CREATE TABLE `tipo_cliente` (
  `idtipo_cliente` int(11) NOT NULL,
  `codigo` int(11) NOT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `estado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tipo_cliente`
--

INSERT INTO `tipo_cliente` (`idtipo_cliente`, `codigo`, `descripcion`, `estado`) VALUES
(2, 521, 'fdsfsfs', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_producto`
--

CREATE TABLE `tipo_producto` (
  `idtipo_producto` int(11) NOT NULL,
  `descripcion` varchar(150) DEFAULT NULL,
  `codigo_producto` int(11) NOT NULL,
  `unidad_de_medida` varchar(150) DEFAULT NULL,
  `presentación` varchar(150) DEFAULT NULL,
  `costo_compra` varchar(150) DEFAULT NULL,
  `estado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `idusuario` int(11) NOT NULL,
  `codigo_trabajador` int(11) NOT NULL,
  `DPI` int(11) NOT NULL,
  `NIT` int(11) NOT NULL,
  `nombres` varchar(100) NOT NULL,
  `apellidos` varchar(150) NOT NULL,
  `edad` int(11) NOT NULL,
  `sexo` varchar(50) NOT NULL,
  `fecha_nacimiento` varchar(150) NOT NULL,
  `telefono` int(11) NOT NULL,
  `correo` varchar(100) DEFAULT NULL,
  `fecha_ingreso_usuario` varchar(150) NOT NULL,
  `jornada_laboral` varchar(100) DEFAULT NULL,
  `idpuestos_de_trabajo` int(11) DEFAULT NULL,
  `estado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`idusuario`, `codigo_trabajador`, `DPI`, `NIT`, `nombres`, `apellidos`, `edad`, `sexo`, `fecha_nacimiento`, `telefono`, `correo`, `fecha_ingreso_usuario`, `jornada_laboral`, `idpuestos_de_trabajo`, `estado`) VALUES
(13, 444, 111, 222, 'fddfsd', 'sdsf', 18, 'm', '2021-05-14', 12345678, ' jjjj', '2021-05-07', 'v', NULL, 0),
(14, 305, 12325, 3123, 'Juan', 'Perez', 20, 'Masculino', '2021-06-01', 22334455, ' j@gmail.com', '2001-05-02', 'Vespertina', NULL, 0),
(15, 2365, 12357, 37806335, 'Julio Humbero', 'Gonzales', 22, 'Masculino', '2021-06-01', 63258974, 'jhumbr@gmail.com', '1999-05-02', 'Vespertina', NULL, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `idventa` int(11) NOT NULL,
  `codigo` int(11) NOT NULL,
  `descripcion` varchar(150) NOT NULL,
  `tipo_de_pago` varchar(150) NOT NULL,
  `cantidad` varchar(100) NOT NULL,
  `total` varchar(100) NOT NULL,
  `fecha_de_venta` varchar(100) NOT NULL,
  `estado` int(11) NOT NULL,
  `idproducto` int(11) DEFAULT NULL,
  `idusuario` int(11) DEFAULT NULL,
  `idtipos_de_venta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`idventa`, `codigo`, `descripcion`, `tipo_de_pago`, `cantidad`, `total`, `fecha_de_venta`, `estado`, `idproducto`, `idusuario`, `idtipos_de_venta`) VALUES
(4, 0, '', 'contado', '12', '200', '2021-06-01', 0, NULL, NULL, NULL),
(5, 0, '', 'efe', '2', '200', '2021-06-01', 0, NULL, NULL, NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cambios`
--
ALTER TABLE `cambios`
  ADD PRIMARY KEY (`idcambio`),
  ADD KEY `idproducto` (`idproducto`),
  ADD KEY `idfactura` (`idfactura`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`idcliente`),
  ADD KEY `idtipo_cliente` (`idtipo_cliente`);

--
-- Indices de la tabla `compras`
--
ALTER TABLE `compras`
  ADD PRIMARY KEY (`idcompra`),
  ADD KEY `idproducto` (`idproducto`),
  ADD KEY `idproveedor` (`idproveedor`),
  ADD KEY `idusuario` (`idusuario`);

--
-- Indices de la tabla `devoluciones`
--
ALTER TABLE `devoluciones`
  ADD PRIMARY KEY (`iddevolucion`),
  ADD KEY `idproducto` (`idproducto`),
  ADD KEY `idfactura` (`idfactura`);

--
-- Indices de la tabla `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`idfactura`),
  ADD KEY `idventa` (`idventa`),
  ADD KEY `idcliente` (`idcliente`),
  ADD KEY `idproducto` (`idproducto`);

--
-- Indices de la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD PRIMARY KEY (`idinventario`),
  ADD KEY `idcompra` (`idcompra`),
  ADD KEY `idventa` (`idventa`),
  ADD KEY `idproducto` (`idproducto`),
  ADD KEY `idusuario` (`idusuario`),
  ADD KEY `iddevolucion` (`iddevolucion`),
  ADD KEY `idcambio` (`idcambio`);

--
-- Indices de la tabla `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`idlogue`),
  ADD KEY `idusuario` (`idusuario`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`idproducto`),
  ADD KEY `idtipo_producto` (`idtipo_producto`),
  ADD KEY `idproveedor` (`idproveedor`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`idproveedor`);

--
-- Indices de la tabla `puestos_de_trabajo`
--
ALTER TABLE `puestos_de_trabajo`
  ADD PRIMARY KEY (`idpuestos_de_trabajo`);

--
-- Indices de la tabla `tipo_cliente`
--
ALTER TABLE `tipo_cliente`
  ADD PRIMARY KEY (`idtipo_cliente`);

--
-- Indices de la tabla `tipo_producto`
--
ALTER TABLE `tipo_producto`
  ADD PRIMARY KEY (`idtipo_producto`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`idusuario`),
  ADD KEY `idpuestos_de_trabajo` (`idpuestos_de_trabajo`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`idventa`),
  ADD KEY `idproducto` (`idproducto`),
  ADD KEY `idusuario` (`idusuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cambios`
--
ALTER TABLE `cambios`
  MODIFY `idcambio` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `idcliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `compras`
--
ALTER TABLE `compras`
  MODIFY `idcompra` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `devoluciones`
--
ALTER TABLE `devoluciones`
  MODIFY `iddevolucion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `factura`
--
ALTER TABLE `factura`
  MODIFY `idfactura` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `inventario`
--
ALTER TABLE `inventario`
  MODIFY `idinventario` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `login`
--
ALTER TABLE `login`
  MODIFY `idlogue` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `idproducto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `idproveedor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `puestos_de_trabajo`
--
ALTER TABLE `puestos_de_trabajo`
  MODIFY `idpuestos_de_trabajo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `tipo_cliente`
--
ALTER TABLE `tipo_cliente`
  MODIFY `idtipo_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tipo_producto`
--
ALTER TABLE `tipo_producto`
  MODIFY `idtipo_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `idusuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `idventa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cambios`
--
ALTER TABLE `cambios`
  ADD CONSTRAINT `cambios_ibfk_1` FOREIGN KEY (`idproducto`) REFERENCES `productos` (`idproducto`) ON DELETE CASCADE,
  ADD CONSTRAINT `cambios_ibfk_2` FOREIGN KEY (`idfactura`) REFERENCES `factura` (`idfactura`) ON DELETE CASCADE;

--
-- Filtros para la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD CONSTRAINT `clientes_ibfk_1` FOREIGN KEY (`idtipo_cliente`) REFERENCES `tipo_cliente` (`idtipo_cliente`) ON DELETE CASCADE;

--
-- Filtros para la tabla `compras`
--
ALTER TABLE `compras`
  ADD CONSTRAINT `compras_ibfk_1` FOREIGN KEY (`idproducto`) REFERENCES `productos` (`idproducto`) ON DELETE CASCADE,
  ADD CONSTRAINT `compras_ibfk_2` FOREIGN KEY (`idproveedor`) REFERENCES `proveedores` (`idproveedor`) ON DELETE CASCADE,
  ADD CONSTRAINT `compras_ibfk_3` FOREIGN KEY (`idusuario`) REFERENCES `usuarios` (`idusuario`) ON DELETE CASCADE;

--
-- Filtros para la tabla `devoluciones`
--
ALTER TABLE `devoluciones`
  ADD CONSTRAINT `devoluciones_ibfk_1` FOREIGN KEY (`idproducto`) REFERENCES `productos` (`idproducto`) ON DELETE CASCADE,
  ADD CONSTRAINT `devoluciones_ibfk_2` FOREIGN KEY (`idfactura`) REFERENCES `factura` (`idfactura`) ON DELETE CASCADE;

--
-- Filtros para la tabla `factura`
--
ALTER TABLE `factura`
  ADD CONSTRAINT `factura_ibfk_1` FOREIGN KEY (`idventa`) REFERENCES `ventas` (`idventa`) ON DELETE CASCADE,
  ADD CONSTRAINT `factura_ibfk_2` FOREIGN KEY (`idcliente`) REFERENCES `clientes` (`idcliente`) ON DELETE CASCADE,
  ADD CONSTRAINT `factura_ibfk_3` FOREIGN KEY (`idproducto`) REFERENCES `productos` (`idproducto`) ON DELETE CASCADE;

--
-- Filtros para la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD CONSTRAINT `inventario_ibfk_1` FOREIGN KEY (`idcompra`) REFERENCES `compras` (`idcompra`) ON DELETE CASCADE,
  ADD CONSTRAINT `inventario_ibfk_2` FOREIGN KEY (`idventa`) REFERENCES `ventas` (`idventa`) ON DELETE CASCADE,
  ADD CONSTRAINT `inventario_ibfk_3` FOREIGN KEY (`idproducto`) REFERENCES `productos` (`idproducto`) ON DELETE CASCADE,
  ADD CONSTRAINT `inventario_ibfk_4` FOREIGN KEY (`idusuario`) REFERENCES `usuarios` (`idusuario`) ON DELETE CASCADE,
  ADD CONSTRAINT `inventario_ibfk_5` FOREIGN KEY (`iddevolucion`) REFERENCES `devoluciones` (`iddevolucion`) ON DELETE CASCADE,
  ADD CONSTRAINT `inventario_ibfk_6` FOREIGN KEY (`idcambio`) REFERENCES `cambios` (`idcambio`) ON DELETE CASCADE;

--
-- Filtros para la tabla `login`
--
ALTER TABLE `login`
  ADD CONSTRAINT `login_ibfk_1` FOREIGN KEY (`idusuario`) REFERENCES `usuarios` (`idusuario`) ON DELETE CASCADE;

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`idtipo_producto`) REFERENCES `tipo_producto` (`idtipo_producto`) ON DELETE CASCADE,
  ADD CONSTRAINT `productos_ibfk_2` FOREIGN KEY (`idproveedor`) REFERENCES `proveedores` (`idproveedor`) ON DELETE CASCADE;

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`idpuestos_de_trabajo`) REFERENCES `puestos_de_trabajo` (`idpuestos_de_trabajo`) ON DELETE CASCADE;

--
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`idproducto`) REFERENCES `productos` (`idproducto`) ON DELETE CASCADE,
  ADD CONSTRAINT `ventas_ibfk_2` FOREIGN KEY (`idusuario`) REFERENCES `usuarios` (`idusuario`) ON DELETE CASCADE,
  ADD CONSTRAINT `ventas_ibfk_3` FOREIGN KEY (`idtipos_de_venta`) REFERENCES `tipos_de_venta` (`idtipos_de_venta`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
