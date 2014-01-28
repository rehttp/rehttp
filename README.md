# ReHTTP

ReHTTP is a project to help developers debug, collaborate and share HTTP
requests. This tool is designed to take all the features missing from existing
tools and bring them into a single application.

### Alternatives

- [RequestBin](http://requestb.in/)
- [hurl.it](http://hurl.it)
- [Blueprint](http://apiblueprint.org/)

### Minimum requirements

- Ruby 2.1.0
- PostgreSQL

### Setup

```bash
$ script/bootstrap
```

This will check everything is where it should be and that you have all the
required dependencies available. 

### Running the application

ReHTTP is running on unicorn and follows the 
[unix process model](https://devcenter.heroku.com/articles/process-model). This
allows gives the ability of determining what process types get what resources
within the application and also allows for quick scalability should it be needed.

To start the web server, run `script/server`.

### Running tests

The testing tool of choice is [RSpec](http://rspec.info/) and the test suite can 
be executed by running `script/test`.
