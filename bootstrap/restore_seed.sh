#!/bin/sh

mysql -uroot -proot -h 127.0.0.1 --database="garden_service" < "./seed.sql"
