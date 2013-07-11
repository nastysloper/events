class User < ActiveRecord::Base
  has_many :created_events, class_name: "Event", foreign_key: "user_id" 
  has_many :event_attendances
  has_many :events, through: :event_attendances
  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def self.authenticate(email, password)
    user = User.find_by_email(email)
    return user if user && (user.password == password)
    nil # either invalid email or wrong password
  end

end
