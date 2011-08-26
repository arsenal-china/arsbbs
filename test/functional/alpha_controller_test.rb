require 'test_helper'

class AlphaControllerTest < ActionController::TestCase
  
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns[:user]
  end

end
