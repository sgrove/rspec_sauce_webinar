require 'rubygems'
require 'selenium/client'
require 'json'

browser = Selenium::Client::Driver.new(:host => "localhost",
                                       :port => 4444,
                                       :browser => "*firefox", 
                                       :url => "http://www.saucelabs.com",
                                       :timeout_in_second => 60)

browser.start_new_browser_session

def get_all_links(browser, attr)
    links = browser.js_eval("
        var s = '', i = 0;
        for(i = 0; i < window.document.getElementsByTagName('a').length; i++) {
            s = s + ',' + window.document.getElementsByTagName('a')[i].#{attr};
        }
        s;")

  return links.split(",")
end



browser.open "/"
puts "Press enter to output all links on the page"
pause = gets

get_all_links(browser, "href").each do |link|
    puts link
end

puts "Press enter to close current selenium session"
pause = gets

browser.close_current_browser_session
