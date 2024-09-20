UPDATE `Elnokrashyospos_sales_payments`
  JOIN `Elnokrashyospos_sales` ON `Elnokrashyospos_sales`.`sale_id`=`Elnokrashyospos_sales_payments`.`sale_id`
  SET `Elnokrashyospos_sales_payments`.`payment_time`=`Elnokrashyospos_sales`.`sale_time`;
