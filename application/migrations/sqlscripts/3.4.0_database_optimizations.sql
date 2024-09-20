#Elnokrashyospos_attribute_values table
ALTER TABLE `Elnokrashyospos_attribute_values` ADD UNIQUE(`attribute_date`);
ALTER TABLE `Elnokrashyospos_attribute_values` ADD UNIQUE(`attribute_decimal`); 

#opsos_attribute_definitions table
ALTER TABLE `Elnokrashyospos_attribute_definitions` MODIFY `definition_flags` tinyint(1) NOT NULL;
ALTER TABLE `Elnokrashyospos_attribute_definitions` ADD INDEX(`definition_name`); 
ALTER TABLE `Elnokrashyospos_attribute_definitions` ADD INDEX(`definition_type`);

#opsos_attribute_links table
ALTER TABLE `Elnokrashyospos_attribute_links` ADD UNIQUE INDEX `attribute_links_uq2` (`item_id`,`sale_id`,`receiving_id`,`definition_id`,`attribute_id`);

#Elnokrashyospos_cash_up table
ALTER TABLE `Elnokrashyospos_cash_up` MODIFY `deleted` tinyint(1) DEFAULT 0 NOT NULL;

#Elnokrashyospos_customers table
DROP INDEX `person_id` ON `Elnokrashyospos_customers`;
ALTER TABLE `Elnokrashyospos_customers` MODIFY `taxable` tinyint(1) DEFAULT 1 NOT NULL;
ALTER TABLE `Elnokrashyospos_customers` MODIFY `deleted` tinyint(1) DEFAULT 0 NOT NULL;
ALTER TABLE `Elnokrashyospos_customers` MODIFY `discount_type` tinyint(1) DEFAULT 0 NOT NULL;
ALTER TABLE `Elnokrashyospos_customers` ADD PRIMARY KEY(`person_id`);
ALTER TABLE `Elnokrashyospos_customers` ADD INDEX(`company_name`);

#Elnokrashyospos_customers_packages table
ALTER TABLE `Elnokrashyospos_customers_packages` MODIFY `deleted` tinyint(1) DEFAULT 0 NOT NULL;

#Elnokrashyospos_dinner_tables table
ALTER TABLE `Elnokrashyospos_dinner_tables` MODIFY `deleted` tinyint(1) DEFAULT 0 NOT NULL;
ALTER TABLE `Elnokrashyospos_dinner_tables` ADD INDEX(`status`);

#Elnokrashyospos_employees table
DROP INDEX `person_id` ON `Elnokrashyospos_employees`;
ALTER TABLE `Elnokrashyospos_employees` MODIFY `deleted` tinyint(1) DEFAULT 0 NOT NULL;
ALTER TABLE `Elnokrashyospos_employees` MODIFY `hash_version` tinyint(1) DEFAULT 2 NOT NULL;
ALTER TABLE `Elnokrashyospos_employees` ADD PRIMARY KEY(`person_id`);

#Elnokrashyospos_expenses table
ALTER TABLE `Elnokrashyospos_expenses` MODIFY `deleted` tinyint(1) DEFAULT 0 NOT NULL;
ALTER TABLE `Elnokrashyospos_expenses` ADD INDEX(`payment_type`);
ALTER TABLE `Elnokrashyospos_expenses` ADD INDEX(`amount`);

#Elnokrashyospos_expenses_categories table
ALTER TABLE `Elnokrashyospos_expense_categories` MODIFY `deleted` tinyint(1) DEFAULT 0 NOT NULL;
ALTER TABLE `Elnokrashyospos_expense_categories` ADD INDEX(`category_description`);

#Elnokrashyospos_giftcards table
ALTER TABLE `Elnokrashyospos_giftcards` MODIFY `deleted` tinyint(1) DEFAULT 0 NOT NULL;

#Elnokrashyospos_items table
ALTER TABLE `Elnokrashyospos_items` MODIFY `deleted` tinyint(1) DEFAULT 0 NOT NULL;
ALTER TABLE `Elnokrashyospos_items` MODIFY `stock_type` tinyint(1) DEFAULT 0 NOT NULL;
ALTER TABLE `Elnokrashyospos_items` MODIFY `item_type` tinyint(1) DEFAULT 0 NOT NULL;
ALTER TABLE `Elnokrashyospos_items` ADD INDEX(`deleted`, `item_type`);
ALTER TABLE `Elnokrashyospos_items` ADD INDEX(`PRIMARY`, `deleted`);
ALTER TABLE `Elnokrashyospos_items` ADD UNIQUE INDEX `items_uq1` (`supplier_id`, `item_id`, `deleted`, `item_type`);

