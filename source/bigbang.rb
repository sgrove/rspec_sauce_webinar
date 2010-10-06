require 'rubygems'
require 'json'
require 'selenium/client'
require 'selenium/rspec/spec_helper'
require 'net/http'
require 'yaml'

browsers = JSON.parse(Net::HTTP.get('saucelabs.com', '/rest/v1/info/browsers'))
a
ondemand = YAML.load_file("ondemand.yml")

browsers.each do |browser|
  puts "Creating test for #{browser['long_name']} (#{browser['selenium_name']}) #{browser['long_version']} on #{browser['os']} now"

  describe "NYTimes Homepage Test" do
    attr_reader :browser

    before(:all) do
      @browser = Selenium::Client::Driver.new \
      :host => "saucelabs.com",
      :port => 4444,
      :browser => 
        {
        "username" => ondemand[:username],
        "access-key" => ondemand[:api_key],
        "os" => browser['os'],
        "browser" => browser['selenium_name'],
        "browser-version" => browser['long_version'],
        "job-name" => 
        "Sauce Labs RSpec Example - #{browser['long_name']} #{browser['long_version']} on #{browser['os']}"
      }.to_json,           
      :url => "http://www.saucelabs.com",
      :timeout_in_second => 90
    end

    before(:each) do
      puts "Testing on #{browser['long_name']} (#{browser['selenium_name']}) #{browser['long_version']} on #{browser['os']} now"
      selenium_driver.start_new_browser_session
    end

    # The system capture need to happen BEFORE closing the Selenium session
    append_after(:each) do
      Selenium::RSpec::SeleniumTestReportFormatter.capture_system_state(@selenium_driver, self)
      @selenium_driver.close_current_browser_session
    end

    it "can find Selenium" do
      @browser.open "/"
      @browser.title.should eql("Sauce Labs - Selenium-based Downloads, Hosting and Support")
    end
  end
end
