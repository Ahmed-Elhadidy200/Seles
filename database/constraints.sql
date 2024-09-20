--
-- Constraints for dumped tables
--

--
-- Constraints for table `Elnokrashyospos_customers`
--
ALTER TABLE `Elnokrashyospos_customers`
  ADD CONSTRAINT `Elnokrashyospos_customers_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `Elnokrashyospos_people` (`person_id`),
  ADD CONSTRAINT `Elnokrashyospos_customers_ibfk_2` FOREIGN KEY (`package_id`) REFERENCES `Elnokrashyospos_customers_packages` (`package_id`);

--
-- Constraints for table `Elnokrashyospos_employees`
--
ALTER TABLE `Elnokrashyospos_employees`
  ADD CONSTRAINT `Elnokrashyospos_employees_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `Elnokrashyospos_people` (`person_id`);

--
-- Constraints for table `Elnokrashyospos_inventory`
--
ALTER TABLE `Elnokrashyospos_inventory`
  ADD CONSTRAINT `Elnokrashyospos_inventory_ibfk_1` FOREIGN KEY (`trans_items`) REFERENCES `Elnokrashyospos_items` (`item_id`),
  ADD CONSTRAINT `Elnokrashyospos_inventory_ibfk_2` FOREIGN KEY (`trans_user`) REFERENCES `Elnokrashyospos_employees` (`person_id`),
  ADD CONSTRAINT `Elnokrashyospos_inventory_ibfk_3` FOREIGN KEY (`trans_location`) REFERENCES `Elnokrashyospos_stock_locations` (`location_id`);

--
-- Constraints for table `Elnokrashyospos_items`
--
ALTER TABLE `Elnokrashyospos_items`
  ADD CONSTRAINT `Elnokrashyospos_items_ibfk_1` FOREIGN KEY (`supplier_id`) REFERENCES `Elnokrashyospos_suppliers` (`person_id`);

--
-- Constraints for table `Elnokrashyospos_items_taxes`
--
ALTER TABLE `Elnokrashyospos_items_taxes`
  ADD CONSTRAINT `Elnokrashyospos_items_taxes_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `Elnokrashyospos_items` (`item_id`) ON DELETE CASCADE;

--
-- Constraints for table `Elnokrashyospos_item_kit_items`
--
ALTER TABLE `Elnokrashyospos_item_kit_items`
  ADD CONSTRAINT `Elnokrashyospos_item_kit_items_ibfk_1` FOREIGN KEY (`item_kit_id`) REFERENCES `Elnokrashyospos_item_kits` (`item_kit_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `Elnokrashyospos_item_kit_items_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `Elnokrashyospos_items` (`item_id`)  ON DELETE CASCADE;

--
-- Constraints for table `Elnokrashyospos_permissions`
--
ALTER TABLE `Elnokrashyospos_permissions`
  ADD CONSTRAINT `Elnokrashyospos_permissions_ibfk_1` FOREIGN KEY (`module_id`) REFERENCES `Elnokrashyospos_modules` (`module_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `Elnokrashyospos_permissions_ibfk_2` FOREIGN KEY (`location_id`) REFERENCES `Elnokrashyospos_stock_locations` (`location_id`) ON DELETE CASCADE;

