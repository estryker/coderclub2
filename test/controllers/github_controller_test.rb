require "test_helper"

class GithubControllerTest < ActionDispatch::IntegrationTest
  test "should get lessons" do
    get github_lessons_url
    assert_response :success
  end

  test "should get repl" do
    get github_repl_url
    assert_response :success
  end

  test "should get sessions" do
    get github_sessions_url
    assert_response :success
  end

  test "should get try" do
    get github_try_url
    assert_response :success
  end

  test "should get turtle" do
    get github_turtle_url
    assert_response :success
  end

  test "should get users" do
    get github_users_url
    assert_response :success
  end

  test "should get welcome" do
    get github_welcome_url
    assert_response :success
  end
end
