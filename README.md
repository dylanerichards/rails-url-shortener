# Rails URL Shortener

A simple API for shortening URLs.

## Running the application
1. Clone the repository
2. `cd` into it and run the migrations (`bundle exec rake db:migrate`)
3. Install the dependencies by running `bundle`
4. Start the Rails server by running `rails server` in the project root
5. Run the test suite by typing `rspec`


## Endpoints

`POST /shorten`: This route can be passed a `long_url` and `slug` parameter. The endpoint returns a JSON object containing the long url and its shortened alternative. The shortened url, by default, is a base36 representation of the Url object's id in the database. If a unique slug is passed, then it will be used as the shortened link instead.

`GET /:short_path`: This route simply performs the redirects. Using the `short_path` parameter in the URL, we find the corresponding URL record in the database, and redirect to its `long_url`.
