Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/administration', as: 'rails_admin'
  mount API::Base => '/api'
  mount GrapeSwaggerRails::Engine, at: '/api/doc'
  mount ActionCable.server, at: '/cable'
end
