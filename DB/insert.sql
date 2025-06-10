USE db_inventory;

-- Datos para companies
INSERT INTO `companies` (`id`, `name`, `phone`, `address`, `created_at`, `updated_at`) VALUES
(1, 'Textiles del Norte S.A.', '555-100-2000', 'Av. Industrial 123, Zona Textil, Ciudad', NOW(), NOW()),
(2, 'Confecciones Andinas', '555-200-3000', 'Calle Algodón 456, Distrito Industrial', NOW(), NOW()),
(3, 'Tejidos Premium', '555-300-4000', 'Av. Hilandería 789, Parque Industrial', NOW(), NOW()),
(4, 'Moda Textil Export', '555-400-5000', 'Calle Exportadores 101, Zona Franca', NOW(), NOW()),
(5, 'Telares Nacionales', '555-500-6000', 'Av. Maquinaria 202, Polígono Industrial', NOW(), NOW()),
(6, 'Hilos y Telares S.A.', '555-600-7000', 'Calle Ovillo 303, Sector Textil', NOW(), NOW()),
(7, 'Confecciones del Valle', '555-700-8000', 'Av. Costura 404, Parque Artesanal', NOW(), NOW()),
(8, 'Textiles Ecológicos', '555-800-9000', 'Calle Sostenible 505, Eco Zona', NOW(), NOW()),
(9, 'Tejidos Artesanales', '555-900-0000', 'Av. Tradición 606, Centro Cultural', NOW(), NOW()),
(10, 'Algodones del Sur', '555-000-1000', 'Calle Fibra Natural 707, Campo Algodonero', NOW(), NOW());

-- Datos para branches
INSERT INTO `branches` (`id`, `branch_name`, `created_at`, `updated_at`) VALUES
(1, 'Fábrica Principal', NOW(), NOW()),
(2, 'Tienda Centro', NOW(), NOW()),
(3, 'Almacén Norte', NOW(), NOW()),
(4, 'Taller de Confección', NOW(), NOW()),
(5, 'Oficinas Administrativas', NOW(), NOW()),
(6, 'Centro de Distribución', NOW(), NOW()),
(7, 'Showroom Textil', NOW(), NOW()),
(8, 'Planta de Teñido', NOW(), NOW()),
(9, 'Bodega Materia Prima', NOW(), NOW()),
(10, 'Sucursal Sur', NOW(), NOW());

-- Datos para roles
INSERT INTO `roles` (`id`, `role_name`, `created_at`, `updated_at`) VALUES
(1, 'Administrador', NOW(), NOW()),
(2, 'Gerente de Producción', NOW(), NOW()),
(3, 'Supervisor de Calidad', NOW(), NOW()),
(4, 'Jefe de Almacén', NOW(), NOW()),
(5, 'Vendedor', NOW(), NOW()),
(6, 'Diseñador Textil', NOW(), NOW()),
(7, 'Operario de Máquinas', NOW(), NOW()),
(8, 'Contador', NOW(), NOW()),
(9, 'Asistente Comercial', NOW(), NOW()),
(10, 'Logística', NOW(), NOW());

