source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

# MAIN
gem 'rails'
gem 'puma'
gem 'foreman'
#gem 'unicode'
gem 'jbuilder', '~> 2.5'
gem 'sprockets', '>=3.0.0.beta'
gem 'sprockets-es6'
gem 'uglifier', '>= 1.3.0'
gem 'json-minify'
# GENERATORS
gem 'digest-crc'
# PREPROCESSORS
gem 'haml'
gem 'sass-rails'
gem 'coffee-rails'
# DATABASE
gem 'redis'
gem 'ohm'
gem 'ohm-contrib'
# JS ENGINE
gem 'therubyracer', platforms: :ruby
# JS LIBS
gem 'turbolinks', '~> 5'
gem 'jquery-rails'
gem 'jquery-turbolinks'
# ASSETS
gem 'material_icons'
gem 'jquery-slick-rails'
gem 'photoswipe-rails'
gem 'tinymce-rails'
gem 'tinymce-rails-langs'
# MISC
gem 'fastimage'

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end
