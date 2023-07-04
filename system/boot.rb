require "rubygems"
require "bundler/setup"
require "roda"
require "dotenv/load"
require "sequel"
require_relative "../config/db"

# Require the default gems, plus the gems in a group named the same as the current Rack environment
Bundler.require(:default, ENV["RACK_ENV"])
