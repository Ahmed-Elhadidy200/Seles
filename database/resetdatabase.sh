#!/bin/bash
read -s -p "Enter Password: " mypassword
mysql -u root -p"$mypassword" -e "DROP DATABASE IF EXISTS Elnokrashyospos; CREATE DATABASE Elnokrashyospos;"
[ ! -z $1 ] && script=migrate_phppos || script=database
mysql -u root -p"$mypassword" -e "USE Elnokrashyospos; source $script.sql;"
