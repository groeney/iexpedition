source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem "rails", github: "rails/rails"
gem "rails", "~> 5.0.1"
gem "pg"
# Use Puma as the app server
gem "puma", "~> 3.0"
# Use SCSS for stylesheets
gem "sass-rails", "~> 5.0"
# Use Uglifier as compressor for JavaScript assets
gem "uglifier", ">= 1.3.0"
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem "therubyracer", platforms: :ruby
gem "execjs"
# Use jquery as the JavaScript library
gem "jquery-rails"
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem "turbolinks", "~> 5"
# A Rails 5 dependency for Active Admin
gem "inherited_resources", git: "https://github.com/activeadmin/inherited_resources"
# Active Admin
gem "activeadmin", git: "https://github.com/activeadmin/activeadmin"
gem "devise"

#allow seeding data in staging and dev
group :development, :test, :staging do
  gem "faker"
  gem "factory_girl_rails"
end

group :development, :test do
  # Call "byebug" anywhere in the code to stop execution and get a debugger console
  gem "byebug", platform: :mri
  gem "dotenv-rails"
  gem "pry-rails"
  gem "pry"
  gem "rspec-rails", "~> 3.5"
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem "web-console", ">= 3.3.0"
  gem "listen", "~> 3.0.5"
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end
