ActiveAdmin.register BlogPost do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :title, :description, :body, :author, :cover, :image_1, :image_2, :image_3, :image_4, :image_5
  #
  # or
  #
  # permit_params do
  #   permitted = [:title, :description, :body, :author, :cover, :image_1, :image_2, :image_3, :image_4, :image_5]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

end
