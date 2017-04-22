source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

ruby '2.4.0'

gem 'puma', '~> 3.0'
gem 'rails', '~> 5.0.2'

gem 'pg'
gem 'faker'
gem 'valid_url'

gem 'grape', '~> 0.19.1'
gem 'grape-entity', '~> 0.6.1'
gem 'grape-kaminari'
gem 'grape-swagger', '~> 0.27.0'
gem 'grape-swagger-entity'
gem 'grape-swagger-rails'
gem 'hashie-forbidden_attributes'
gem 'rails_admin', '~> 1.1.1'


#may be used
gem 'sass-rails', '~> 5.0'
gem 'coffee-rails', '~> 4.2'
gem 'jquery-rails'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'uglifier', '>= 1.3.0'

group :development, :test do
  gem 'factory_girl_rails'
  gem 'listen', '~> 3.0.5'
  gem 'pry'
  gem 'rspec-rails', github: 'rspec/rspec-rails'
end

group :test do
  gem 'codeclimate-test-reporter', '~> 1.0.0'
  gem 'shoulda', '~> 3.5'
  gem 'simplecov'
end
