class ProfilePage
  def initialize(driver)
    @driver = driver
  end

  def verify_page_navigation
    wait = Selenium::WebDriver::Wait.new(timeout: 10)
    wait.until do freelancer_name.displayed?
    end
  end

  def slider()
    @driver.find_element(id: 'visitor-profile-slider')
  end

  def freelancer_name()
    @driver.find_element(id: 'optimizely-header-container-default').find_element(xpath: '//span[contains(@itemprop,"name")]')
  end

  def freelancer_title()
    @driver.find_element(css: '.air-card .ng-binding')
  end
end