-- Datos para users
INSERT INTO `users` (`id`, `name`, `email`, `password`, `branch_id`, `role_id`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Ana Martínez', 'admin@textilesdelnorte.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 1, 1, NULL, NOW(), NOW()),
(2, 'Carlos Rojas', 'produccion@textilesdelnorte.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 1, 2, NULL, NOW(), NOW()),
(3, 'Luisa Fernández', 'ventas@textilesdelnorte.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 2, 5, NULL, NOW(), NOW()),
(4, 'Pedro Gómez', 'almacen@textilesdelnorte.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 3, 4, NULL, NOW(), NOW()),
(5, 'María López', 'diseno@textilesdelnorte.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 1, 6, NULL, NOW(), NOW()),
(6, 'Jorge Ramírez', 'calidad@textilesdelnorte.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 1, 3, NULL, NOW(), NOW()),
(7, 'Sofía Castro', 'operaciones@textilesdelnorte.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 4, 7, NULL, NOW(), NOW()),
(8, 'Ricardo Mendoza', 'contabilidad@textilesdelnorte.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 5, 8, NULL, NOW(), NOW()),
(9, 'Laura Torres', 'comercial@textilesdelnorte.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 2, 9, NULL, NOW(), NOW()),
(10, 'Diego Herrera', 'logistica@textilesdelnorte.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 6, 10, NULL, NOW(), NOW());

-- Datos para categories
INSERT INTO `categories` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Telas de Algodón', 1, NOW(), NOW()),
(2, 'Telas de Poliéster', 1, NOW(), NOW()),
(3, 'Telas Mezcladas', 1, NOW(), NOW()),
(4, 'Telas Estampadas', 1, NOW(), NOW()),
(5, 'Telas Teñidas', 1, NOW(), NOW()),
(6, 'Telas Ecológicas', 1, NOW(), NOW()),
(7, 'Telas para Uniformes', 1, NOW(), NOW()),
(8, 'Telas para Decoración', 1, NOW(), NOW()),
(9, 'Telas Técnicas', 1, NOW(), NOW()),
(10, 'Telas Artesanales', 1, NOW(), NOW());

-- Datos para products
INSERT INTO `products` (`id`, `category_id`, `product_name`, `details`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'Algodón Pima 200 hilos', 'Tela de algodón premium para camisas', 1, NOW(), NOW()),
(2, 1, 'Algodón Orgánico 150 hilos', 'Tela ecológica sin químicos', 1, NOW(), NOW()),
(3, 2, 'Poliéster Microfibra', 'Tela ligera y resistente', 1, NOW(), NOW()),
(4, 3, 'Algodón/Poliéster 65/35', 'Mezcla ideal para uniformes', 1, NOW(), NOW()),
(5, 4, 'Tela Estampada Floral', 'Diseños modernos para moda', 1, NOW(), NOW()),
(6, 5, 'Denim Teñido Índigo', 'Para confección de jeans', 1, NOW(), NOW()),
(7, 6, 'Tela Bambú', 'Material sostenible y suave', 1, NOW(), NOW()),
(8, 7, 'Tela Oxford para Uniformes', 'Resistente y fácil de lavar', 1, NOW(), NOW()),
(9, 8, 'Tela de Lino para Cortinas', 'Elegante y duradero', 1, NOW(), NOW()),
(10, 9, 'Tela Impermeable', 'Para ropa técnica y deportiva', 1, NOW(), NOW());

-- Datos para vendors
INSERT INTO `vendors` (`id`, `name`, `phone`, `email`, `address`, `created_at`, `updated_at`) VALUES
(1, 'Hilos y Telas S.A.', '555-100-1111', 'ventas@hilosytelas.com', 'Zona Industrial Textil 101, Ciudad', NOW(), NOW()),
(2, 'Proveedora de Algodón', '555-200-2222', 'contacto@algodonpro.com', 'Calle Materia Prima 202, Ciudad', NOW(), NOW()),
(3, 'Importadora Textil', '555-300-3333', 'pedidos@importex.com', 'Av. Proveedores 303, Ciudad', NOW(), NOW()),
(4, 'Colorantes Nacionales', '555-400-4444', 'info@colorantes.com', 'Av. Tintes 404, Ciudad', NOW(), NOW()),
(5, 'Maquinaria Textil', '555-500-5555', 'servicio@matextil.com', 'Calle Maquinaria 505, Ciudad', NOW(), NOW()),
(6, 'Insumos para Teñido', '555-600-6666', 'ventas@insumostextiles.com', 'Av. Químicos 606, Ciudad', NOW(), NOW()),
(7, 'Distribuidora de Telas', '555-700-7777', 'contacto@distritex.com', 'Calle Mayoristas 707, Ciudad', NOW(), NOW()),
(8, 'Hilandería Moderna', '555-800-8888', 'info@hilanderiamoderna.com', 'Av. Hilados 808, Ciudad', NOW(), NOW()),
(9, 'Tejeduría Industrial', '555-900-9999', 'ventas@tejeduriaindustrial.com', 'Calle Tejidos 909, Ciudad', NOW(), NOW()),
(10, 'Eco Materiales', '555-000-1010', 'contacto@ecomateriales.com', 'Av. Sostenible 100, Ciudad', NOW(), NOW());

-- Datos para customers
INSERT INTO `customers` (`id`, `customer_name`, `email`, `phone`, `address`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Boutique Elegante', 'contacto@boutiqueelegante.com', '555-111-1111', 'Calle Moda 456, Ciudad', 1, NOW(), NOW()),
(2, 'Confecciones Rápidas', 'ventas@confeccionesrapidas.com', '555-222-2222', 'Av. Costura 123, Ciudad', 1, NOW(), NOW()),
(3, 'Tienda de Telas', 'info@tiendadetelas.com', '555-333-3333', 'Calle Comercial 789, Ciudad', 1, NOW(), NOW()),
(4, 'Moda Corporativa', 'pedidos@modacorporativa.com', '555-444-4444', 'Av. Oficinas 101, Ciudad', 1, NOW(), NOW()),
(5, 'Uniformes Escolares', 'contacto@uniformescolares.com', '555-555-5555', 'Calle Educación 202, Ciudad', 1, NOW(), NOW()),
(6, 'Decoración Hogar', 'ventas@decoracionhogar.com', '555-666-6666', 'Av. Diseño 303, Ciudad', 1, NOW(), NOW()),
(7, 'Taller de Costura', 'info@tallercostura.com', '555-777-7777', 'Calle Artesanal 404, Ciudad', 1, NOW(), NOW()),
(8, 'Exportadora Textil', 'contacto@exportadoratextil.com', '555-888-8888', 'Zona Franca 505, Ciudad', 1, NOW(), NOW()),
(9, 'Mayorista de Ropa', 'pedidos@mayoristaropa.com', '555-999-9999', 'Av. Comercio 606, Ciudad', 1, NOW(), NOW()),
(10, 'Diseñadores Asociados', 'info@disenadoresasociados.com', '555-000-0000', 'Calle Creatividad 707, Ciudad', 1, NOW(), NOW());

-- Datos para stocks
INSERT INTO `stocks` (`id`, `category_id`, `product_code`, `product_id`, `vendor_id`, `user_id`, `chalan_no`, `buying_price`, `selling_price`, `discount`, `stock_quantity`, `current_quantity`, `note`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'TEL-ALG-001', 1, 1, 1, 'CH-TXT-2023-001', 8.50, 12.99, 0, 100, 100, 'Stock inicial', 1, NOW(), NOW()),
(2, 1, 'TEL-ALG-002', 2, 2, 1, 'CH-TXT-2023-002', 9.75, 14.50, 0, 150, 150, 'Stock inicial', 1, NOW(), NOW()),
(3, 2, 'TEL-POL-001', 3, 3, 1, 'CH-TXT-2023-003', 6.25, 9.99, 0, 200, 200, 'Stock inicial', 1, NOW(), NOW()),
(4, 3, 'TEL-MEZ-001', 4, 4, 1, 'CH-TXT-2023-004', 7.80, 11.50, 0, 120, 120, 'Stock inicial', 1, NOW(), NOW()),
(5, 4, 'TEL-EST-001', 5, 5, 1, 'CH-TXT-2023-005', 10.20, 15.75, 0, 80, 80, 'Stock inicial', 1, NOW(), NOW()),
(6, 5, 'TEL-TEN-001', 6, 6, 1, 'CH-TXT-2023-006', 12.50, 18.99, 0, 90, 90, 'Stock inicial', 1, NOW(), NOW()),
(7, 6, 'TEL-ECO-001', 7, 7, 1, 'CH-TXT-2023-007', 15.00, 22.50, 0, 70, 70, 'Stock inicial', 1, NOW(), NOW()),
(8, 7, 'TEL-UNI-001', 8, 8, 1, 'CH-TXT-2023-008', 9.30, 13.99, 0, 110, 110, 'Stock inicial', 1, NOW(), NOW()),
(9, 8, 'TEL-DEC-001', 9, 9, 1, 'CH-TXT-2023-009', 11.75, 17.25, 0, 95, 95, 'Stock inicial', 1, NOW(), NOW()),
(10, 9, 'TEL-TEC-001', 10, 10, 1, 'CH-TXT-2023-010', 14.20, 21.50, 0, 85, 85, 'Stock inicial', 1, NOW(), NOW());

-- Datos para sells
INSERT INTO `sells` (`id`, `user_id`, `customer_id`, `branch_id`, `total_amount`, `paid_amount`, `sell_date`, `discount_amount`, `payment_method`, `payment_status`, `created_at`, `updated_at`) VALUES
(1, 3, 1, 2, 389.70, 389.70, '2023-06-10', 0, 1, 1, NOW(), NOW()),
(2, 3, 2, 2, 525.00, 300.00, '2023-06-11', 0, 2, 0, NOW(), NOW()),
(3, 3, 3, 2, 450.25, 450.25, '2023-06-12', 0, 1, 1, NOW(), NOW()),
(4, 3, 4, 2, 320.50, 320.50, '2023-06-13', 0, 1, 1, NOW(), NOW()),
(5, 3, 5, 2, 280.75, 150.00, '2023-06-14', 0, 2, 0, NOW(), NOW()),
(6, 3, 6, 2, 410.20, 410.20, '2023-06-15', 0, 1, 1, NOW(), NOW()),
(7, 3, 7, 2, 365.90, 365.90, '2023-06-16', 0, 1, 1, NOW(), NOW()),
(8, 3, 8, 2, 295.60, 150.00, '2023-06-17', 0, 2, 0, NOW(), NOW()),
(9, 3, 9, 2, 480.30, 480.30, '2023-06-18', 0, 1, 1, NOW(), NOW()),
(10, 3, 10, 2, 340.80, 340.80, '2023-06-19', 0, 1, 1, NOW(), NOW());

-- Datos para sell_details
INSERT INTO `sell_details` (`id`, `stock_id`, `sell_id`, `product_id`, `category_id`, `vendor_id`, `user_id`, `chalan_no`, `selling_date`, `customer_id`, `sold_quantity`, `buy_price`, `sold_price`, `total_buy_price`, `total_sold_price`, `discount`, `discount_type`, `discount_amount`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 1, 1, 3, 'CH-TXT-2023-001', '2023-06-10', '1', 10, 8.50, 12.99, 85.00, 129.90, 0, 0, 0, NOW(), NOW()),
(2, 2, 1, 2, 1, 2, 3, 'CH-TXT-2023-002', '2023-06-10', '1', 5, 9.75, 14.50, 48.75, 72.50, 0, 0, 0, NOW(), NOW()),
(3, 3, 2, 3, 2, 3, 3, 'CH-TXT-2023-003', '2023-06-11', '2', 20, 6.25, 9.99, 125.00, 199.80, 0, 0, 0, NOW(), NOW()),
(4, 4, 2, 4, 3, 4, 3, 'CH-TXT-2023-004', '2023-06-11', '2', 15, 7.80, 11.50, 117.00, 172.50, 0, 0, 0, NOW(), NOW()),
(5, 5, 3, 5, 4, 5, 3, 'CH-TXT-2023-005', '2023-06-12', '3', 8, 10.20, 15.75, 81.60, 126.00, 0, 0, 0, NOW(), NOW()),
(6, 6, 4, 6, 5, 6, 3, 'CH-TXT-2023-006', '2023-06-13', '4', 10, 12.50, 18.99, 125.00, 189.90, 0, 0, 0, NOW(), NOW()),
(7, 7, 5, 7, 6, 7, 3, 'CH-TXT-2023-007', '2023-06-14', '5', 7, 15.00, 22.50, 105.00, 157.50, 0, 0, 0, NOW(), NOW()),
(8, 8, 6, 8, 7, 8, 3, 'CH-TXT-2023-008', '2023-06-15', '6', 12, 9.30, 13.99, 111.60, 167.88, 0, 0, 0, NOW(), NOW()),
(9, 9, 7, 9, 8, 9, 3, 'CH-TXT-2023-009', '2023-06-16', '7', 9, 11.75, 17.25, 105.75, 155.25, 0, 0, 0, NOW(), NOW()),
(10, 10, 8, 10, 9, 10, 3, 'CH-TXT-2023-010', '2023-06-17', '8', 8, 14.20, 21.50, 113.60, 172.00, 0, 0, 0, NOW(), NOW());

-- Datos para payments
INSERT INTO `payments` (`id`, `sell_id`, `customer_id`, `user_id`, `date`, `paid_in`, `bank_information`, `amount`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 3, '2023-06-10', 'Efectivo', NULL, 389.70, NOW(), NOW()),
(2, 2, 2, 3, '2023-06-11', 'Transferencia', 'Banco Textil, Ref: TXT-987654', 300.00, NOW(), NOW()),
(3, 3, 3, 3, '2023-06-12', 'Efectivo', NULL, 450.25, NOW(), NOW()),
(4, 4, 4, 3, '2023-06-13', 'Efectivo', NULL, 320.50, NOW(), NOW()),
(5, 5, 5, 3, '2023-06-14', 'Transferencia', 'Banco Textil, Ref: TXT-987655', 150.00, NOW(), NOW()),
(6, 6, 6, 3, '2023-06-15', 'Efectivo', NULL, 410.20, NOW(), NOW()),
(7, 7, 7, 3, '2023-06-16', 'Efectivo', NULL, 365.90, NOW(), NOW()),
(8, 8, 8, 3, '2023-06-17', 'Transferencia', 'Banco Textil, Ref: TXT-987656', 150.00, NOW(), NOW()),
(9, 9, 9, 3, '2023-06-18', 'Efectivo', NULL, 480.30, NOW(), NOW()),
(10, 10, 10, 3, '2023-06-19', 'Efectivo', NULL, 340.80, NOW(), NOW());

-- Datos para migrations (ejemplo básico)
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
(10, '2018_12_31_160432_create_categories_table', 3);