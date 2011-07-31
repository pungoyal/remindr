class User < ActiveRecord::Base
  has_many :authentications

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
  attr_accessible :email, :password, :password_confirmation, :remember_me

  def apply_auth(auth)
    self.email = auth['user_info']['email'] if email.blank?
    authentications.build(:provider => auth['provider'], :uid => auth['uid'])
  end

  def password_required?
    (authentications.empty? || !password.blank?) && super
  end
end
