ActiveAdmin.register Comment, :as => "PostComment" do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :commentable_type, :commentable_id, :user_id, :body
  #
  # or
  #
  # permit_params do
  #   permitted = [:commentable_type, :commentable_id, :user_id, :body]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

end
