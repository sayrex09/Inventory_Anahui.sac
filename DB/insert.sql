CREATE DATABASE IF NOT EXISTS `db_inventory` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `db_inventory`;

INSERT INTO `categories` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
	(34, 'Rollos de Tela Acabada', 1, '2023-04-16 03:14:24', '2025-05-09 17:03:03'),
	(50, 'Tela Confesionada', 1, '2023-04-16 03:16:23', '2025-05-09 17:41:03'),
	(52, 'Rollos de Tela Teñida', 1, '2023-04-16 03:16:35', '2025-05-09 17:38:09'),
	(55, 'Tela new', 1, '2025-05-14 17:15:17', '2025-05-14 17:15:17'),
	(56, 'Marketing', 1, '2025-06-06 17:47:49', '2025-06-06 17:47:49');

INSERT INTO `companies` (`id`, `name`, `phone`, `address`, `created_at`, `updated_at`) VALUES
	(1, 'Inventario Sayrex', '972294409', 'Calle JOSE CARLOS MARIATEGUI Cuadra 2  ANCON Codigo Postal: 15123', NULL, '2025-05-08 20:41:13');

INSERT INTO `customers` (`id`, `customer_name`, `email`, `phone`, `address`, `status`, `created_at`, `updated_at`) VALUES
	(37, 'Juan Pérez', 'juan.perez@example.com', '555-1234', 'Calle 1, Colonia Centro, Ciudad de México', 1, '2023-04-17 02:08:05', '2023-04-17 02:08:05'),
	(38, 'María Rodríguez', 'maria.rodriguez@example.com', '555-5678', 'Calle 2, Colonia Condesa, Ciudad de México', 1, '2023-04-17 02:08:05', '2023-04-17 02:08:05'),
	(39, 'Pedro García', 'pedro.garcia@example.com', '555-9876', 'Calle 3, Colonia Roma, Ciudad de México', 1, '2023-04-17 02:08:05', '2023-04-17 02:08:05'),
	(40, 'Ana Hernández', 'ana.hernandez@gmail.com', '965786507', 'JR DANIEL ALCIDES CARRION Cuadra 2 Ancon', 1, '2023-04-17 02:08:05', '2025-05-08 19:38:40'),
	(41, 'Jorge Martínez', 'jorge.martinez@example.com', '555-3691', 'Calle 5, Colonia Santa Fe, Ciudad de México', 1, '2023-04-17 02:08:05', '2023-04-17 02:08:05'),
	(42, 'Laura González', 'laura.gonzalez@example.com', '555-5555', 'Calle 6, Colonia Polanco, Ciudad de México', 1, '2023-04-17 02:08:05', '2023-04-17 02:08:05'),
	(43, 'Miguel Álvarez', 'miguel.alvarez@example.com', '555-7777', 'Calle 7, Colonia Juárez, Ciudad de México', 1, '2023-04-17 02:08:05', '2023-04-17 02:08:05'),
	(44, 'Carmen Flores', 'carmen.flores@example.com', '555-1212', 'Calle 8, Colonia Coyoacán, Ciudad de México', 1, '2023-04-17 02:08:05', '2023-04-17 02:08:05'),
	(45, 'José García', 'jose.garcia@example.com', '555-7777', 'Calle 9, Colonia Del Valle, Ciudad de México', 1, '2023-04-17 02:08:05', '2023-04-17 02:08:05'),
	(46, 'Fernanda González', 'fernanda.gonzalez@example.com', '555-2345', 'Calle 10, Colonia San Ángel, Ciudad de México', 1, '2023-04-17 02:08:05', '2023-04-17 02:08:05'),
	(47, 'Diego Torres', 'diego.torres@example.com', '555-4567', 'Calle 11, Colonia Santa María la Ribera, Ciudad de México', 1, '2023-04-17 02:08:05', '2023-04-17 02:08:05'),
	(48, 'Carla Hernández', 'carla.hernandez@example.com', '555-1111', 'Calle 12, Colonia Tabacalera, Ciudad de México', 1, '2023-04-17 02:08:05', '2023-04-17 02:08:05'),
	(49, 'Raúl Díaz', 'raul.diaz@example.com', '555-2222', 'Calle 13, Colonia Doctores, Ciudad de México', 1, '2023-04-17 02:08:05', '2023-04-17 02:08:05'),
	(50, 'Sofía García', 'sofia.garcia@example.com', '555-3333', 'Calle 14, Colonia Lindavista, Ciudad de México', 1, '2023-04-17 02:08:05', '2023-04-17 02:08:05'),
	(51, 'Héctor Jiménez', 'hector.jimenez@example.com', '555-4444', 'Calle 15, Colonia Vallejo, Ciudad de México', 1, '2023-04-17 02:08:05', '2023-04-17 02:08:05'),
	(52, 'Diana Martínez', 'diana.martinez@example.com', '555-5555', 'Calle 16, Colonia Industrial, Ciudad de México', 1, '2023-04-17 02:08:05', '2023-04-17 02:08:05'),
	(53, 'Cristian', '1234@gmail.com', '999999999', 'Av comun.sda', 1, '2025-05-09 17:20:59', '2025-05-09 17:20:59'),
	(54, 'Gomez', 'pedrocor@gmail.com', '987879231', 'Av arequipa cuadra 2', 1, '2025-05-14 17:12:23', '2025-05-14 17:12:48'),
	(55, 'Richard', 'richardnovinoaclases@gmail.com', '931212138', 'Av San juan de lirugancho', 1, '2025-06-06 17:42:49', '2025-06-06 17:47:10');

