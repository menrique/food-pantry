# README

**Virtual Food Pantry** is a software engineer project for **[One Degree](https://www.1degree.org/)**. When
this gets fully implemented, it will improve food pantries' operations so that families have access to healthy food 
from home.

## System Dependencies

### Ruby
The **Virtual Food Pantry** backend is a [Ruby on Rails API application](https://guides.rubyonrails.org/api_app.html), 
so we need to have [Ruby](https://www.ruby-lang.org/en/) installed. Let's check if we have Ruby by running the 
following command: 

```ruby -v ``` 

If Ruby responds with a version number, we can skip the next step.

#### Install Ruby

In case we have to install Ruby, we recommend using [RVM (Ruby Version Manager)](https://rvm.io). To install RVM, let's 
try this command:

```gpg --keyserver hkp://pool.sks-keyservers.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB```

```\curl -sSL https://get.rvm.io | bash -s stable --ruby```

In case there is any problem, we can follow the [RVM install guide](https://rvm.io/rvm/install).

### Postgres
**Virtual Food Pantry** uses [Postgres](https://www.postgresql.org/). Let's check if we have Postgres installed 
by running its version command: 

```postgres --version```

If we get an error, we can follow [these instructions](https://www.postgresql.org/download/) 
to continue with the installation. Mac OS users can install and run Posgres via [Homebrew](https://brew.sh/):

```
brew install postgresql
brew services start postgres
```

### Redis
Another key dependency is [Redis](https://redis.io/), which helps us to persist asynchronous jobs data and events. Please
follow the [download instructions](https://redis.io/download). Mac OS users can use Homebrew:

```bash
brew install redis
brew services run redis
```

## Running the Application

Let's then navigate to the project folder:

 ```cd path/to/food-pantry```

and install [bundler](https://bundler.io/)(the Ruby package manager):

```gem install bundler```

and then the required gems:

```bundle```

Lastly, we have to initialize the DB and migrate:

```bash
rake db:create
rake db:migrate
```

## Running the Tests
**Virtual Food Pantry** uses [RSpec](https://rspec.info/) to test backend behavior. Let's run the available
examples: 

```rspec```

## Deployment

Deployment is not yet part of this exercise, but we recommend deploying to [Heroku](https://www.heroku.com/) later on
following this guide [Heroku guide](https://devcenter.heroku.com/articles/getting-started-with-ruby#introduction).

