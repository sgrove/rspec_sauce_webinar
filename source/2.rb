require "rubygems"
require "selenium/client"
require 'json'

browser = Selenium::Client::Driver.new(:host => "localhost",
                                       :port => 4444,
                                       :browser => "*firefox", 
                                       :url => "http://www.saucelabs.com",
                                       :timeout_in_second => 60)

browser.start_new_browser_session

# http://www.saucelabs.com/"
browser.open "/"

puts "Press enter to close current selenium session"
pause = gets

browser.close_current_browser_session
