--
-- Add support for office menu group
--

ALTER TABLE `Elnokrashyospos_grants`
  ADD COLUMN `menu_group` varchar(32) DEFAULT 'home';

INSERT INTO `Elnokrashyospos_modules` (`name_lang_key`, `desc_lang_key`, `sort`, `module_id`) VALUES
('module_office', 'module_office_desc', 1, 'office'),
('module_home', 'module_home_desc', 1, 'home');

INSERT INTO `Elnokrashyospos_permissions` (`permission_id`, `module_id`) VALUES
('office', 'office'),
('home', 'home');

INSERT INTO `Elnokrashyospos_grants` (`permission_id`, `person_id`, `menu_group`) VALUES
('office', 1, 'home'),
('home', 1, 'office');

UPDATE `Elnokrashyospos_grants`
SET menu_group = 'office'
WHERE permission_id in ('config', 'home', 'employees', 'taxes', 'migrate')
AND person_id = 1;

--
-- Add support for Work Orders
--

INSERT INTO `Elnokrashyospos_app_config` (`key`, `value`) VALUES
('work_order_enable', '0'),
('work_order_format', 'W%y{WSEQ:6}'),
('last_used_work_order_number', '0');

ALTER TABLE `Elnokrashyospos_sales`
  ADD COLUMN `work_order_number` varchar(32) DEFAULT NULL,
  ADD COLUMN `sale_type` tinyint(2) NOT NULL DEFAULT 0;

-- sale_type (0=pos, 1=invoice, 2=work order, 3=quote, 4=return)

UPDATE `Elnokrashyospos_sales`
  SET `sale_type` = 0;

UPDATE Elnokrashyospos_sales t1
  SET sale_type = 4
WHERE EXISTS (SELECT t2.sale_id FROM Elnokrashyospos_sales_items t2 WHERE t1.sale_id = t2.sale_id AND t2.quantity_purchased < 0);

UPDATE `Elnokrashyospos_sales`
  SET `sale_type` = 3
WHERE `quote_number` IS NOT NULL;

-- The following is needed only if quotes were being treated as work orders.
-- UPDATE `Elnokrashyospos_sales`
--   SET `sale_type` = 2, `work_order_number` = `quote_number`
-- WHERE quote_number IS NOT NULL;

-- Identify invoices
UPDATE `Elnokrashyospos_sales`
  SET `sale_type` = 1
WHERE `invoice_number` IS NOT NULL;


--  Add permissions for deleting sales and default grant for employee id 1

INSERT INTO `Elnokrashyospos_permissions` (`permission_id`, `module_id`) VALUES
('sales_delete', 'sales');

INSERT INTO `Elnokrashyospos_grants` (`permission_id`, `person_id`, `menu_group`) VALUES
('sales_delete', 1, '--');


-- Add columns to save per-user language selection

ALTER TABLE `Elnokrashyospos_employees` 
  ADD COLUMN `language` VARCHAR(48) DEFAULT NULL,
  ADD COLUMN `language_code` VARCHAR(8) DEFAULT NULL;


-- Add support for custom search suggestion format

INSERT INTO `Elnokrashyospos_app_config` (`key`, `value`) VALUES
('suggestions_first_column', 'name'),
('suggestions_second_column', ''),
('suggestions_third_column', '');


-- Add key->value to save setting for allowing duplicate barcodes

INSERT INTO `Elnokrashyospos_app_config` (`key`, `value`) VALUES
('allow_duplicate_barcodes', '0');


-- Modify items table to allow duplicate barcodes

ALTER TABLE `Elnokrashyospos_items`
  DROP INDEX `item_number`,
  ADD KEY `item_number` (item_number);


-- Remove Migrate module as auto migration is supported

DELETE FROM `Elnokrashyospos_modules` WHERE `Elnokrashyospos_modules`.`module_id` = 'migrate';
DELETE FROM `Elnokrashyospos_permissions` WHERE `Elnokrashyospos_permissions`.`permission_id` = 'migrate';
DELETE FROM `Elnokrashyospos_grants` WHERE `Elnokrashyospos_grants`.`permission_id` = 'migrate' AND `Elnokrashyospos_grants`.`person_id` = 1;


-- Move Office Module to Right side of Modules list

UPDATE `Elnokrashyospos_modules`
SET `sort` = 999
WHERE `name_lang_key` = 'module_office';

