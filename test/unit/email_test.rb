require 'test_helper'

class EmailTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should not save email without an address" do
    acc = Email.new
    assert !acc.save
  end
  test "should not save email without a duplicate address" do
    acc = Email.new({:address => 'test@test.com'})
    assert acc.save
    acc = Email.new({:address => 'test@test.com'})
    assert !acc.save
  end
end
