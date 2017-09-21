source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

# MAIN
gem 'foreman'
gem 'puma'
gem 'rails'
# gem 'unicode'
# gem 'jbuilder', '~> 2.5'
gem 'json-minify'
gem 'sprockets', '>=3.0.0.beta'
gem 'sprockets-es6'
gem 'uglifier', '>= 1.3.0'
# GENERATORS
gem 'digest-crc'
# PREPROCESSORS
gem 'coffee-rails'
gem 'haml'
gem 'sass-rails'
# DB
gem 'ohm'
gem 'ohm-contrib'
gem 'redis'
# JS ENGINE
gem 'therubyracer', platforms: :ruby
# JS LIBS
gem 'jquery-rails'
gem 'jquery-turbolinks'
gem 'turbolinks', '~> 5'
# ASSETS
gem 'jquery-slick-rails'
gem 'material_icons'
gem 'photoswipe-rails', "git":"https://github.com/katedutch/photoswipe-rails.git", "branch":"patch-1"
gem 'tinymce-rails'
gem 'tinymce-rails-langs'
# MISC
gem 'fastimage'

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end
