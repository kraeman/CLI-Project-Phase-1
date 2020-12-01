require 'bundler/setup'
Bundler.require(:default, :development)
require 'uri'
require 'net/http'
require 'openssl'
require 'json'
require 'colorize'
require 'pry'
require 'dotenv/load'
require 'rspec'



require_relative '../lib/city'
require_relative '../lib/interact_with_api'
require_relative '../lib//hotel'
require_relative '../lib/cli'
require_relative '../spec/hotels_spec'


