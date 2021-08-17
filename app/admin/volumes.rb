ActiveAdmin.register Volume do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :title, :description, :cover_image, :film_id

  index do
  selectable_column
  index_column
  column "Cover" do |volume|
    image_tag volume.cover_image.thumbnail.url if volume.cover_image.present?
  end
  column :title
  column :description
  column "Films" do |volume|
    volume.films.each do |film|
    end
end
  actions
end

show do
    attributes_table do
      row :cover_image do |volume|
        image_tag volume.cover_image.thumbnail.url if volume.cover_image.present?
      end
      row :title
      row :description
      row "Films" do |volume|
        volume.films.each do |film|
          film
        end
      end
      row :id
    end
  end

end
