
CREATE TABLE IF NOT EXISTS `Elnokrashyospos_attribute_definitions` (
 `definition_id` INT(10) NOT NULL AUTO_INCREMENT,
 `definition_name` VARCHAR(255) NOT NULL,
 `definition_type` VARCHAR(45) NOT NULL,
 `definition_flags` TINYINT(4) NOT NULL,
 `definition_fk` INT(10) NULL,
 `deleted` TINYINT(1) NOT NULL DEFAULT 0,
 PRIMARY KEY (`definition_id`),
 KEY `definition_fk` (`definition_fk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


CREATE TABLE IF NOT EXISTS `Elnokrashyospos_attribute_values` (
 `attribute_id` INT NOT NULL AUTO_INCREMENT,
 `attribute_value` VARCHAR(255) UNIQUE NULL,
 `attribute_datetime` DATETIME NULL,
 PRIMARY KEY (`attribute_id`)
) ENGINE = InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


CREATE TABLE IF NOT EXISTS `Elnokrashyospos_attribute_links` (
 `attribute_id` INT NULL,
 `definition_id` INT NOT NULL,
 `item_id` INT NULL,
 `sale_id` INT NULL,
 `receiving_id` INT NULL,
 KEY `attribute_id` (`attribute_id`),
 KEY `definition_id` (`definition_id`),
 KEY `item_id` (`item_id`),
 KEY `sale_id` (`sale_id`),
 KEY `receiving_id` (`receiving_id`),
 UNIQUE `attribute_links_uq1` (`attribute_id`, `definition_id`, `item_id`, `sale_id`, `receiving_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


ALTER TABLE `Elnokrashyospos_attribute_definitions`
 ADD CONSTRAINT `fk_Elnokrashyospos_attribute_definitions_ibfk_1` FOREIGN KEY (`definition_fk`) REFERENCES `Elnokrashyospos_attribute_definitions` (`definition_id`);


ALTER TABLE `Elnokrashyospos_attribute_links`
 ADD CONSTRAINT `Elnokrashyospos_attribute_links_ibfk_1` FOREIGN KEY (`definition_id`) REFERENCES `Elnokrashyospos_attribute_definitions` (`definition_id`) ON DELETE CASCADE,
 ADD CONSTRAINT `Elnokrashyospos_attribute_links_ibfk_2` FOREIGN KEY (`attribute_id`) REFERENCES `Elnokrashyospos_attribute_values` (`attribute_id`) ON DELETE CASCADE,
 ADD CONSTRAINT `Elnokrashyospos_attribute_links_ibfk_3` FOREIGN KEY (`item_id`)  REFERENCES `Elnokrashyospos_items` (`item_id`),
 ADD CONSTRAINT `Elnokrashyospos_attribute_links_ibfk_4` FOREIGN KEY (`receiving_id`) REFERENCES `Elnokrashyospos_receivings` (`receiving_id`),
 ADD CONSTRAINT `Elnokrashyospos_attribute_links_ibfk_5` FOREIGN KEY (`sale_id`) REFERENCES `Elnokrashyospos_sales` (`sale_id`);

INSERT INTO `Elnokrashyospos_modules` (`name_lang_key`, `desc_lang_key`, `sort`, `module_id`) VALUES
 ('module_attributes', 'module_attributes_desc', 107, 'attributes');

INSERT INTO `Elnokrashyospos_permissions` (`permission_id`, `module_id`) VALUES
 ('attributes', 'attributes');

INSERT INTO `Elnokrashyospos_grants` (`permission_id`, `person_id`, `menu_group`) VALUES
 ('attributes', 1, 'office');

-- migrate custom fields to text attributes
-- NOTE: items with custom attributes won't keep their selected category!!
INSERT INTO `Elnokrashyospos_attribute_definitions` (definition_name, definition_type, definition_flags) SELECT `value`, 'TEXT', 1 FROM Elnokrashyospos_app_config WHERE `key` = 'custom1_name' AND `value` <> '';
INSERT INTO `Elnokrashyospos_attribute_definitions` (definition_name, definition_type, definition_flags) SELECT `value`, 'TEXT', 1 FROM Elnokrashyospos_app_config WHERE `key` = 'custom2_name' AND `value` <> '';
INSERT INTO `Elnokrashyospos_attribute_definitions` (definition_name, definition_type, definition_flags) SELECT `value`, 'TEXT', 1 FROM Elnokrashyospos_app_config WHERE `key` = 'custom3_name' AND `value` <> '';
INSERT INTO `Elnokrashyospos_attribute_definitions` (definition_name, definition_type, definition_flags) SELECT `value`, 'TEXT', 1 FROM Elnokrashyospos_app_config WHERE `key` = 'custom4_name' AND `value` <> '';
INSERT INTO `Elnokrashyospos_attribute_definitions` (definition_name, definition_type, definition_flags) SELECT `value`, 'TEXT', 1 FROM Elnokrashyospos_app_config WHERE `key` = 'custom5_name' AND `value` <> '';
INSERT INTO `Elnokrashyospos_attribute_definitions` (definition_name, definition_type, definition_flags) SELECT `value`, 'TEXT', 1 FROM Elnokrashyospos_app_config WHERE `key` = 'custom6_name' AND `value` <> '';
INSERT INTO `Elnokrashyospos_attribute_definitions` (definition_name, definition_type, definition_flags) SELECT `value`, 'TEXT', 1 FROM Elnokrashyospos_app_config WHERE `key` = 'custom7_name' AND `value` <> '';
INSERT INTO `Elnokrashyospos_attribute_definitions` (definition_name, definition_type, definition_flags) SELECT `value`, 'TEXT', 1 FROM Elnokrashyospos_app_config WHERE `key` = 'custom8_name' AND `value` <> '';
INSERT INTO `Elnokrashyospos_attribute_definitions` (definition_name, definition_type, definition_flags) SELECT `value`, 'TEXT', 1 FROM Elnokrashyospos_app_config WHERE `key` = 'custom9_name' AND `value` <> '';
INSERT INTO `Elnokrashyospos_attribute_definitions` (definition_name, definition_type, definition_flags) SELECT `value`, 'TEXT', 1 FROM Elnokrashyospos_app_config WHERE `key` = 'custom10_name' AND `value` <> '';

INSERT INTO Elnokrashyospos_attribute_links (definition_id, item_id) SELECT definition_id, item_id FROM Elnokrashyospos_attribute_definitions, Elnokrashyospos_app_config, Elnokrashyospos_items
 WHERE Elnokrashyospos_app_config.`key` = 'custom1_name' AND Elnokrashyospos_app_config.`value` = Elnokrashyospos_attribute_definitions.definition_name AND custom1 IS NOT NULL AND custom1 != '';
INSERT INTO Elnokrashyospos_attribute_links (definition_id, item_id) SELECT definition_id, item_id FROM Elnokrashyospos_attribute_definitions, Elnokrashyospos_app_config, Elnokrashyospos_items
 WHERE Elnokrashyospos_app_config.`key` = 'custom2_name' AND Elnokrashyospos_app_config.`value` = Elnokrashyospos_attribute_definitions.definition_name AND custom2 IS NOT NULL AND custom2 != '';
INSERT INTO Elnokrashyospos_attribute_links (definition_id, item_id) SELECT definition_id, item_id FROM Elnokrashyospos_attribute_definitions, Elnokrashyospos_app_config, Elnokrashyospos_items
 WHERE Elnokrashyospos_app_config.`key` = 'custom3_name' AND Elnokrashyospos_app_config.`value` = Elnokrashyospos_attribute_definitions.definition_name AND custom3 IS NOT NULL AND custom3 != '';
INSERT INTO Elnokrashyospos_attribute_links (definition_id, item_id) SELECT definition_id, item_id FROM Elnokrashyospos_attribute_definitions, Elnokrashyospos_app_config, Elnokrashyospos_items
 WHERE Elnokrashyospos_app_config.`key` = 'custom4_name' AND Elnokrashyospos_app_config.`value` = Elnokrashyospos_attribute_definitions.definition_name AND custom4 IS NOT NULL AND custom4 != '';
INSERT INTO Elnokrashyospos_attribute_links (definition_id, item_id) SELECT definition_id, item_id FROM Elnokrashyospos_attribute_definitions, Elnokrashyospos_app_config, Elnokrashyospos_items
 WHERE Elnokrashyospos_app_config.`key` = 'custom5_name' AND Elnokrashyospos_app_config.`value` = Elnokrashyospos_attribute_definitions.definition_name AND custom5 IS NOT NULL AND custom5 != '';
INSERT INTO Elnokrashyospos_attribute_links (definition_id, item_id) SELECT definition_id, item_id FROM Elnokrashyospos_attribute_definitions, Elnokrashyospos_app_config, Elnokrashyospos_items
 WHERE Elnokrashyospos_app_config.`key` = 'custom6_name' AND Elnokrashyospos_app_config.`value` = Elnokrashyospos_attribute_definitions.definition_name AND custom6 IS NOT NULL AND custom6 != '';
INSERT INTO Elnokrashyospos_attribute_links (definition_id, item_id) SELECT definition_id, item_id FROM Elnokrashyospos_attribute_definitions, Elnokrashyospos_app_config, Elnokrashyospos_items
 WHERE Elnokrashyospos_app_config.`key` = 'custom7_name' AND Elnokrashyospos_app_config.`value` = Elnokrashyospos_attribute_definitions.definition_name AND custom7 IS NOT NULL AND custom7 != '';
INSERT INTO Elnokrashyospos_attribute_links (definition_id, item_id) SELECT definition_id, item_id FROM Elnokrashyospos_attribute_definitions, Elnokrashyospos_app_config, Elnokrashyospos_items
 WHERE Elnokrashyospos_app_config.`key` = 'custom8_name' AND Elnokrashyospos_app_config.`value` = Elnokrashyospos_attribute_definitions.definition_name AND custom8 IS NOT NULL AND custom8 != '';
INSERT INTO Elnokrashyospos_attribute_links (definition_id, item_id) SELECT definition_id, item_id FROM Elnokrashyospos_attribute_definitions, Elnokrashyospos_app_config, Elnokrashyospos_items
 WHERE Elnokrashyospos_app_config.`key` = 'custom9_name' AND Elnokrashyospos_app_config.`value` = Elnokrashyospos_attribute_definitions.definition_name AND custom9 IS NOT NULL AND custom9 != '';
INSERT INTO Elnokrashyospos_attribute_links (definition_id, item_id) SELECT definition_id, item_id FROM Elnokrashyospos_attribute_definitions, Elnokrashyospos_app_config, Elnokrashyospos_items
 WHERE Elnokrashyospos_app_config.`key` = 'custom10_name' AND Elnokrashyospos_app_config.`value` = Elnokrashyospos_attribute_definitions.definition_name AND custom10 IS NOT NULL AND custom10 != '';

INSERT IGNORE INTO Elnokrashyospos_attribute_values (attribute_value) SELECT DISTINCT custom1 FROM Elnokrashyospos_items WHERE custom1 <> '' AND '' <> (SELECT `value` FROM Elnokrashyospos_app_config WHERE `key` = 'custom1_name');
INSERT IGNORE INTO Elnokrashyospos_attribute_values (attribute_value) SELECT DISTINCT custom2 FROM Elnokrashyospos_items WHERE custom2 <> '' AND '' <> (SELECT `value` FROM Elnokrashyospos_app_config WHERE `key` = 'custom2_name');
INSERT IGNORE INTO Elnokrashyospos_attribute_values (attribute_value) SELECT DISTINCT custom3 FROM Elnokrashyospos_items WHERE custom3 <> '' AND '' <> (SELECT `value` FROM Elnokrashyospos_app_config WHERE `key` = 'custom3_name');
INSERT IGNORE INTO Elnokrashyospos_attribute_values (attribute_value) SELECT DISTINCT custom4 FROM Elnokrashyospos_items WHERE custom4 <> '' AND '' <> (SELECT `value` FROM Elnokrashyospos_app_config WHERE `key` = 'custom4_name');
INSERT IGNORE INTO Elnokrashyospos_attribute_values (attribute_value) SELECT DISTINCT custom5 FROM Elnokrashyospos_items WHERE custom5 <> '' AND '' <> (SELECT `value` FROM Elnokrashyospos_app_config WHERE `key` = 'custom5_name');
INSERT IGNORE INTO Elnokrashyospos_attribute_values (attribute_value) SELECT DISTINCT custom6 FROM Elnokrashyospos_items WHERE custom6 <> '' AND '' <> (SELECT `value` FROM Elnokrashyospos_app_config WHERE `key` = 'custom6_name');
INSERT IGNORE INTO Elnokrashyospos_attribute_values (attribute_value) SELECT DISTINCT custom7 FROM Elnokrashyospos_items WHERE custom7 <> '' AND '' <> (SELECT `value` FROM Elnokrashyospos_app_config WHERE `key` = 'custom7_name');
INSERT IGNORE INTO Elnokrashyospos_attribute_values (attribute_value) SELECT DISTINCT custom8 FROM Elnokrashyospos_items WHERE custom8 <> '' AND '' <> (SELECT `value` FROM Elnokrashyospos_app_config WHERE `key` = 'custom8_name');
INSERT IGNORE INTO Elnokrashyospos_attribute_values (attribute_value) SELECT DISTINCT custom9 FROM Elnokrashyospos_items WHERE custom9 <> '' AND '' <> (SELECT `value` FROM Elnokrashyospos_app_config WHERE `key` = 'custom9_name');
INSERT IGNORE INTO Elnokrashyospos_attribute_values (attribute_value) SELECT DISTINCT custom10 FROM Elnokrashyospos_items WHERE custom10 <> '' AND '' <> (SELECT `value` FROM Elnokrashyospos_app_config WHERE `key` = 'custom10_name');

UPDATE Elnokrashyospos_attribute_links
 INNER JOIN Elnokrashyospos_items ON Elnokrashyospos_attribute_links.item_id = Elnokrashyospos_items.item_id
 INNER JOIN Elnokrashyospos_attribute_values ON attribute_value = custom1
 SET Elnokrashyospos_attribute_links.attribute_id = Elnokrashyospos_attribute_values.attribute_id
 WHERE definition_id IN (SELECT definition_id FROM Elnokrashyospos_attribute_definitions
 WHERE definition_name = (SELECT `value` FROM Elnokrashyospos_app_config WHERE `key` = 'custom1_name' AND `value` IS NOT NULL));

UPDATE Elnokrashyospos_attribute_links
 INNER JOIN Elnokrashyospos_items ON Elnokrashyospos_attribute_links.item_id = Elnokrashyospos_items.item_id
 INNER JOIN Elnokrashyospos_attribute_values ON attribute_value = custom2
 SET Elnokrashyospos_attribute_links.attribute_id = Elnokrashyospos_attribute_values.attribute_id
 WHERE definition_id IN (SELECT definition_id FROM Elnokrashyospos_attribute_definitions
 WHERE definition_name = (SELECT `value` FROM Elnokrashyospos_app_config WHERE `key` = 'custom2_name' AND `value` IS NOT NULL));

UPDATE Elnokrashyospos_attribute_links
 INNER JOIN Elnokrashyospos_items ON Elnokrashyospos_attribute_links.item_id = Elnokrashyospos_items.item_id
 INNER JOIN Elnokrashyospos_attribute_values ON attribute_value = custom3
 SET Elnokrashyospos_attribute_links.attribute_id = Elnokrashyospos_attribute_values.attribute_id
 WHERE definition_id IN (SELECT definition_id FROM Elnokrashyospos_attribute_definitions
 WHERE definition_name = (SELECT `value` FROM Elnokrashyospos_app_config WHERE `key` = 'custom3_name' AND `value` IS NOT NULL));

UPDATE Elnokrashyospos_attribute_links
 INNER JOIN Elnokrashyospos_items ON Elnokrashyospos_attribute_links.item_id = Elnokrashyospos_items.item_id
 INNER JOIN Elnokrashyospos_attribute_values ON attribute_value = custom4
 SET Elnokrashyospos_attribute_links.attribute_id = Elnokrashyospos_attribute_values.attribute_id
 WHERE definition_id IN (SELECT definition_id FROM Elnokrashyospos_attribute_definitions
 WHERE definition_name = (SELECT `value` FROM Elnokrashyospos_app_config WHERE `key` = 'custom4_name' AND `value` IS NOT NULL));

UPDATE Elnokrashyospos_attribute_links
 INNER JOIN Elnokrashyospos_items ON Elnokrashyospos_attribute_links.item_id = Elnokrashyospos_items.item_id
 INNER JOIN Elnokrashyospos_attribute_values ON attribute_value = custom5
 SET Elnokrashyospos_attribute_links.attribute_id = Elnokrashyospos_attribute_values.attribute_id
 WHERE definition_id IN (SELECT definition_id FROM Elnokrashyospos_attribute_definitions
 WHERE definition_name = (SELECT `value` FROM Elnokrashyospos_app_config WHERE `key` = 'custom5_name' AND `value` IS NOT NULL));

UPDATE Elnokrashyospos_attribute_links
 INNER JOIN Elnokrashyospos_items ON Elnokrashyospos_attribute_links.item_id = Elnokrashyospos_items.item_id
 INNER JOIN Elnokrashyospos_attribute_values ON attribute_value = custom6
 SET Elnokrashyospos_attribute_links.attribute_id = Elnokrashyospos_attribute_values.attribute_id
 WHERE definition_id IN (SELECT definition_id FROM Elnokrashyospos_attribute_definitions
 WHERE definition_name = (SELECT `value` FROM Elnokrashyospos_app_config WHERE `key` = 'custom6_name' AND `value` IS NOT NULL));

UPDATE Elnokrashyospos_attribute_links
 INNER JOIN Elnokrashyospos_items ON Elnokrashyospos_attribute_links.item_id = Elnokrashyospos_items.item_id
 INNER JOIN Elnokrashyospos_attribute_values ON attribute_value = custom7
 SET Elnokrashyospos_attribute_links.attribute_id = Elnokrashyospos_attribute_values.attribute_id
 WHERE definition_id IN (SELECT definition_id FROM Elnokrashyospos_attribute_definitions
 WHERE definition_name = (SELECT `value` FROM Elnokrashyospos_app_config WHERE `key` = 'custom7_name' AND `value` IS NOT NULL));

UPDATE Elnokrashyospos_attribute_links
 INNER JOIN Elnokrashyospos_items ON Elnokrashyospos_attribute_links.item_id = Elnokrashyospos_items.item_id
 INNER JOIN Elnokrashyospos_attribute_values ON attribute_value = custom8
 SET Elnokrashyospos_attribute_links.attribute_id = Elnokrashyospos_attribute_values.attribute_id
 WHERE definition_id IN (SELECT definition_id FROM Elnokrashyospos_attribute_definitions
 WHERE definition_name = (SELECT `value` FROM Elnokrashyospos_app_config WHERE `key` = 'custom8_name' AND `value` IS NOT NULL));

UPDATE Elnokrashyospos_attribute_links
 INNER JOIN Elnokrashyospos_items ON Elnokrashyospos_attribute_links.item_id = Elnokrashyospos_items.item_id
 INNER JOIN Elnokrashyospos_attribute_values ON attribute_value = custom9
 SET Elnokrashyospos_attribute_links.attribute_id = Elnokrashyospos_attribute_values.attribute_id
 WHERE definition_id IN (SELECT definition_id FROM Elnokrashyospos_attribute_definitions
 WHERE definition_name = (SELECT `value` FROM Elnokrashyospos_app_config WHERE `key` = 'custom9_name' AND `value` IS NOT NULL));

UPDATE Elnokrashyospos_attribute_links
 INNER JOIN Elnokrashyospos_items ON Elnokrashyospos_attribute_links.item_id = Elnokrashyospos_items.item_id
 INNER JOIN Elnokrashyospos_attribute_values ON attribute_value = custom10
 SET Elnokrashyospos_attribute_links.attribute_id = Elnokrashyospos_attribute_values.attribute_id
 WHERE definition_id IN (SELECT definition_id FROM Elnokrashyospos_attribute_definitions
 WHERE definition_name = (SELECT `value` FROM Elnokrashyospos_app_config WHERE `key` = 'custom10_name' AND `value` IS NOT NULL));

ALTER TABLE `Elnokrashyospos_items`
 DROP COLUMN `custom1`,
 DROP COLUMN `custom2`,
 DROP COLUMN `custom3`,
 DROP COLUMN `custom4`,
 DROP COLUMN `custom5`,
 DROP COLUMN `custom6`,
 DROP COLUMN `custom7`,
 DROP COLUMN `custom8`,
 DROP COLUMN `custom9`,
 DROP COLUMN `custom10`;
 
 DELETE FROM `Elnokrashyospos_app_config` WHERE `key` IN ('custom1_name','custom2_name','custom3_name','custom4_name','custom5_name','custom6_name','custom7_name','custom8_name','custom9_name','custom10_name');