--
-- Constraints for table `Elnokrashyospos_grants`
--
ALTER TABLE `Elnokrashyospos_grants`
  ADD CONSTRAINT `Elnokrashyospos_grants_ibfk_1` foreign key (`permission_id`) references `Elnokrashyospos_permissions` (`permission_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `Elnokrashyospos_grants_ibfk_2` foreign key (`person_id`) references `Elnokrashyospos_employees` (`person_id`) ON DELETE CASCADE;

--
-- Constraints for table `Elnokrashyospos_receivings`
--
ALTER TABLE `Elnokrashyospos_receivings`
  ADD CONSTRAINT `Elnokrashyospos_receivings_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `Elnokrashyospos_employees` (`person_id`),
  ADD CONSTRAINT `Elnokrashyospos_receivings_ibfk_2` FOREIGN KEY (`supplier_id`) REFERENCES `Elnokrashyospos_suppliers` (`person_id`);

--
-- Constraints for table `Elnokrashyospos_receivings_items`
--
ALTER TABLE `Elnokrashyospos_receivings_items`
  ADD CONSTRAINT `Elnokrashyospos_receivings_items_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `Elnokrashyospos_items` (`item_id`),
  ADD CONSTRAINT `Elnokrashyospos_receivings_items_ibfk_2` FOREIGN KEY (`receiving_id`) REFERENCES `Elnokrashyospos_receivings` (`receiving_id`);

--
-- Constraints for table `Elnokrashyospos_sales`
--
ALTER TABLE `Elnokrashyospos_sales`
  ADD CONSTRAINT `Elnokrashyospos_sales_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `Elnokrashyospos_employees` (`person_id`),
  ADD CONSTRAINT `Elnokrashyospos_sales_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `Elnokrashyospos_customers` (`person_id`),
  ADD CONSTRAINT `Elnokrashyospos_sales_ibfk_3` FOREIGN KEY (`dinner_table_id`) REFERENCES `Elnokrashyospos_dinner_tables` (`dinner_table_id`);

--
-- Constraints for table `Elnokrashyospos_sales_items`
--
ALTER TABLE `Elnokrashyospos_sales_items`
  ADD CONSTRAINT `Elnokrashyospos_sales_items_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `Elnokrashyospos_items` (`item_id`),
  ADD CONSTRAINT `Elnokrashyospos_sales_items_ibfk_2` FOREIGN KEY (`sale_id`) REFERENCES `Elnokrashyospos_sales` (`sale_id`),
  ADD CONSTRAINT `Elnokrashyospos_sales_items_ibfk_3` FOREIGN KEY (`item_location`) REFERENCES `Elnokrashyospos_stock_locations` (`location_id`);

--
-- Constraints for table `Elnokrashyospos_sales_items_taxes`
--
ALTER TABLE `Elnokrashyospos_sales_items_taxes`
  ADD CONSTRAINT `Elnokrashyospos_sales_items_taxes_ibfk_1` FOREIGN KEY (`sale_id`) REFERENCES `Elnokrashyospos_sales_items` (`sale_id`),
  ADD CONSTRAINT `Elnokrashyospos_sales_items_taxes_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `Elnokrashyospos_items` (`item_id`);

--
-- Constraints for table `Elnokrashyospos_sales_payments`
--
ALTER TABLE `Elnokrashyospos_sales_payments`
  ADD CONSTRAINT `Elnokrashyospos_sales_payments_ibfk_1` FOREIGN KEY (`sale_id`) REFERENCES `Elnokrashyospos_sales` (`sale_id`);

--
-- Constraints for table `Elnokrashyospos_item_quantities`
--
ALTER TABLE `Elnokrashyospos_item_quantities`
  ADD CONSTRAINT `Elnokrashyospos_item_quantities_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `Elnokrashyospos_items` (`item_id`),
  ADD CONSTRAINT `Elnokrashyospos_item_quantities_ibfk_2` FOREIGN KEY (`location_id`) REFERENCES `Elnokrashyospos_stock_locations` (`location_id`);

--
-- Constraints for table `Elnokrashyospos_suppliers`
--
ALTER TABLE `Elnokrashyospos_suppliers`
  ADD CONSTRAINT `Elnokrashyospos_suppliers_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `Elnokrashyospos_people` (`person_id`);
  
--
-- Constraints for table `Elnokrashyospos_giftcards`
--
ALTER TABLE `Elnokrashyospos_giftcards`
  ADD CONSTRAINT `Elnokrashyospos_giftcards_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `Elnokrashyospos_people` (`person_id`);

--
-- Constraints for table `Elnokrashyospos_customers_points`
--
ALTER TABLE `Elnokrashyospos_customers_points`
 ADD CONSTRAINT `Elnokrashyospos_customers_points_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `Elnokrashyospos_customers` (`person_id`),
 ADD CONSTRAINT `Elnokrashyospos_customers_points_ibfk_2` FOREIGN KEY (`package_id`) REFERENCES `Elnokrashyospos_customers_packages` (`package_id`),
 ADD CONSTRAINT `Elnokrashyospos_customers_points_ibfk_3` FOREIGN KEY (`sale_id`) REFERENCES `Elnokrashyospos_sales` (`sale_id`);

--
-- Constraints for table `Elnokrashyospos_sales_reward_points`
--
ALTER TABLE `Elnokrashyospos_sales_reward_points`
 ADD CONSTRAINT `Elnokrashyospos_sales_reward_points_ibfk_1` FOREIGN KEY (`sale_id`) REFERENCES `Elnokrashyospos_sales` (`sale_id`);
