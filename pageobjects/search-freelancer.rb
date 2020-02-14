class SearchPage
  URL = "https://www.upwork.com"

  def initialize(driver)
    @driver = driver
    driver.navigate.to URL
    # implicit wait
    driver.manage.timeouts.implicit_wait = 30
  end

  def search_button()
    @driver.find_element(class: 'navbar-search-open')
  end

  def search_input()
    @driver.find_element(class: 'ng-pristine')
  end
end