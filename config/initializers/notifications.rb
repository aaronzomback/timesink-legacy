# notifications Config
Notifications.configure do
  # Class name of you User model, default: 'User'
  self.user_class = :User

  # Method of user name in User model, default: 'username'
  # self.user_name_method = 'username'

  # Method of user avatar in User model, default: nil
  # self.user_avatar_url_method = nil

  # Method name of user profile page path, in User model, default: nil
  # self.user_profile_url_method = 'profile_url'

  # authenticate_user method in your Controller, default: nil
  # If you use Devise, authenticate_user! is correct
  self.authenticate_user_method = :find_current_user

  # current_user method name in your Controller, default: 'current_user'
  # If you use Devise, current_user is correct
  self.current_user_method = :current_user
end
