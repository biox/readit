require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest

  test "should get new" do
    get sessions_new_url
    assert_response :success
  end

  test "should get create" do
    get sessions_create_url
    assert_response :success
  end

  test "should get destroy" do
    get sessions_destroy_url
    assert_response :success
  end

  test "new shows a login form" do
    get new_session_path
    assert_response :success
    assert_select 'form p', 4
  end

  test "perform user login" do
    post session_path, params: {email: 'jesse@example.com', password: 'sekret'}
    assert_redirected_to stories_path
    assert_equal users(:jesse).id, session[:user_id]
  end

  test "bad login fails" do
    post session_path, params: {email: 'noone@nowhere.com', password: 'nothing'}
    assert_response :success
    assert_nil session[:user_id]
  end

end
