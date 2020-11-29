require 'bundler/setup'
Bundler.require(:default) 
require 'uri'
require 'net/http'
require 'openssl'
require 'json'
require 'tty-cursor'
require 'colorize'

require_relative '../lib/city'
require_relative '../lib/interact-with-api'
require_relative '../lib//hotel'
require_relative '../lib/cli'


