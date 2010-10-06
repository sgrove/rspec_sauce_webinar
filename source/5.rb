require 'rubygems'
require "selenium/client"
require "selenium/rspec/spec_helper"
require "json"

describe "Sauce Labs Homepage Test" do
  attr_reader :selenium_driver
  alias :page :selenium_driver

  # Note that this test class will fail because it's pointing at nytimes.com
  # I left it in here because I think it's a cool demo. Try pointing it at your own website!
  before(:each) do
    @selenium_driver = Selenium::Client::Driver.new \
    :host => "saucelabs.com",
    :port => 4444,
    :browser => 
      {
      "username" => "sgrove",
      "access-key" => "97c2c985-9064-41ce-bcf4-dbb268bd586b",
      "os" => "Windows 2003",
      "browser" => "iexplore",
      "browser-version" => "7",
      "job-name" => "Sauce Labs RSpec Example - NYTimes Internet Explorer in the cloud #{Time.now}"
    }.to_json,           
    :url => "http://www.nytimes.com",
    :timeout_in_second => 90
    @selenium_driver.start_new_browser_session
  end

  # The system capture need to happen BEFORE closing the Selenium session
  append_after(:each) do
    @selenium_driver.close_current_browser_session
  end

  it "should have a sane title" do
    page.open "/"
    page.title.should eql("Cross browser testing with Selenium - Sauce Labs")
  end

  it "should contain the word 'selenium'" do
    page.open "/"
    page.get_html_source.should match /selenium/
  end

  it "should contain the word 'Sauce Labs'" do
    page.open "/"
    page.get_html_source.should match /Sauce Labs/
  end
end