#Elnokrashyospos_item_kits table
ALTER TABLE `Elnokrashyospos_item_kits` MODIFY `kit_discount_type` tinyint(1) DEFAULT 0 NOT NULL;
ALTER TABLE `Elnokrashyospos_item_kits` MODIFY `price_option` tinyint(1) DEFAULT 0 NOT NULL;
ALTER TABLE `Elnokrashyospos_item_kits` MODIFY `print_option` tinyint(1) DEFAULT 0 NOT NULL;
ALTER TABLE `Elnokrashyospos_item_kits` ADD INDEX(`name`,`description`);

#Elnokrashyospos_item_quantities table
ALTER TABLE `Elnokrashyospos_item_quantities` ADD INDEX(`PRIMARY`,`item_id`,`location_id`);

#Elnokrashyospos_people table
ALTER TABLE `Elnokrashyospos_people` ADD INDEX(`first_name`, `last_name`, `email`, `phone_number`); 

#Elnokrashyospos_receivings_items
ALTER TABLE `Elnokrashyospos_receivings_items` MODIFY `discount_type` tinyint(1) DEFAULT 0 NOT NULL;

#Elnokrashyospos_sales
ALTER TABLE `Elnokrashyospos_sales` MODIFY `sale_status` tinyint(1) DEFAULT 0 NOT NULL;
ALTER TABLE `Elnokrashyospos_sales` MODIFY `sale_type` tinyint(1) DEFAULT 0 NOT NULL;

#Elnokrashyospos_sales_items
ALTER TABLE `Elnokrashyospos_sales_items` MODIFY `discount_type` tinyint(1) DEFAULT 0 NOT NULL;
ALTER TABLE `Elnokrashyospos_sales_items` MODIFY `print_option` tinyint(1) DEFAULT 0 NOT NULL;

#Elnokrashyospos_sales_items_taxes
ALTER TABLE `Elnokrashyospos_sales_items_taxes` MODIFY `tax_type` tinyint(1) DEFAULT 0 NOT NULL;
ALTER TABLE `Elnokrashyospos_sales_items_taxes` MODIFY `rounding_code` tinyint(1) DEFAULT 0 NOT NULL;
ALTER TABLE `Elnokrashyospos_sales_items_taxes` MODIFY `cascade_sequence` tinyint(1) DEFAULT 0 NOT NULL;

#Elnokrashyospos_sales_taxes
ALTER TABLE `Elnokrashyospos_sales_taxes` MODIFY `print_sequence` tinyint(1) DEFAULT 0 NOT NULL;
ALTER TABLE `Elnokrashyospos_sales_taxes` MODIFY `rounding_code` tinyint(1) DEFAULT 0 NOT NULL;

#Elnokrashyospos_sessions table
ALTER TABLE `Elnokrashyospos_sessions` ADD INDEX(`id`); 
ALTER TABLE `Elnokrashyospos_sessions` ADD INDEX(`ip_address`);

#Elnokrashyospos_stock_locations table
ALTER TABLE `Elnokrashyospos_stock_locations` MODIFY `deleted` tinyint(1) DEFAULT 0 NOT NULL;

#Elnokrashyospos_suppliers table
DROP INDEX `person_id` ON `Elnokrashyospos_suppliers`;
ALTER TABLE `Elnokrashyospos_suppliers` MODIFY `deleted` tinyint(1) DEFAULT 0 NOT NULL;
ALTER TABLE `Elnokrashyospos_suppliers` MODIFY `category` tinyint(1) NOT NULL;
ALTER TABLE `Elnokrashyospos_suppliers` ADD PRIMARY KEY(`person_id`);
ALTER TABLE `Elnokrashyospos_suppliers` ADD INDEX(`category`);
ALTER TABLE `Elnokrashyospos_suppliers` ADD INDEX(`company_name`, `deleted`);

#Elnokrashyospos_tax_categories table
ALTER TABLE `Elnokrashyospos_tax_categories` MODIFY `deleted` tinyint(1) DEFAULT 0 NOT NULL;
ALTER TABLE `Elnokrashyospos_tax_categories` MODIFY `tax_group_sequence` tinyint(1) NOT NULL;

#Elnokrashyospos_tax_codes table
ALTER TABLE `Elnokrashyospos_tax_codes` MODIFY `deleted` tinyint(1) DEFAULT 0 NOT NULL;

#Elnokrashyospos_tax_jurisdictions table
ALTER TABLE `Elnokrashyospos_tax_jurisdictions` MODIFY `deleted` tinyint(1) DEFAULT 0 NOT NULL;
ALTER TABLE `Elnokrashyospos_tax_jurisdictions` MODIFY `tax_group_sequence` tinyint(1) DEFAULT 0 NOT NULL;
ALTER TABLE `Elnokrashyospos_tax_jurisdictions` MODIFY `cascade_sequence` tinyint(1) DEFAULT 0 NOT NULL;

#Elnokrashyospos_tax_rates table
ALTER TABLE `Elnokrashyospos_tax_rates` MODIFY `tax_rounding_code` tinyint(1) DEFAULT 0 NOT NULL;