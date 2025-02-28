require "capybara"
require 'capybara/dsl'
require "selenium/webdriver"

Capybara.register_driver :chrome_headless do |app|
  selenium_options = Selenium::WebDriver::Chrome::Options.new
  selenium_options.add_argument("--window-size=1920,1080")
  selenium_options.add_argument("--no-sandbox")
  selenium_options.add_argument("--headless=new")
  selenium_options.add_argument("--disable-gpu")
  selenium_options.add_argument("--disable-search-engine-choice-screen")
  selenium_options.add_option("goog:loggingPrefs", browser: "ALL")

  Capybara::Selenium::Driver.new(app, browser: :chrome, options: selenium_options)
end
Capybara.run_server = false
Capybara.default_driver = :chrome_headless

class Example
  include Capybara::DSL
  
  def run(url)
    visit(url)
    puts "Visited #{page.current_url}"
  end
end

example = Example.new
example.run('https://status.heroku.com/')
