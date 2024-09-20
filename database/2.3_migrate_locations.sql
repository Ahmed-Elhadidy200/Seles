INSERT INTO Elnokrashyospos_stock_locations (location_name) (SELECT DISTINCT(location) FROM Elnokrashyospos_items WHERE NOT EXISTS (select location from Elnokrashyospos_stock_locations where location_name = location));
INSERT INTO Elnokrashyospos_item_quantities (item_id, location_id, quantity) (SELECT item_id, location_id, quantity FROM Elnokrashyospos_items, Elnokrashyospos_stock_locations where Elnokrashyospos_items.location = Elnokrashyospos_stock_locations.location_name);
ALTER TABLE Elnokrashyospos_items DROP COLUMN location;
