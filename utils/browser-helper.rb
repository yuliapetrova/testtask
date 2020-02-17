class Browser
  attr_reader :driver

  def initialize(browser_name)
    puts("Run browser '#{browser_name}'")
    @driver = start_browser(browser_name)
    puts("Delete all cookies")
    @driver.manage.delete_all_cookies
    puts("Maximize browser window")
    @driver.manage.window.maximize
    # setup default timeout
    default_timeout(30)
  end

  def teardown
    puts("Quit browser")
    @driver.quit
  end

  def default_timeout(timeout)
    @driver.manage.timeouts.implicit_wait = timeout
  end

  def start_browser(browser)
    case browser
    when 'firefox'
      driver = Selenium::WebDriver.for :firefox
    when 'chrome'
      driver = Selenium::WebDriver.for :chrome
    else
      driver = Selenium::WebDriver.for :firefox
    end
    driver
  end
end