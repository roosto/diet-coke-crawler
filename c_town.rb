#!/usr/bin/env ruby

require 'capybara'
require 'pry'

PRODUCT_KEY_WORDS = 'pepsi'.freeze

@session = Capybara::Session.new(:selenium_chrome)
@session.visit('https://www.ctownsupermarkets.com/weekly-circular?store_code=U41_154&store_zip=10026&store_city=New%20York&store_state=NY')

sleep 7 # wait for slow async calls to resolve

flyer_iframe = @session.find('iframe[title="main panel" i]')
@session.within_frame(flyer_iframe) do
  @session.find_all("button[aria-label*='#{PRODUCT_KEY_WORDS}' i]", visible: :all).each_with_index do |elem, index|
    @session.scroll_to elem
    elem.click
    sleep 3
    @session.save_screenshot "c_town/test-#{index}.png"
  end
end
