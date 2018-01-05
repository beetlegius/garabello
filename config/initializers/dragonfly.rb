require 'dragonfly'

# Configure
Dragonfly.app.configure do
  plugin :imagemagick

  secret "b7939fe083b72c6904e825dd35758dc348e398973f74790b28ce3d63122316e7"

  url_format "/media/:job/:name"

  datastore :file,
    root_path: Rails.root.join('public/dragonfly', Rails.env),
    server_root: Rails.root.join('public')
end

# Logger
Dragonfly.logger = Rails.logger

# Mount as middleware
Rails.application.middleware.use Dragonfly::Middleware

# Add model functionality
if defined?(ActiveRecord::Base)
  ActiveRecord::Base.extend Dragonfly::Model
  ActiveRecord::Base.extend Dragonfly::Model::Validations
end
