require 'i18n'
I18n.default_locale = :pl

RailsAdmin.config do |config|
  if Rails.env.production?
    config.authorize_with do
      authenticate_or_request_with_http_basic('Login required') do |username, password|
        username == ENV['ADMIN_USER'] && password == ENV['ADMIN_PASSWORD']
      end
    end
  end

  config.actions do
    excluded_models = ['User']

    dashboard                     # mandatory
    index                         # mandatory
    new do
      except excluded_models
    end
    export
    bulk_delete do
      except excluded_models
    end
    show
    edit do
      except excluded_models
    end
    delete do
      except excluded_models
    end
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end