INSERT INTO `menus` (`id`, `parent_id`, `name`, `icon`, `menu_url`, `status`, `created_at`, `updated_at`) VALUES
	(1, 0, 'Clientes', 'contacts', 'customer.index', 0, '2020-07-29 13:17:51', '2020-07-29 13:17:56'),
	(2, 0, 'Gestión de Productos', 'category', NULL, 0, '2020-07-29 13:17:53', '2020-07-29 13:17:54'),
	(3, 0, 'Gestión de Existencias', 'assignment', NULL, 0, '2020-07-29 13:17:52', '2020-07-29 13:17:54'),
	(4, 0, 'Gestión de usuarios', 'supervised_user_circle', NULL, 0, '2020-07-29 13:17:51', '2020-07-29 13:17:56'),
	(5, 0, 'Reportes', 'receipt_long', 'report.index', 0, '2020-07-29 13:17:52', '2020-07-29 13:17:55'),
	(6, 0, 'Configuración', 'settings', NULL, 0, '2020-07-29 13:17:58', '2020-07-29 13:17:57'),
	(7, 2, 'Categorias', NULL, 'category.index', 0, '2020-07-29 13:17:50', '2020-07-29 13:17:57'),
	(8, 2, 'Productos', NULL, 'product.index', 0, '2020-07-29 13:17:49', '2020-07-29 13:17:59'),
	(9, 2, 'Proveedores', NULL, 'supplier.index', 0, '2020-07-29 13:17:49', '2020-07-29 13:18:00'),
	(10, 3, 'Entradas', NULL, 'stock.index', 0, '2020-07-29 13:17:48', '2020-07-29 13:18:00'),
	(11, 3, 'Salidas / Facturación', NULL, 'invoice.index', 0, '2020-07-29 13:17:47', '2020-07-29 13:18:01'),
	(12, 4, 'Gestión de roles', NULL, 'role.index', 0, '2020-07-29 13:17:46', '2020-07-29 13:17:46'),
	(13, 4, 'Usuarios', NULL, 'user.index', 0, '2020-07-29 13:17:44', '2020-07-29 13:17:44'),
	(14, 6, 'Información de la empresa', NULL, 'company.index', 0, '2020-07-29 13:17:43', '2020-07-29 13:17:45'),
	(15, 6, 'Cambiar la contraseña', NULL, 'password.index', 0, '2020-07-29 13:17:42', '2020-07-29 13:16:37');

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_000000_create_users_table', 1),
	(2, '2014_10_12_100000_create_password_resets_table', 1),
	(3, '2018_12_10_051212_create_products_table', 2),
	(4, '2018_12_10_052440_create_vendors_table', 2),
	(5, '2018_12_10_052501_create_customers_table', 2),
	(6, '2018_12_10_052521_create_stocks_table', 2),
	(7, '2018_12_10_052610_create_sells_table', 2),
	(8, '2018_12_10_052631_create_sell_details_table', 2),
	(9, '2018_12_10_075236_create_branches_table', 2),
	(10, '2018_12_31_160432_create_categories_table', 3),
	(11, '2019_01_12_163604_create_payments_table', 4),
	(12, '2019_01_19_152250_biye--tabl', 5),
	(13, '2019_02_10_113651_create_roles_table', 6),
	(14, '2019_02_10_114632_create_permissions_table', 6),
	(15, '2019_02_10_114735_create_menus_table', 6),
	(16, '2019_02_14_130126_create_companies_table', 7);

