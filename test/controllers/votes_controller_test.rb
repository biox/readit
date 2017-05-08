require 'test_helper'

class VotesControllerTest < ActionDispatch::IntegrationTest

  test "show story" do
    get story_path(stories(:one))
    assert_response :success
    assert response.body.include?(stories(:one).name)
  end

  test "show story vote elements" do
    get story_path(stories(:one))
    assert_select 'h2 span#vote_score'
    assert_select 'ul#vote_history li', count: 2
    assert_select 'div#vote_form form'
  end

  test "creates vote" do
    assert_difference 'stories(:two).votes.count' do
      post story_votes_path(stories(:two))
    end
  end

end
