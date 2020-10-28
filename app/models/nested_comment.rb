class NestedComment < ApplicationRecord
  
  belongs_to :user
  belongs_to :film


 def sub_comments
   Comment.where(reply_comment: id)
 end

end
