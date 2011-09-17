require 'test_helper'

class EmailTest < ActiveSupport::TestCase
  setup do
    @domain = Domain.new({:name => 'test.com'})
    @domain.save
  end
  test "should not save email without an address" do
    acc = Email.new
    assert !acc.save
  end
  test "should not save email without a duplicate address" do
    acc = Email.new({:address => 'test', :domain_id => @domain.id})
    assert acc.save
    acc = Email.new({:address => 'test', :domain_id => @domain.id})
    assert !acc.save
  end
end
