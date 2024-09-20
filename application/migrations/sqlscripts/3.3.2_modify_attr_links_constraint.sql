ALTER TABLE `Elnokrashyospos_attribute_links`
DROP FOREIGN KEY `Elnokrashyospos_attribute_links_ibfk_4`;

ALTER TABLE `Elnokrashyospos_attribute_links`
ADD CONSTRAINT `Elnokrashyospos_attribute_links_ibfk_4`
FOREIGN KEY (`receiving_id`) REFERENCES `Elnokrashyospos_receivings`(`receiving_id`)
ON DELETE CASCADE
ON UPDATE RESTRICT;