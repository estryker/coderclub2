# README

## Installation

### Bare Metal Ubuntu Linux

1. Install Postgress and configure 
```
sudo apt install libpq-dev
```
1. Make sure you are using the latest version of Ruby. As of this writing, 4.0.5.  
1. Update your version of Bundler

```
bundle update --bundler
```
1. install postgress
```
 sudo apt install postgresql postgresql-contrib
 ```

1. create the database user in postgress
```

```
1. Setup the database:

 To initialize a database in Ruby on Rails, the standard commands are 
 ``` bin/rails db:create```, ```bin/rails db:migrate```, and ```bin/rails db:seed```. You can also use "all-in-one" commands like ```bin/rails db:setup ``` or ```bin/rails db:prepare``` depending on your specific needs.Primary Initialization CommandsFor a fresh project, these steps are typically run in sequence:bin/rails db:create: Creates the database based on your config/database.yml settings.bin/rails db:migrate: Executes all pending migration files in the db/migrate directory to build your database tables and columns.bin/rails db:seed: Populates the database with initial or sample data defined in the db/seeds.rb file.


### TODO
* Containerize
* Docker Compose installation
* Kubernetes object creation and Helm Chart 
 ...
# coderclub2
