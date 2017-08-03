Rails.configuration.stripe = {
  :publishable_key => ENV['STRIPE_PUBLISHABLE_KEY'],
  :secret_key      => ENV['STRIPE_SECRET_KEY'],
  :dev_email       => ENV['DEV_EMAIL']
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]
