require 'selenium-webdriver'
require 'allure-rspec'
require 'uuid'
require 'rspec/expectations'
require 'allure-ruby-adaptor-api'
require 'test-unit'
include RSpec::Matchers

#Allure REPORTING STARTS
builder=AllureRubyAdaptorApi::Builder
builder.start_suite "CRM" ,:severity => :normal
builder.start_test "CRM", "Login Application", :feature => "Login Application", :severity => :critical
builder.start_step "CRM","Login Application", "First Step- Enter Username and Password"
builder.add_attachment "CRM", "Login Application", :file => Tempfile.new("crmlogin")
=begin
builder.stop_step "CRM","Login Application", "First Step- Enter Username and Password"
builder.stop_test "CRM","Login Application",:status => :broken, :exception => Exception.new("Login Error")
builder.stop_suite "CRM"
builder.build!
=end

Selenium::WebDriver::Chrome.driver_path = "C:/Seleniumgrid/chromedriver.exe"
driver=Selenium::WebDriver.for :chrome

driver.navigate.to "https://classic.crmpro.com"
driver.manage.window.maximize
sleep(5)
el=driver.find_element(:name,'username')
el.send_keys "naveenk"
el1=driver.find_element(:name,'password')
el1.send_keys "test123"
btn1=driver.find_element :xpath,'//input[@class="btn btn-small"]'
btn1.click()
builder.stop_step "CRM","Login Application", "First Step- Enter Username and Password"
builder.stop_test "CRM","Login Application",:status => :broken, :exception => Exception.new("Login Error")
sleep(5)
driver.switch_to.frame('mainpanel')
menu1=driver.find_element :xpath,'//a[@title="Companies"]'
driver.mouse.move_to(menu1)
submenu=driver.find_element :xpath,"//div[@id='navmenu']/ul/li[3]/ul/li/a[contains(text(),'Combined Form')]"
sleep(3)
submenu.click
sleep(3)
dropdownlist_com=driver.find_element(:xpath,'//select[@name="category"]')
options=dropdownlist_com.find_elements(tag_name: 'option')
options.each { |option| option.click if option.text=='Partner' }

selected_option=options.map{|option|option.text if option.selected?}.join
expect(selected_option).to eql 'Partner'

sleep(3)
lookup1=driver.find_element :xpath,"//*[contains(@onclick, 'ASSIST')]"
lookup1.click
sleep(3)

=begin
# Multiple Window hadle - OPTION-1
windowhandles=driver.window_handles
puts "First window handle" +windowhandles[0]
puts "Second window handle" +windowhandles[1]
driver.switch_to.window windowhandles[1]
=end

#Multiple Window hadle - OPTION-2
parent_handle=driver.window_handle
driver.window_handles.each do|handle|
  driver.switch_to.window handle
end

win_two=driver.title
puts "The Second Window Title is.."+win_two
sleep(3)
win_two_btn=driver.find_element(:xpath,'//input[@value="Search"]')
win_two_btn.click
sleep(3)
driver.switch_to.alert.accept
sleep(3)
txt_search1=driver.find_element(:xpath,"//input[@id='search']")
sleep(3)
txt_search1.send_keys "name"
sleep(3)
win_two_btn=driver.find_element(:xpath,'//input[@value="Search"]')
win_two_btn.click
driver.manage.window.maximize
sleep(3)
rownum=driver.find_element(:xpath,'(//a[contains(text(),"FirstName1 LastName1")])[10]')
rownum.click
sleep(3)

#Multiple Window hadle - OPTION-1
=begin
windowhandles=driver.window_handles
driver.switch_to.window windowhandles[0]
=end

driver.switch_to.window(parent_handle)
currtitle=driver.title
puts "The Current window title is"+currtitle
#puts "The Current window is"+windowhandles[0]
puts "Reached Main Screen"
sleep(5)
driver.switch_to.frame('mainpanel')
lookup2=driver.find_element :xpath,"//*[contains(@onclick, 'ASSIST')]"
lookup2.click
sleep(5)
windowhandles=driver.window_handles
puts "First window handle" +windowhandles[0]
puts "Second window handle" +windowhandles[1]
driver.switch_to.window windowhandles[1]
close1=driver.find_element(:xpath,'//input[@value="X"]')
close1.click
puts "Done with lookup Open and CLose"
sleep(3)
windowhandles=driver.window_handles
driver.switch_to.window windowhandles[0]
driver.switch_to.frame('mainpanel')
sleep(3)
driver.execute_script("window.scrollBy(0,200)")
#driver.scroll.to :center
#driver.scroll.to[0,200]
sleep(3)
puts"Performed page scrolldown"
radionum=driver.find_element(:xpath,'//input[@value="N"]')
puts "#{radionum.displayed?}"
#radionum.click
sleep(3)
#puts "#{driver.radio(:value,"Y").set?}"
sleep(3)
puts"THE END..."

builder.stop_suite "CRM"

=begin
menu1.click()
sleep(5)

#dropdown value selection  OPTION-1
dropdown_list=driver.find_element :xpath,'//select[@name="cs_status"]'
options=dropdown_list.find_elements(tag_name: 'option')
options.each {|option|option.click if option.text == 'New'}

#dropdown value validation  OPTION-1
selected_option=options.map{|option|option.text if option.selected?}.join
expect(selected_option).to eql 'New'


#dropdown value selection  OPTION-2
dropdown=driver.find_element :xpath,'//select[@name="cs_category"]'
select_list=Selenium::WebDriver::Support::Select.new(dropdown)
select_list.select_by(:text,'Partner')

#dropdown value validation OPTION-2
=begin
selected_option=select_list.selected_options[1].text
expect(selected_option).to eql 'Partner'
=end

