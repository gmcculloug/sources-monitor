source "https://rubygems.org"

plugin 'bundler-inject', '~> 1.1'
require File.join(Bundler::Plugin.index.load_paths("bundler-inject")[0], "bundler-inject") rescue nil

lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "sources/availability/checker/version"

gem "optimist"
gem "manageiq-loggers", "~> 0.3.0"
gem "manageiq-messaging", "~> 0.1.2"
gem "sources-api-client", :git => "https://github.com/ManageIQ/sources-api-client-ruby", :branch => "master"

group :development, :test do
  gem "bundler", "~> 2.0"
  gem "rake", "~> 10.0"
  gem "rspec", "~> 3.0"
end
