ActiveAdmin.register GalleryItem do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
   permit_params :title, :image, :author, :year, :description, :film_id
  #
  # or
  #
  #permit_params do
    #permitted = [:title, :image, :author, :year, :description]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

end
