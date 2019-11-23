# runaway-stars-proto2

## Installation

* Clone repo `git clone git@github.com:akanner/runaway-stars-proto2.git`
* You will need PHP 7
  * `sudo add-apt-repository ppa:ondrej/php`
  * `sudo apt-get update`
  * `sudo apt-get install php7.0-xml`
  * `sudo apt-get install php7.0-mysql`
        
* Create the database using the script 'dumps/fresh_runaway_multicolour_gifs_proto_dump.sql'
* cd runaway-stars-proto2
* composer install

## Running the page

* Dump the images using `php bin/console assetic:dump`
* Use the built-in server by running `php bin/console server:start`

