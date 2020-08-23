ActiveAdmin.register ForumPost do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :title, :body, :image_1, :image_2, :image_3
  #
  # or
  #
  permit_params do
    permitted = [:title, :body, :image_1, :image_2, :image_3]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  end

end