INSERT INTO `permissions` (`id`, `role_id`, `menu_id`, `created_at`, `updated_at`) VALUES
	(124, 5, 1, '2019-02-23 00:54:16', '2019-02-23 00:54:16'),
	(125, 5, 2, '2019-02-23 00:54:16', '2019-02-23 00:54:16'),
	(126, 5, 3, '2019-02-23 00:54:16', '2019-02-23 00:54:16'),
	(127, 5, 4, '2019-02-23 00:54:16', '2019-02-23 00:54:16'),
	(128, 5, 5, '2019-02-23 00:54:16', '2019-02-23 00:54:16'),
	(129, 5, 6, '2019-02-23 00:54:16', '2019-02-23 00:54:16'),
	(130, 5, 9, '2019-02-23 00:54:16', '2019-02-23 00:54:16'),
	(131, 5, 8, '2019-02-23 00:54:16', '2019-02-23 00:54:16'),
	(132, 5, 7, '2019-02-23 00:54:16', '2019-02-23 00:54:16'),
	(133, 5, 10, '2019-02-23 00:54:16', '2019-02-23 00:54:16'),
	(134, 5, 11, '2019-02-23 00:54:16', '2019-02-23 00:54:16'),
	(135, 5, 12, '2019-02-23 00:54:16', '2019-02-23 00:54:16'),
	(136, 5, 15, '2019-02-23 00:54:16', '2019-02-23 00:54:16'),
	(137, 6, 1, '2019-02-23 03:25:01', '2019-02-23 03:25:01'),
	(138, 6, 3, '2019-02-23 03:25:01', '2019-02-23 03:25:01'),
	(139, 6, 6, '2019-02-23 03:25:01', '2019-02-23 03:25:01'),
	(140, 6, 15, '2019-02-23 03:25:01', '2019-02-23 03:25:01'),
	(706, 4, 11, '2020-07-31 17:30:54', '2020-07-31 17:30:54'),
	(707, 4, 2, '2020-07-31 17:30:54', '2020-07-31 17:30:54'),
	(708, 4, 4, '2020-07-31 17:30:54', '2020-07-31 17:30:54'),
	(709, 4, 15, '2020-07-31 17:30:54', '2020-07-31 17:30:54'),
	(710, 4, 6, '2020-07-31 17:30:54', '2020-07-31 17:30:54'),
	(721, 3, 1, '2020-11-17 17:03:42', '2020-11-17 17:03:42'),
	(722, 3, 9, '2020-11-17 17:03:42', '2020-11-17 17:03:42'),
	(723, 3, 8, '2020-11-17 17:03:42', '2020-11-17 17:03:42'),
	(724, 3, 7, '2020-11-17 17:03:42', '2020-11-17 17:03:42'),
	(725, 3, 2, '2020-11-17 17:03:42', '2020-11-17 17:03:42'),
	(726, 3, 10, '2020-11-17 17:03:42', '2020-11-17 17:03:42'),
	(727, 3, 11, '2020-11-17 17:03:42', '2020-11-17 17:03:42'),
	(728, 3, 3, '2020-11-17 17:03:42', '2020-11-17 17:03:42'),
	(729, 2, 1, '2021-07-05 20:00:38', '2021-07-05 20:00:38'),
	(730, 2, 9, '2021-07-05 20:00:38', '2021-07-05 20:00:38'),
	(731, 2, 8, '2021-07-05 20:00:38', '2021-07-05 20:00:38'),
	(732, 2, 7, '2021-07-05 20:00:38', '2021-07-05 20:00:38'),
	(733, 2, 2, '2021-07-05 20:00:38', '2021-07-05 20:00:38'),
	(734, 2, 10, '2021-07-05 20:00:38', '2021-07-05 20:00:38'),
	(735, 2, 11, '2021-07-05 20:00:38', '2021-07-05 20:00:38'),
	(736, 2, 3, '2021-07-05 20:00:38', '2021-07-05 20:00:38'),
	(737, 2, 12, '2021-07-05 20:00:38', '2021-07-05 20:00:38'),
	(738, 2, 13, '2021-07-05 20:00:38', '2021-07-05 20:00:38'),
	(739, 2, 4, '2021-07-05 20:00:38', '2021-07-05 20:00:38'),
	(740, 2, 5, '2021-07-05 20:00:38', '2021-07-05 20:00:38'),
	(741, 2, 14, '2021-07-05 20:00:38', '2021-07-05 20:00:38'),
	(742, 2, 15, '2021-07-05 20:00:38', '2021-07-05 20:00:38'),
	(743, 2, 6, '2021-07-05 20:00:38', '2021-07-05 20:00:38'),
	(744, 13, 1, '2025-05-14 17:11:35', '2025-05-14 17:11:35'),
	(745, 13, 7, '2025-05-14 17:11:35', '2025-05-14 17:11:35'),
	(746, 13, 8, '2025-05-14 17:11:35', '2025-05-14 17:11:35'),
	(747, 13, 9, '2025-05-14 17:11:35', '2025-05-14 17:11:35'),
	(748, 13, 2, '2025-05-14 17:11:35', '2025-05-14 17:11:35');

