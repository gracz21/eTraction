require 'i18n'
I18n.default_locale = :pl

RailsAdmin.config do |config|

  ### Popular gems integration

  ## == Devise ==
  # config.authenticate_with do
  #   warden.authenticate! scope: :user
  # end
  # config.current_user_method(&:current_user)

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar true

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
