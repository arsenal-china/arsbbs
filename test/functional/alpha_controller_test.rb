require 'test_helper'

class AlphaControllerTest < ActionController::TestCase
  
  test "should get alpha page if not logged in" do
    get :index
    assert_response :success
    assert_not_nil assigns[:user]
  end

  test "should redirect to home page if logged in" do
    @controller.stubs(:current_user).returns(User.first)
    get :index
    assert_redirected_to home_url
  end

end
