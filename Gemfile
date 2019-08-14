source "https://rubygems.org"

plugin 'bundler-inject', '~> 1.1'
require File.join(Bundler::Plugin.index.load_paths("bundler-inject")[0], "bundler-inject") rescue nil
$LOAD_PATH.push(File.expand_path("lib", __dir__))

gem "optimist"
gem "rake"
gem "bundler", "~> 2.0"
gem "manageiq-loggers", "~> 0.3.0"
gem "manageiq-messaging", "~> 0.1.2"
gem "sources-api-client", :git => "https://github.com/ManageIQ/sources-api-client-ruby", :branch => "master"

group :test do
  gem "rspec"
  gem "simplecov"
  gem "webmock"
end
