ALTER TABLE `Elnokrashyospos_sales_payments` ADD INDEX `employee_id` (`employee_id`);

ALTER TABLE `Elnokrashyospos_sales_payments`
  ADD CONSTRAINT `Elnokrashyospos_sales_payments_ibfk_2` FOREIGN KEY (`employee_id`) REFERENCES `Elnokrashyospos_employees` (`person_id`);

ALTER TABLE `Elnokrashyospos_customers` ADD INDEX `sales_tax_code_id` (`sales_tax_code_id`);

ALTER TABLE `Elnokrashyospos_customers`
  ADD CONSTRAINT `Elnokrashyospos_customers_ibfk_3` FOREIGN KEY (`sales_tax_code_id`) REFERENCES `Elnokrashyospos_tax_codes` (`tax_code_id`);

ALTER TABLE `Elnokrashyospos_tax_rates` ADD INDEX `rate_tax_category_id` (`rate_tax_category_id`);

ALTER TABLE `Elnokrashyospos_tax_rates`
  ADD CONSTRAINT `Elnokrashyospos_tax_rates_ibfk_1` FOREIGN KEY (`rate_tax_category_id`) REFERENCES `Elnokrashyospos_tax_categories` (`tax_category_id`);

ALTER TABLE `Elnokrashyospos_tax_rates` ADD INDEX `rate_tax_code_id` (`rate_tax_code_id`);

ALTER TABLE `Elnokrashyospos_tax_rates`
  ADD CONSTRAINT `Elnokrashyospos_tax_rates_ibfk_2` FOREIGN KEY (`rate_tax_code_id`) REFERENCES `Elnokrashyospos_tax_codes` (`tax_code_id`);

ALTER TABLE `Elnokrashyospos_tax_rates` ADD INDEX `rate_jurisdiction_id` (`rate_jurisdiction_id`);

ALTER TABLE `Elnokrashyospos_tax_rates`
  ADD CONSTRAINT `Elnokrashyospos_tax_rates_ibfk_3` FOREIGN KEY (`rate_jurisdiction_id`) REFERENCES `Elnokrashyospos_tax_jurisdictions` (`jurisdiction_id`);

ALTER TABLE `Elnokrashyospos_receivings` ADD INDEX `receiving_time` (`receiving_time`);

ALTER TABLE `Elnokrashyospos_sales_payments` ADD INDEX `payment_time` (`payment_time`);

ALTER TABLE `Elnokrashyospos_inventory` ADD INDEX `trans_date` (`trans_date`);

ALTER TABLE `Elnokrashyospos_expenses` ADD INDEX `date` (`date`);
