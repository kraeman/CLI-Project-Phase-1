require 'bundler/setup'
require 'uri'
require 'net/http'
require 'openssl'
require 'json'
require 'colorize'
require 'pry'
require 'dotenv/load'


require_relative '../hotels_by_city'
require_relative '../lib/city'
require_relative '../lib/getter'
require_relative '../lib/hotel'
require_relative '../lib/cli'


