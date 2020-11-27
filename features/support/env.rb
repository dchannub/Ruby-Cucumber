require 'selenium-webdriver'

@Browser

Before do |scenario|
  @Browser = Selenium::WebDriver.for :chrome
  @Browser.manage.window.maximize
  $Browser=@Browser
end

After do |scenario|
  @Browser.quit
end