INSERT INTO `products` (`id`, `category_id`, `product_name`, `details`, `status`, `created_at`, `updated_at`) VALUES
	(30, 34, 'Arroz blanco de grano largo', 'Este arroz es conocido por su textura suave y delicada, y es ideal para preparar una gran variedad de platos, desde arroz con frijoles hasta sushi. El arroz blanco de grano largo es una excelente fuente de carbohidratos y se puede cocinar fácilmente en una olla de arroz o en una cacerola.', 1, '2023-04-16 03:18:28', '2023-04-16 05:54:34'),
	(31, 34, 'Frijoles negros envasados al vacío', 'Estos frijoles son una excelente fuente de proteínas y fibra, y son un ingrediente popular en muchos platos tradicionales de la cocina latinoamericana, como los frijoles refritos y el chili con carne. Los frijoles negros envasados al vacío son fáciles de almacenar y se pueden preparar en pocos minutos.', 1, '2023-04-16 03:18:43', '2023-04-16 05:54:52'),
	(32, 34, 'Espagueti de trigo', 'El espagueti es un tipo de pasta larga y delgada que se puede combinar con una gran variedad de salsas y acompañamientos. El espagueti de trigo es una opción saludable y nutritiva, ya que es bajo en grasa y alto en carbohidratos complejos. Además, es fácil de cocinar y se puede preparar en pocos minutos.', 1, '2023-04-16 03:18:59', '2023-04-16 05:55:07'),
	(33, 34, 'Tela acabada', 'La tela es super refinada', 1, '2023-04-16 03:28:19', '2025-05-09 17:30:24'),
	(49, 34, 'Cereal de maíz en hojuelas', 'El cereal de maíz en hojuelas es un desayuno clásico que se puede disfrutar en cualquier momento del día. Es un alimento bajo en grasas y azúcares, y una buena fuente de carbohidratos y fibra. Además, es fácil de almacenar y se puede combinar con leche, yogur o frutas para un desayuno completo y saludable.', 1, '2023-04-16 04:07:59', '2023-04-16 05:55:43'),
	(50, 52, 'Mesa de jardín de madera', 'Mesa de jardín de alta calidad con acabado resistente a la intemperie', 1, '2023-04-16 03:18:28', '2023-04-16 03:18:28'),
	(51, 52, 'Set de utensilios de cocina de acero inoxidable', 'Set de utensilios de cocina duradero con mangos ergonómicos', 1, '2023-04-16 03:18:28', '2023-04-16 03:18:28'),
	(52, 52, 'Juego de sábanas de algodón', 'Juego de sábanas de algodón suave y cómodo para un descanso reparador', 1, '2023-04-16 03:18:28', '2023-04-16 03:18:28'),
	(54, 52, 'Tela con diseños print', 'Aspiradora inalámbrica con batería recargable y accesorios para limpiar la casa', 1, '2023-04-16 03:18:28', '2025-05-14 17:07:32'),
	(58, 52, 'Macetas de cerámica para plantas', 'Macetas de cerámica elegantes y modernas para plantas de interior y exterior', 1, '2023-04-16 03:18:28', '2023-04-16 03:18:28'),
	(236, 52, 'Tela de color palo rosa', 'Tela teñida con tintes naturales', 1, '2025-05-14 17:14:19', '2025-05-14 17:14:55');

