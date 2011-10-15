require 'test_helper'

class ServerTest < ActiveSupport::TestCase
  setup do
    @domain = Server.new({:server => 'chimailtest.com'})
  end
  test "should save server with an address" do
    assert @domain.save

  end
end
