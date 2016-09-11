if Rails.env.production?
  Rails.configuration.stripe = {
    :publishable_key => ENV['STRIPE_PUBLISHABLE_KEY'],
    :secret_key => ENV['STRIPE_SECRET_KEY']
  }
else
  Rails.configuration.stripe = {
    :publishable_key => 'pk_test_DTTNCqIsmnonPB2mmH4mISsu',
    :secret_key => 'sk_test_fbiQqh0c2bHodPj6ojxa5g4J'
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]
