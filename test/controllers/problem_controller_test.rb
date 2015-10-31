require 'test_helper'

class ProblemControllerTest < ActionController::TestCase
  test "should get A" do
    get :A
    assert_response :success
  end

  test "should get B" do
    get :B
    assert_response :success
  end

  test "should get C" do
    get :C
    assert_response :success
  end

  test "should get D" do
    get :D
    assert_response :success
  end

end
