# Hinter
This project is web-based personal organizer tool on Rails 4.

## Getting Started

To get you started you can simply clone the hinter repository, install gems, initialize database and run the application.

### Prerequisites

You need to must a git client to clone the repository. You can get it from [http://git-scm.com/](http://git-scm.com/).

Also you must to have Ruby 2.2 and Rails 4.0.0+ installed.

### Clone hinter

Clone the hinter repository using git:

```
git clone https://github.com/romandunets/hinter.git
```

### Install gems
```
bundle install
```

### Initialize database
```
rake db:create db:migrate db:seed
```

### Run the application in localhost
```
rails server
```
## Running tests

The application has rspec tests for models. You can run them using bundle:
```
bundle exec rspec
```
