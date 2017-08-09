# Jungle

A mini e-commerce application built with Rails 4.2 for purposes of teaching Rails by example.


## Contributions

** App deployed on Heroku Visit: https://fast-river-43563.herokuapp.com/ **

# Nav-bar
* Added login and register controllers that authenticate users and upon registration digests password via bcrypt hash.
 -Any error messages during this process will be displayed above forms.
 -once user logs in, their first name appears on the nav bar and the login/register buttons are replaced with a logout.
* if you click on the cart while empty you will be shown an error message and a link to continue shopping.

# Admin panel
* Added http basic authentication for the dropdown options.
* Added a categories controller which allows admin to add a new category to the database.

# root '/'
* When an items inventory reaches 0, a 'SOLD OUT!' banner will be added to the product

# /product/:id
* If user is logged in a comment box will be displayed to allow users to review a product.
  -Users can also delete any review they created.
* A list of reviews will be displayed under the product photo.

# /order/:id
* A list of all items purchased will be displayed with the total charge.

**Product and User model was tested with Rspec.

**please see commit history for more changes**


## Setup

1. Fork & Clone
2. Run `bundle install` to install dependencies
3. Create `config/database.yml` by copying `config/database.example.yml`
4. Create `config/secrets.yml` by copying `config/secrets.example.yml`
5. Run `bin/rake db:reset` to create, load and seed db
6. Create .env file based on .env.example
7. Sign up for a Stripe account
8. Put Stripe (test) keys into appropriate .env vars
9. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe

