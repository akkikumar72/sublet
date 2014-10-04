## Sublet is an application for getting tenants for your spaces, No signup simply get started :).

### Technology Stack:-
* Rails 4.1.5
* Ruby > 1.9.3
* Imagemagic for image manipulation.
* database postgresql

### Project Setup:-

* Clone git repository:-
```shell
git clone git@github.com:mohitjain/sublet.git
```

* Install dependencies (ensure bundler is installed)
```
cd sublet
bundle install
```

* Copy database file:-
```shell
cp config/database_sample.yml cp config/database.yml
```

* Setup DB
```
rake db:create
rake db:migrate
rake db:seed
```

* Application is using [delayed job](https://github.com/collectiveidea/delayed_job) for jobs processing:-
```
RAILS_ENV=development bin/delayed_job start
```

* Application is integrated with [Active Admin](http://activeadmin.info) gem to check that out go to
`http://localhost:3000/admin`.



### To Do:-
* Ask for sendgrid account from the application owner as of now our developer credentials.
* Setup PG on server to complete deployment.
* Add Airbrake gem for errors.

