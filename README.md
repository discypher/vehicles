# README

### Ruby Version

Built with Ruby 2.4.1

### Setup

clone the application. Then run:
```bundle install```

### Run Tests

```bundle exec rspec spec```

### Run Application

```bundle exec rails server```

### View Documentation

```
bundle exec rails server
```
Then point your browser to http://127.0.0.1:3000/docs


### Notes:

Currently there are some issues with Rails 5 and the swagger-docs gem.
Because of this, I have manually updated the nested routes that are
not automatically generated due to these issues. Switching to a different
documentation tool, or a Swagger documentation gem that has better support
is the long term solution.


There is a lot of functionality missing from this application currently. It
is a work in progress.
