require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  
  test "should get login page" do
    get :new
    assert_template 'new'
  end

  test "should go back to login page with error message if login fails" do
    User.stubs(:authenticate).returns(nil)
    post :create
    assert_template 'new'
    assert_nil session['user_id']
    assert_not_nil flash.now[:alert]
  end

  test "should redirect to home page with notice if login succeeds" do
    User.stubs(:authenticate).returns(User.first)
    post :create
    assert_redirected_to root_url
    assert_equal User.first.id, session['user_id']
    assert_not_nil flash[:notice]
  end
  
  test "should log out" do
    get :destroy
    assert_redirected_to root_url
    assert_nil session['user_id']
    assert_not_nil flash[:notice]
  end
  
end
