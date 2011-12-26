require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  
  def invitation_code
    "alpha2004"
  end
  
  test "should get signup page" do
    get :new
    assert_template :new
    assert_not_nil assigns[:user]
  end

  test "should go back to signup page if signup fails" do
    User.any_instance.stubs(:valid?).returns(false)
    post :create, :invitation_code => invitation_code
    assert_template :new
  end

  test "should go back to signup page with bad invitation code" do
    User.any_instance.stubs(:valid?).returns(true)
    post :create, :invitation_code => "bad_code"
    assert_template :new
  end

  test "should redirect to home page and show notice if signup succeeds" do
    User.any_instance.stubs(:valid?).returns(true)
    post :create, :invitation_code => invitation_code
    assert_redirected_to root_url
    assert_equal assigns[:user].id, session[:user_id]
    assert_not_nil flash[:notice]
  end
  
  test "should not get edit profile page if not logged in" do
    get :edit
    assert_redirected_to alpha_url
  end

  test "should get edit profile page if logged in" do
    @controller.stubs(:current_user).returns(User.first)
    get :edit
    assert_template :edit
    assert_not_nil assigns[:user]
  end

  test "should not update profile without user id" do
    put :update, :id => "ignored"
    assert_redirected_to alpha_url
  end

  test "should not update invalid profile" do
    @controller.stubs(:current_user).returns(User.first)
    User.any_instance.stubs(:valid?).returns(false)
    put :update, :id => "ignored"
    assert_template :edit
  end

  test "should update valid profile" do
    @controller.stubs(:current_user).returns(User.first)
    User.any_instance.stubs(:valid?).returns(true)
    put :update, :id => "ignored"
    assert_redirected_to home_url
    assert_not_nil flash[:notice]
  end
end
