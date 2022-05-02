# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version `3.0.1`

* System dependencies
 
  * jobs: ```gem delayed_job_active_record```
  * cache: ```gem redis```
  * search: ```gem searchkick```


* Configuration

```
create file in
config/aplication/application.yml
GITHUB_TOKEN=ghp_C2222223ffdfffasdsd
you can generate yours on github.com
```

* Database creation
```
rake db:create
```

* Database initialization
```
rake db:migrate
```
* How to run the test suite
```
rspec
```
* Services (job queues, cache servers, search engines, etc.)
```
docker-compose up
bundle exec rake jobs:work
```
* Deployment instructions
   * In the backend folder
we run docker to have the services of Redis, Postgresql, ElasticSearch
```

- docker-compose up
- rake db:create
- rake db:migrate
- bundle exec rake jobs:work
- rs -b 0.0.0.0 -p <port>
  example: rs -b 0.0.0.0 -p 30083

```
