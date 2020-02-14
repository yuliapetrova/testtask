class SearchPage
  URL = "https://www.upwork.com"

  def initialize(driver)
    @driver = driver
    driver.navigate.to URL
    # implicit wait
    driver.manage.timeouts.implicit_wait = 30
  end

  def search_input()
    @driver.find_element(css: 'div.navbar-fixed-subnav div.navbar-form input.form-control')
  end
end