require 'selenium-webdriver'
$driver=driver;
class LaunchBrowser
  @@caps;
  def setup
    Selenium::WebDriver::Chrome.driver_path= "C:/Seleniumgrid/chromedriver.exe"
    caps=Selenium::WebDriver::Remote::Capabilities.chrome(:chrome_options => {detach: true})
    driver=Selenium::WebDriver.for :chrome, desired_capabilities:caps
    sleep(5)
  end
  def navigate
    sleep(2)
    driver.navigate.to "http://www.google.com"
    driver.manage.window.maximize
    sleep(5)
  end
    def search
    el=@driver.find_element(:name,'q')
    el.send_keys "ruby language"
    sleep(5)
    @element=@driver.find_element :xpath,'//input[@value="Google Search"]'
    sleep(5)
    @element.click()
    sleep(5)
  end

  def click_link
    @element1=@driver.find_element :xpath,'//a[@href="https://www.geeksforgeeks.org/ruby-programming-language/"]'
    @element1.click()
    sleep(5)
    @title=@driver.title
    puts "Page tile is "+@title
    @text1=@driver.find_element(:class,'entry-title').text
    puts "Captured Test is..."+text1
  end

end


describe LaunchBrowser do
  context "when testing the LaunchBrowser class" do
    lb=LaunchBrowser.new
    it "should launch the browser when setup method is called" do
      lb.setup
    end
    it "should navigate to google page, when navigate method is called" do
      lb.navigate
    end
    it "should search for the entered keyword in google page" do
      lb.search
    end

    it "Should click on the ruby language link" do
      lb.click_link
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























