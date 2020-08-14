ActiveAdmin.register Film do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :title, :author, :description, :image, :year, :is_top_pick
  #
  # or
  #
  # permit_params do
  #   permitted = [:title, :author, :description, :image, :year, :is_top_pick]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

end
