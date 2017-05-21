require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test "has a story association" do
    assert_equal 2, users(:jesse).stories.size
    assert users(:jesse).stories.includes stories(:one)
  end

end
