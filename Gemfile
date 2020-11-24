source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end


gem 'spree', github: 'spree/spree', branch: 'master'
gem 'rails-controller-testing'
gem 'webpacker', '~> 4.0'
gem 'staccato', '~> 0.5'

group :development do
  gem 'byebug'
end

gemspec
