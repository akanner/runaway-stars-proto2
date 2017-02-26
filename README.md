# runaway-stars-proto2

##Installation

* clone repo `git clone git@github.com:akanner/runaway-stars-proto2.git`
* Create a database (example `mysql>create database raway_db;`)
* cd runaway-stars-proto2
* composer install

##run the page

* Create the database using the script 'fresh_runaway_proto_dump.sql'
* Dump the images using `php app/console assetic:dump`
* Use the built-in server by running `php app/console server:start`

