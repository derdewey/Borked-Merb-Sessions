require File.join(File.dirname(__FILE__), '..', 'spec_helper.rb')

describe "/session_tests" do
  before(:each) do
    @response = request("/session_tests")
  end
end