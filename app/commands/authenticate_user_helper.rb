class AuthenticateUserHelper
  prepend SimpleCommand

  def initialize(email, password, role)
    @email = email
    @password = password
    @role = role
  end

  def call
    return nil unless user

    return JsonWebToken.create_token(user_id: user.id), user
  end

  private

  attr_accessor :email, :password, :role

  def user
    user = User.find_by(email: email, role: role)
    if user && user.authenticate(password)
      user
    else
      errors.add(:user_authentication, 'invalid email or password')
      nil
    end
  end
end
