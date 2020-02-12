require 'selenium-webdriver'
require 'spec_helper'
require 'LaunchBrowser'

describe LaunchBrowser do
    lb=LaunchBrowser.new
  context "when testing the LaunchBrowser class" do
    it "should launch the chrome browser" do
      lb.setup
        #expect('boats').eq to 'boats'
    end
it "should navigate to google page" do
      lb.navigate
    end

    it "should search with given keyword" do
      lb.search_keyword
    end
    it "should click the required link" do
      lb.clicklink
    end
  end
end

#Selenium::WebDriver::Chrome.driver_path= "C:/Seleniumgrid/chromedriver.exe"
#caps=Selenium::WebDriver::Remote::Capabilities.chrome(:chrome_options => {detach: true})
#driver=Selenium::WebDriver.for :chrome, desired_capabilities: caps

#driver.navigate.to "http://www.google.com"
#driver.manage.window.maximize
#sleep(5)

#el=driver.find_element(:name,'q')
#el.send_keys "ruby language"
#sleep(5)
#element=driver.find_element :xpath,'//input[@value="Google Search"]'
#element.click()
#sleep(5)

#element1=driver.find_element :xpath,'//a[@href="https://www.geeksforgeeks.org/ruby-programming-language/"]'
#element1.click()
#sleep(5)
#title=driver.title
#puts "Page tile is "+title
#text1=driver.find_element(:class,'entry-title').text
#puts "Captured Test is..."+text1




















