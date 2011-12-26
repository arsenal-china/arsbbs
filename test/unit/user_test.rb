require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  def user_att(attributes = {})
    attributes[:username] ||= 'default_username'
    attributes[:email] ||= 'default@email-address.com'
    attributes[:password] ||= '12345678'
    attributes[:password_confirmation] ||= attributes[:password]
    attributes
  end
  
  def trans_err(error)
    [I18n.t('activerecord.errors.models.user.attributes.' + error)]
  end

  test "should validate and create user" do
    user = User.new user_att
    assert user.valid?, "new user did not pass validation"
    assert_difference "User.count", 1, "user count did not increase by one" do
      user.save
    end
  end

  test "should validate uniqueness of email" do
    user1 = User.create user_att
    user2 = User.create user_att
    assert_equal trans_err('email.taken'), user2.errors[:email]
  end

  test "should fail validation with email address in wrong format" do
    user = User.create user_att :email => 'wrong@format@email-address.com'
    assert_equal trans_err('email.invalid'), user.errors[:email]
  end

  test "should not create user without password" do
    assert_difference "User.count", 0, "user count should not increase" do
      user = User.create user_att :password => ''
      assert_equal trans_err('password.blank'), user.errors[:password]
    end
  end

  test "should not create user without username" do
    assert_difference "User.count", 0, "user count should not increase" do
      user = User.create user_att :username => ''
      assert_equal trans_err('username.blank'), user.errors[:username]
    end
  end

  test "should validate uniqueness of username" do
    user1 = User.create user_att
    user2 = User.create user_att
    assert_equal trans_err('username.taken'), user2.errors[:username]
  end

  test "should validate length of password" do
    user = User.create user_att :password => '1234567'
    assert_equal trans_err('password.too_short'), user.errors[:password]
  end

  test "should require matching password confirmation" do
    user = User.create user_att :password_confirmation => 'non-matching-password'
    assert_equal trans_err('password.confirmation'), user.errors[:password]
  end
  
  test "should generate password hash and salt on create" do
    user = User.create user_att
    assert user.password_hash
    assert user.password_salt
  end

  test "should authenticate by email and password" do
    User.delete_all
    user = User.create user_att
    assert_equal user, User.authenticate(user_att[:email], user_att[:password])
  end

  test "should not pass authentication with bad email" do
    User.delete_all
    user = User.create user_att
    assert_nil User.authenticate('bad@email-address.com', user_att[:password])
  end

  test "should not pass authentication with bad password" do
    User.delete_all
    user = User.create user_att
    assert_nil User.authenticate(user_att[:email], "bad_password")
  end
  
  test "should pass check with good invitation code" do
    assert User.is_invited?('alpha2004')
  end
  
  test "should not pass check with bad invitation code" do
    assert !User.is_invited?('bad_code')
  end
  
end
