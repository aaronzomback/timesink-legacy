module ApplicationHelper

  def display_avatar(user)
  unless user.avatar.nil?
    image_tag(user.avatar.file_name)
  else
    image_tag("/app/assets/images/TS.png")
   end
end
## ...
end
