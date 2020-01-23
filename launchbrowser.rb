require 'selenium-webdriver'
#sample
Selenium::WebDriver::Chrome.driver_path= "C:/Seleniumgrid/chromedriver.exe"

caps=Selenium::WebDriver::Remote::Capabilities.chrome(:chrome_options => {detach: true})
driver=Selenium::WebDriver.for :chrome, desired_capabilities: caps

#Remote WebDriver
#caps = Selenium::WebDriver::Remote::Capabilities.chrome("chromeOptions" => {"args" => [ "disable-infobars" ]})
#driver = Selenium::WebDriver.for :remote, url: 'http://localhost:4444/wd/hub', desired_capabilities: caps

#driver = Selenium::WebDriver.for :chrome, switches: %w[--incognito]

#Selenium::WebDriver::Chrome::Service.driver_path= "C:/Seleniumgrid/chromedriver.exe"
#driver.get("http://www.google.com")
  driver.navigate.to "http://www.google.com"
driver.manage.window.maximize
sleep(5)
el=driver.find_element(:name,'q')
el.send_keys "ruby language"
sleep(5)
element=driver.find_element :xpath,'//input[@value="Google Search"]'
element.click()
sleep(5)
element1=driver.find_element :xpath,'//a[@href="https://www.geeksforgeeks.org/ruby-programming-language/"]'
element1.click()
sleep(5)
title=driver.title
puts "Page tile is "+title
text1=driver.find_element(:class,'entry-title').text
puts "Captured Test is..."+text1























