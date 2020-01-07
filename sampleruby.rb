require 'test-unit'
require 'allure-ruby-adaptor-api'

class StringTest < Test::Unit::TestCase

  def test_length
    s = "Hello, World!"
    assert_equal(13, s.length)
  end
end

builder = AllureRubyAdaptorApi::Builder
builder.start_suite "StringTest", :severity => :normal
builder.start_test "StringTest", "test_length", :severity => :critical
builder.stop_test "StringTest", "test_length", :status => :broken, :exception => Exception.new("some error")
builder.stop_suite "StringTest"
builder.build!