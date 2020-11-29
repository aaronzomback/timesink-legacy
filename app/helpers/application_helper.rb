module ApplicationHelper

  def display_avatar(user)
  unless user.avatar.nil?
    image_tag(user.avatar.file_name)
  else
    image_tag("/app/assets/images/TS.png")
   end
end
## ...
  def get_commentable_obj(obj)
    loop do
      obj = obj.commentable
      break obj if obj.is_a?(BlogPost)  || obj.is_a?(Review)
    end
  end
end
