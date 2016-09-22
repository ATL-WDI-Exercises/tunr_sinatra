#!/bin/bash
dropdb tunr_sinatra
createdb tunr_sinatra
psql -d tunr_sinatra < schema.sql
ruby seeds.rb

