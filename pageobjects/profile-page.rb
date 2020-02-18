class ProfilePage
  def initialize(driver)
    @driver = driver
  end

  def verify_page_navigation
    wait = Selenium::WebDriver::Wait.new(timeout: 10)
    wait.until do freelancer_name.displayed?
    end
  end

  def freelancer_name()
    @driver.find_element(xpath: '//div[@class="media-body"]//span[@itemprop="name"]')
  end

  def freelancer_profile_attr
    {
        :name => freelancer_name.text,
        :title =>  @driver.find_element(css: '.fe-job-title').text,
        :description => @driver.find_elements(xpath: '//p[@itemprop="description"]')[0].text,
        :skills => @driver.find_elements(css: ".o-tag-skill").compact.map { |x| x.text}.join(", ")
    }
  end

  def verify_all_attribute(keyword)
      Verify.at_least_one_attribute_contains_keyword(freelancer_profile_attr, keyword)
  end
end