INSERT INTO `roles` (`id`, `role_name`, `created_at`, `updated_at`) VALUES
	(2, 'Superadministrador', '2019-02-12 03:59:54', '2023-04-17 04:53:28'),
	(3, 'Gerente', '2019-02-13 00:07:41', '2023-04-17 04:35:56'),
	(5, 'Almacenero', '2019-02-13 05:53:15', '2025-05-08 21:36:42');

INSERT INTO `stocks` (`id`, `category_id`, `product_code`, `product_id`, `vendor_id`, `user_id`, `chalan_no`, `buying_price`, `selling_price`, `discount`, `stock_quantity`, `current_quantity`, `note`, `status`, `created_at`, `updated_at`) VALUES
	(55, 34, '1681681567', 30, 81, 12, '2023-04-16', 9.8, 12.5, 0, 100, 100, NULL, 1, '2023-04-16 22:46:07', '2025-05-09 17:01:18'),
	(56, 37, '1681705778', 67, 81, 12, '2023-04-16', 189.99, 249.99, 0, 48, 48, NULL, 1, '2023-04-17 05:29:38', '2023-04-17 05:29:38'),
	(57, 34, '1747242963', 33, 88, 12, '2025-05-14', 123, 150, 0, 23, 23, 'Compra realizada por falta de stock', 1, '2025-05-14 17:16:03', '2025-05-14 17:16:03');

