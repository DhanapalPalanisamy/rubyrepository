#require 'aws-sdk'
#require 'allure-ruby-adaptor-api'
#require 'test-unit'

#class LaunchBrowser < Test::Unit::TestCase
class LaunchBrowser
   attr_accessor :driver,:element, :element1, :text1,:title, :el
  def setup
    Selenium::WebDriver::Chrome.driver_path= "C:/Seleniumgrid/chromedriver.exe"
    caps=Selenium::WebDriver::Remote::Capabilities.chrome(:chrome_options => {detach: true})
    sleep(2)
    @@driver=Selenium::WebDriver.for :chrome, desired_capabilities: caps
  end

  def navigate
    @@driver.navigate.to "http://www.google.com"
    sleep(2)
    @@driver.manage.window.maximize
    sleep(2)

  end

  def search_keyword
    element=@@driver.find_element(:name,'q')
    element.send_keys "ruby language"
    sleep(2)
    element1=@@driver.find_element :xpath,'//input[@value="Google Search"]'
    element1.click()
    sleep(2)
  end

  def clicklink
    element1=@@driver.find_element :xpath,'//a[@href="https://www.geeksforgeeks.org/ruby-programming-language/"]'
    element1.click()
    sleep(2)
    title=@@driver.title
    puts "Page tile is "+title
    text1=@@driver.find_element(:class,'entry-title').text
    puts "Captured Test is..."+text1
    @@driver.quit
  end
end

#builder=AllureRubyAdaptorApi::Builder
#builder.start_suite "LaunchBroswer", :severity => :normal

#builder.start_test "LaunchBrowser","setup",:severity => :critical
#builder.stop_test"LaunchBrowser","setup",:status => :broken, :exception => Exception.new("some error")

#builder.start_test  "LaunchBrowser", "navigate", :severity => :normal
#builder.stop_test "LaunchBrowser", "navigate",:status => :broken, :exception =>Exception.new("some error")

#builder.start_test  "LaunchBrowser", "search_keyword", :severity => :normal
#builder.stop_test "LaunchBrowser", "search_keyword",:status => :broken, :exception =>Exception.new("some error")

#builder.start_test  "LaunchBrowser", "clicklink", :severity => :normal
#builder.stop_test "LaunchBrowser", "clicklink",:status => :broken, :exception =>Exception.new("some error")

#builder.stop_suite "LaunchBrowser"
#builder.build!