#!/usr/bin/env ruby

require 'capybara'
require 'pry'

@session = Capybara::Session.new(:selenium_chrome)
@session.visit('https://www.ctownsupermarkets.com/weekly-circular?store_code=U41_154&store_zip=10026&store_city=New%20York&store_state=NY')

sleep 5 # wait for slow async calls to resolve

binding.pry