INSERT INTO `users` (`id`, `name`, `email`, `password`, `branch_id`, `role_id`, `remember_token`, `created_at`, `updated_at`) VALUES
	(12, 'Cristhian', 'Supremegold@gmail.com', '$2y$10$W/nqTuN0X.JaGtGBkpw01OTSL0I3aShYL9QusP8Q5kIZ2AviqQHKC', 1, 2, 'woRb8grnH3v0g7Ih14TVhIuGk8PpWUapsNJQQHu1FcF7tQ9ZJaPzZkaj1wYg', '2020-07-31 17:27:25', '2025-05-14 16:53:29'),
	(21, 'Richard', 'oliveriman255@gmail.com', '$2y$10$r5bHnsp1d6MqyL8J2K91MetOiN.9yrmb0SP36rnQdnpxJonsuLStO', 1, 3, 'hAN82Syp4WsHAuCH7qAKGesXtSd1NIMcdVY9W5aAG6wHWZYq0jgIL5RZ8RZD', '2025-05-09 17:19:58', '2025-05-09 17:20:06'),
	(22, 'User', 'usertesting@gmail.com', '$2y$10$9Xzcw2IJJJHnxrzkqEQsQ.Fem67NvjEjKnmiPSsh0azw08MWyDoES', 1, 13, 'oLwr0SHd7qBXqVrsn5hLYG2lhExlXEJpGakZottqrPja5hHdROsb5D5J8gbD', '2025-05-14 17:09:58', '2025-05-14 17:09:58');

INSERT INTO `vendors` (`id`, `name`, `phone`, `email`, `address`, `created_at`, `updated_at`) VALUES
	(76, 'La Michoacana', '55-1234-5678', 'contacto@lamichoacana.com.mx', 'Av. Insurgentes Sur 1647, Col. San José Insurgentes, CDMX', '2023-04-16 21:44:30', '2023-04-16 21:44:30'),
	(77, 'El Paraiso del Helado', '55-8765-4321', 'info@elparaisodelhelado.com.mx', 'Calle Gral. Emiliano Zapata 54, Col. San Francisco Chilpan, CDMX', '2023-04-16 21:44:30', '2023-04-16 21:44:30'),
	(78, 'La Flor de Michoacán', '33-3333-3333', 'ventas@laflordemichoacan.com.mx', 'Calle Sinaloa 1437, Col. Providencia, Guadalajara, Jalisco', '2023-04-16 21:44:30', '2023-04-16 21:44:30'),
	(79, 'Paletería la Victoria', '81-1111-1111', 'contacto@paleterialavictoria.com.mx', 'Av. Chapultepec Sur 177, Col. Americana, Monterrey, Nuevo León', '2023-04-16 21:44:30', '2023-04-16 21:44:30'),
	(80, 'Helados Santa Clara', '55-5555-5555', 'contacto@santaclara.com.mx', 'Av. de los Insurgentes Sur 1395, Col. Insurgentes Mixcoac, CDMX', '2023-04-16 21:44:30', '2023-04-16 21:44:30'),
	(81, 'La Imperial', '33-2222-2222', 'info@laimperial.com.mx', 'Av. México 2500, Col. Ladrón de Guevara, Guadalajara, Jalisco', '2023-04-16 21:44:30', '2023-04-16 21:44:30'),
	(82, 'Helados Holanda', '55-9876-5432', 'contacto@heladosholanda.com.mx', 'Av. Revolución 1928, Col. San Ángel, CDMX', '2023-04-16 21:44:30', '2023-04-16 21:44:30'),
	(83, 'Nieve Garrafa', '55-1111-2222', 'ventas@nievegarrafa.com.mx', 'Av. Toluca 124, Col. Olivar de los Padres, CDMX', '2023-04-16 21:44:30', '2023-04-16 21:44:30'),
	(84, 'La Tapatía Helados', '33-4444-4444', 'contacto@latapatiahelados.com.mx', 'Calle Francisco Javier Mina 20, Col. Centro, Guadalajara, Jalisco', '2023-04-16 21:44:30', '2023-04-16 21:44:30'),
	(85, 'La Tradicional', '81-2222-2222', 'info@latradicional.com.mx', 'Calle Padre Mier 1241, Col. Centro, Monterrey, Nuevo León', '2023-04-16 21:44:30', '2023-04-16 21:44:30'),
	(88, 'Gonzales', '978523456', 'gonzales@gmail.com', 'Av tacna cuadra3', '2025-05-14 17:13:33', '2025-05-14 17:13:48');
