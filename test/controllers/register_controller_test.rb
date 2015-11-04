require 'test_helper'

class RegisterControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get search" do
    get :search
    assert_response :success
  end

  test "should get result" do
    get :result
    assert_response :success
  end

end
