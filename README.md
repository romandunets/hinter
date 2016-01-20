# Hinter
This project is web-based personal organizer tool on Rails 4. Basically, an application is enhanced version of task list with a few cool features to make it  useful in real life.

## Getting Started

To get you started you can simply clone the hinter repository, install gems, initialize database and run the application.

### Prerequisites

You need to must a git client to clone the repository. You can get it from [http://git-scm.com/](http://git-scm.com/).

Also you must to have Ruby 2.2 and Rails 4.0.0+ installed.

### Installation

1. Clone the hinter repository using git:

    ```
    git clone https://github.com/romandunets/hinter.git
    ```

1. Install gems
    ```
    bundle install
    ```

1. Initialize database
    ```
    rake db:create db:migrate db:seed
    ```

1. Run the application in localhost
    ```
    rails server
    ```

## Running tests

The application has rspec tests for models. You can run them using bundle:
```
bundle exec rspec
```
