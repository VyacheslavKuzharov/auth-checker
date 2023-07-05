# Description
A simple project to discover roda web framework. Just for fun.

# Dependencies
- Postgresql
- Docker

# Development
* Clone the App repo:

```
git@github.com:VyacheslavKuzharov/auth-checker.git
```

Install dependencies:
```
bundle install
```

To run web server use command:
```
 bundle exec puma -C config/puma.rb
```

To run postgres use command:
```
 docker-compose up db
```

To run rubocop use command:
```
 standardrb
```
