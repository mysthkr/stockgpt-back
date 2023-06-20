# Be sure to restart your server when you modify this file.

# Avoid CORS issues when API is called from the frontend app.
# Handle Cross-Origin Resource Sharing (CORS) in order to accept cross-origin AJAX requests.

# Read more: https://github.com/cyu/rack-cors

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'http://localhost:3000', "https://web.stock-gpt-m.com", "http://stock-gpt-m.com", 'http://stock-gpt_front_1:3000','http://172.22.0.3:3000','http://ec2-user-front-1:3000','http://52.195.64.253:3000'

    resource '*',
      headers: :any,
      expose: ['access-token', 'uid','client', 'expiry'],
      methods: [:get, :post, :put, :patch, :delete, :options, :head],
      credentials: true
  end
end
