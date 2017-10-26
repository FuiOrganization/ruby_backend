class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :authentication_keys => [:login]
  # , :registerable,
  #       :recoverable, :rememberable, :trackable, :validatable

  def self.create_facebook_user(id, facebook_user_data)
    user = User.new(name: facebook_user_data["first_name"], email: facebook_user_data["email"], facebook_identifier: id)
    return user if user.save
  end

  def login=(login)
    @login = login
  end

  def login
    @login || self.facebook_identifier || self.email
  end

  def self.find_for_database_authentication(warden_conditions)
      conditions = warden_conditions.dup
      if login = conditions.delete(:login)
        where(conditions.to_h).where(["facebook_identifier = :value OR lower(email) = :value", { :value => login.downcase }]).first
      elsif conditions.has_key?(:facebook_identifier) || conditions.has_key?(:email)
        where(conditions.to_h).first
      end
  end
end
