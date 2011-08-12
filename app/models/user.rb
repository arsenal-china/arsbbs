class User < ActiveRecord::Base
  
  attr_accessible :username, :email, :password, :password_confirmation

  attr_accessor :password
  before_save :prepare_password

  validates_format_of :email, :with => /^[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}$/i
  validates_uniqueness_of :username, :email
  validates_presence_of :username
  validates_presence_of :password, :on => :create
  validates_confirmation_of :password
  validates_length_of :password, :minimum => 8, :allow_blank => true

  def self.authenticate(email, pass)
    user = find_by_email(email)
    return user if user && user.password_hash == user.encrypt_password(pass)
  end

  def encrypt_password(pass)
    BCrypt::Engine.hash_secret(pass, password_salt)
  end

  private

  def prepare_password
    unless password.blank?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = encrypt_password(password)
    end
  end

end
