#!/bin/sh

mysqldump -uroot -proot -h 127.0.0.1 -B --events --routines --triggers garden_service > seed.sql
