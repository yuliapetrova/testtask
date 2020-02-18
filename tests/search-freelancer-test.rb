require 'selenium-webdriver'
require 'yaml'
require_relative '../pageobjects/search-page'
require_relative '../pageobjects/profile-page'
require_relative '../utils/browser-helper'

# Load config file
$config = YAML.load_file('config.yml')

# Read search keyword from config file "config.yml"
@keyword = $config['keyword']

puts "Preparation step:"
@browser = Browser.new($config['browser'])
@driver = @browser.driver

puts "Step 1. Go to www.upwork.com and verify navigation"
search_page = SearchPage.new(@driver)
search_page.verify_page_navigation

puts "Step 2. Focus onto 'Find freelancers'"
@driver.action.move_to(search_page.search_input).perform

puts "Step 3. Enter keyword '#{@keyword}' into the search input right from the dropdown"
search_page.search_input.send_keys(@keyword)

puts "Step 4. Click on the magnifying glass button to submit search request"
search_page.magnifying_glass_button.click

puts "Step 5. Verify search results are displayed"
search_page.verify_results_section

puts "Step 6. Verify search results:"
puts "Verify that at least one attribute contains search keyword:"
search_page.verify_all_attributes(@keyword)
puts "Verify that each attribute contains search keyword:"
search_page.verify_each_attribute(@keyword)

puts "Step 7. Click on random freelancer's title"
random = search_page.freelancers.sample
search_page.freelancer_click(random)

puts "Step 8. Verify navigation to freelancer's profile"
profile_page = ProfilePage.new(@driver)
profile_page.verify_page_navigation

puts "Step 9. Verify that each attribute value is equal to one of those stored in the structure created in #67"
Verify.attributes_match(random, profile_page.freelancer_profile_attr)

puts "Step 10. Check whether at least one attribute contains keyword '#{@keyword}'"
profile_page.verify_all_attribute(@keyword)

@browser.teardown