UPDATE `Elnokrashyospos_modules`
SET `sort` = 98
WHERE `name_lang_key` = 'module_messages';


--
-- Add support for expenses tracking
--

INSERT INTO `Elnokrashyospos_modules` (`name_lang_key`, `desc_lang_key`, `sort`, `module_id`) VALUES
('module_expenses', 'module_expenses_desc', 108, 'expenses'),
('module_expenses_categories', 'module_expenses_categories_desc', 109, 'expenses_categories');

INSERT INTO `Elnokrashyospos_permissions` (`permission_id`, `module_id`) VALUES
('expenses_categories', 'expenses_categories'),
('expenses', 'expenses'),
('reports_expenses_categories', 'reports'); 

INSERT INTO `Elnokrashyospos_grants` (`permission_id`, `person_id`) VALUES 
('expenses', 1),
('expenses_categories', 1),
('reports_expenses_categories', 1);
 

-- Table structure for table `Elnokrashyospos_expense_categories`

CREATE TABLE IF NOT EXISTS `Elnokrashyospos_expense_categories` (
  `expense_category_id` int(10) NOT NULL,
  `category_name` varchar(255) DEFAULT NULL,
  `category_description` varchar(255) NOT NULL,
  `deleted` int(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- Table structure for table `Elnokrashyospos_expenses`

CREATE TABLE IF NOT EXISTS `Elnokrashyospos_expenses` (
  `expense_id` int(10) NOT NULL,
  `date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `amount` decimal(15,2) NOT NULL,
  `payment_type` varchar(40) NOT NULL,
  `expense_category_id` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `employee_id` int(10) NOT NULL,
  `deleted` int(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- Indexes for table `Elnokrashyospos_expense_categories`

ALTER TABLE `Elnokrashyospos_expense_categories`
  ADD PRIMARY KEY (`expense_category_id`),
  ADD UNIQUE KEY `category_name` (`category_name`);


-- Indexes for table `Elnokrashyospos_expenses`

ALTER TABLE `Elnokrashyospos_expenses`
  ADD PRIMARY KEY (`expense_id`),
  ADD KEY `expense_category_id` (`expense_category_id`),
  ADD KEY `employee_id` (`employee_id`);


-- AUTO_INCREMENT for table `Elnokrashyospos_expense_categories`

ALTER TABLE `Elnokrashyospos_expense_categories`
  MODIFY `expense_category_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;


-- AUTO_INCREMENT for table `Elnokrashyospos_expenses`

ALTER TABLE `Elnokrashyospos_expenses`
  MODIFY `expense_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;


-- Constraints for table `Elnokrashyospos_expenses`

ALTER TABLE `Elnokrashyospos_expenses`
  ADD CONSTRAINT `Elnokrashyospos_expenses_ibfk_1` FOREIGN KEY (`expense_category_id`) REFERENCES `Elnokrashyospos_expense_categories` (`expense_category_id`),
  ADD CONSTRAINT `Elnokrashyospos_expenses_ibfk_2` FOREIGN KEY (`employee_id`) REFERENCES `Elnokrashyospos_employees` (`person_id`);


-- Add extra columns to `Elnokrashyospos_expenses`

ALTER TABLE `Elnokrashyospos_expenses`
  ADD COLUMN `supplier_name` varchar(255) DEFAULT NULL,
  ADD COLUMN `supplier_tax_code` varchar(255) DEFAULT NULL,
  ADD COLUMN `tax_amount` decimal(15,2) DEFAULT NULL;


-- Remove unused barcode quality

DELETE FROM `Elnokrashyospos_app_config` WHERE `key` = 'barcode_quality';


-- Add new config option to allow derive sale quantity feature

INSERT INTO `Elnokrashyospos_app_config` (`key`, `value`) VALUES
('derive_sale_quantity', '0');


-- Add new config option to set print and email receipt behaviour

INSERT INTO `Elnokrashyospos_app_config` (`key`, `value`) VALUES
('email_receipt_check_behaviour', 'last'),
('print_receipt_check_behaviour', 'last');


-- This is to provide distinct default comments for both quotes and invoices

INSERT INTO `Elnokrashyospos_app_config` (`key`, `value`) VALUES
('quote_default_comments', 'This is a default quote comment');
