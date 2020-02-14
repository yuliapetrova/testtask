require 'selenium-webdriver'
require_relative '../pageobjects/search-freelancer'

def setup
  @driver = Selenium::WebDriver.for :firefox
  @driver.manage.delete_all_cookies
  @driver.manage.window.maximize
end

def teardown
  @driver.quit
end

setup
search_page = SearchPage.new(@driver)
@driver.action.move_to(search_page.search_input).perform
search_page.search_input.send_keys("test")
teardown
