require 'test_helper'

class StoryTest < ActiveSupport::TestCase

  test "is not valid without a name" do
    s = Story.create(
      name: nil,
      link: 'http://www.example.com'
    )
    assert s.errors[:name].any?
    refute s.valid?
  end

  test "is not valid without a link" do
    s = Story.create(name: 'Test', link: nil)
    assert s.errors[:link].any?
    refute s.valid?
  end

  test "is valid with required attributes" do
    s = users(:jesse).stories.create(
      name: 'Test Website',
      link: 'https://www.example.com'
    )
    assert s.valid?
  end

  test "is associated with a user" do
    assert_equal users(:jesse), stories(:one).user
  end

end
