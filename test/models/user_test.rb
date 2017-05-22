require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test "has a story association" do
    assert_equal 2, users(:jesse).stories.size
    assert users(:jesse).stories.includes stories(:one)
  end

  test "has a vote association" do
    assert_equal 1, users(:jesse).votes.size
    assert users(:jesse).votes.includes votes(:two)
  end

end
