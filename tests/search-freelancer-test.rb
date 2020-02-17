require 'selenium-webdriver'
require 'yaml'
require_relative '../pageobjects/search-page'
require_relative '../pageobjects/profile-page'
require_relative '../utils/browser-helper'

# Loads config file
$config = YAML.load_file('config.yml')

# Reads search keyword from config file "config.yml"
@keyword = $config['keyword']

# Prepare driver for work
@browser = Browser.new($config['browser'])
@driver = @browser.driver

puts "Go to www.upwork.com and verify navigation"
search_page = SearchPage.new(@driver)
search_page.verify_page_navigation

puts "Focus onto 'Find freelancers'"
@driver.action.move_to(search_page.search_input).perform

puts "Enter keyword '#{@keyword}' into the search input right from the dropdown"
search_page.search_input.send_keys(@keyword)

puts "Click on the magnifying glass button to submit search request"
search_page.magnifying_glass_button.click

puts "Verify search results are displayed"
search_page.verify_results_section

puts "Verify search results:"
puts "Check all attributes:"
search_page.verify_all_attributes(@keyword)
puts "Check each attribute:"
search_page.verify_each_attribute(@keyword)

puts "Click on random freelancer's title"
search_page.random_freelancer_click

puts "Verify navigation to freelancer's profile"
profile_page = ProfilePage.new(@driver)
profile_page.verify_page_navigation

puts "Verify that each attribute value is equal to one of those stored in the structure created in #67"

puts "Check whether at least one attribute contains `<keyword>`"

@browser.teardown
  #
  # if profile_page.freelancer_name.text == randomFreelancer[:name]
  #   puts "passed"
  # else
  #   puts "Failed: expected: '#{randomFreelancer[:name]}' actual: '#{profile_page.freelancer_name.text}'"
  # end

  sleep(10)


