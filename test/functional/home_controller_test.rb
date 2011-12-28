require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  
  test "should get index if logged in" do
    @controller.stubs(:current_user).returns(User.first)
    get :index
    assert_response :success
    assert_not_nil assigns(:boards)
  end

  test "should redirect to alpha page if not logged in" do
    get :index
    assert_redirected_to :alpha
  end

end
