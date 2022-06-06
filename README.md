# Hatchways Work Simulation

## General Instructions

For this project, you are provided a starting code for a back end JSON API and are to build on this starting code by adding new features. The starting code is for the application described in the section below, and you can find your assigned work on the Issues tab of this repository. Please open a **single pull request** with all of the changes needed to implement the features described in the issue, then return to the Hatchways dashboard to mark your assessment as completed.

We will use [this rubric](https://drive.google.com/file/d/1Lfn6JnanBhuSjMDQaIdIBk1_QK7i9mNU/view) to evaluate your submission. Please note that if your submission does not attempt to complete all of the requirements, or does not pass our plagiarism screening, we will be unable to provide feedback on it. Please contact hello@hatchways.io if you have any questions or concerns.

---

## Introduction to this Application

You will be modifying an existing server that provides an API for a blogging website. The database for the API has a collection of blog `Posts`, which include information about each blog post such as the text and author of the post, how many times the post has been “liked”, etc. Additionally, the database contains `Users`. Each blog post can have multiple authors, which correspond to users in the database (this association is stored in the database as `UserPost`). A new blog post must have at least one author that is a user already registered in the database.

Currently, the starting code has the following API routes already implemented:

- POST `/api/register` - Register a new user
- POST `/api/login` - Login for an existing user
- POST `/api/posts` - Create a new post

Only a logged in `User` can use this blogging website API, with the exception of the login and register routes.

---

## System Requirements

This application runs on Ruby version 2.7.2

---

## Server

Environment variables can be found setted in [./config/app_environment_variable.rb](./config/app_environment_variable.rb)

### System dependencies

The API makes use of the following dependencies(gems):

- [rspec_rails](https://github.com/rspec/rspec-rails)
- [bcrypt](https://rubygems.org/gems/bcrypt/versions/3.1.12)
- [jwt](https://github.com/jwt/ruby-jwt)
- [rubocop](https://docs.rubocop.org/rubocop/index.html)
- [faker](https://github.com/faker-ruby/faker)
- [shoulda-matchers](https://matchers.shoulda.io/docs/v4.1.1/index.html)
- [dotenv](https://github.com/bkeepers/dotenv)

### Setup

Run the following command to install the dependencies of the project.

```
bundle install
```

### Database

There is no database setup required for this API because it uses the default Rails SQLite database in the development environment. However you need to run the following command to run the migrations.

- `rails db:migrate`

### Seed Data

We've included sample data that the application has been configured to use. If you want to re-seed the database, you can run `rake db:seed`. [seed.rb](./db/seed.rb) can be referenced to see what the sample data is. Viewing the database file itself is not required to complete your tasks, but if you would like to, an application like [DB Browser for SQLite](https://sqlitebrowser.org/) can be used.

### Reset your Database

- `rake db:reset` will drop the database and set it up again

### Unit Tests

Your repository contains a non-comprehensive set of unit tests used to determine if your pull request has met the basic requirements of the task given to you. These tests should NOT be modified unless specified in your GitHub issue.

To run these tests, use the following command:

- `rspec` or `bundle exec rspec`

### Run Local Server

To start the Rails server locally, run the following command in the terminal:

- `rails server` or `rails s`

## Testing

You can use cURL or a tool like [Postman](https://www.postman.com/) to test the API.

### Example Curl Commands

You can log in as one of the seeded users with the following curl command:

```bash
curl --location --request POST 'localhost:5000/api/login' \
--header 'Content-Type: application/json' \
--data-raw '{
    "username": "thomas",
    "password": "123456"
}'
```

Then you can use the token that comes back from the /login request to make an authenticated request to create a new blog post

```bash
curl --location --request POST 'localhost:5000/api/posts' \
--header 'x-access-token: your-token-here' \
--header 'Content-Type: application/json' \
--data-raw '{
    "text": "This is some text for the blog post...",
    "tags": ["travel", "hotel"]
}'
```
