require_relative '../utils/verification-helper'

class SearchPage
  @@URL = "https://www.upwork.com"

  def initialize(driver)
    @driver = driver
    driver.navigate.to @@URL
  end

  def verify_page_navigation
    wait = Selenium::WebDriver::Wait.new(timeout: 10)
    wait.until do @driver.title.include? 'Upwork'
    end
  end

  def search_input
    @driver.find_element(css: '.navbar-fixed-subnav .navbar-form .form-control')
  end

  def magnifying_glass_button
    @driver.find_element(css: '.navbar-fixed-subnav .navbar-form .input-group-btn .p-0-left-right')
  end

  def search_results_section
    @driver.find_element(id: 'oContractorResults')
  end

  def verify_results_section
    wait = Selenium::WebDriver::Wait.new(timeout: 10)
    wait.until do search_results_section.displayed?
    end
  end

  def random_freelancer_click
    @driver.find_element(xpath: "//span[contains(text(),'#{freelancers.sample[:name]}')]").click
  end

  def freelancers
    items = []
    @driver.find_elements(css: '.air-card-hover').each do |item|
      items.push( {
                      :name => item.find_element(css: '.freelancer-tile-name').attribute("title"),
                      :title =>  item.find_element(css: '.freelancer-tile-title').text,
                      :description => item.find_element(css: '.freelancer-tile-description').text,
                      :skills => item.find_elements(css: ".skills-section .ng-binding").compact.map { |x| x.text}.join(", ")
                  })
    end
    items
  end

  def verify_all_attributes(keyword)
    freelancers.each do |item|
      Verify.at_least_one_attribute_contains_keyword(item, keyword)
    end
  end

  def verify_each_attribute(keyword)
    freelancers.each do |item|
      Verify.each_attribute_contains_keyword(item, keyword)
    end
  end
end