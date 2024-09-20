ALTER TABLE Elnokrashyospos_giftcards MODIFY value decimal(15,2);

ALTER TABLE Elnokrashyospos_items MODIFY cost_price decimal(15,2);
ALTER TABLE Elnokrashyospos_items MODIFY unit_price decimal(15,2);
ALTER TABLE Elnokrashyospos_items MODIFY quantity decimal(15,0);
ALTER TABLE Elnokrashyospos_items MODIFY reorder_level decimal(15,0);

ALTER TABLE Elnokrashyospos_items_taxes MODIFY percent decimal(15,2);

ALTER TABLE Elnokrashyospos_item_kit_items MODIFY quantity decimal(15,0); 

ALTER TABLE Elnokrashyospos_receivings_items MODIFY quantity_purchased decimal(15,0);
ALTER TABLE Elnokrashyospos_receivings_items MODIFY item_unit_price decimal(15,2);
ALTER TABLE Elnokrashyospos_receivings_items MODIFY discount_percent decimal(15,2);

ALTER TABLE Elnokrashyospos_sales_items_taxes MODIFY percent decimal(15,2);

ALTER TABLE Elnokrashyospos_sales_suspended_items MODIFY quantity_purchased decimal(15,0);
ALTER TABLE Elnokrashyospos_sales_suspended_items MODIFY item_unit_price decimal(15,2);
ALTER TABLE Elnokrashyospos_sales_suspended_items MODIFY discount_percent decimal(15,2);

ALTER TABLE Elnokrashyospos_sales_suspended_items_taxes MODIFY percent decimal(15,2);

ALTER TABLE Elnokrashyospos_sessions MODIFY ip_address varchar(45);
