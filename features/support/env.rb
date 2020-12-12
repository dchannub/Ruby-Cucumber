require 'selenium-webdriver'

Before do |scenario|
  @Browser = Selenium::WebDriver.for :chrome
  @Browser.manage.window.maximize
  $Browser=@Browser
end

After do |scenario|
  if scenario.failed?
    i = Time.now.strftime('%Y-%m-%d_%H.%M.%S')
    name = scenario.feature.name
    $Browser.save_screenshot("features/screenshot/screenshot_#{name}_#{i}.png")
  end
end