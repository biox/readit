require 'test_helper'

class VoteTest < ActiveSupport::TestCase

  test "votes have a story" do
    assert_equal stories(:one), votes(:one).story
  end

  test "return highest vote first" do
    highest_id = stories(:one).votes.map(&:id).max
    assert_equal highest_id, stories(:one).votes.latest.first.id
  end

  test "return 3 latest votes" do
    10.times { stories(:one).votes.create }
    assert_equal 3, stories(:one).votes.latest.size
  end

end
