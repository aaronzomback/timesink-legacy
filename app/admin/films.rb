ActiveAdmin.register Film do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :title, :author, :cover, :video, :description, :description_body, :year, :is_top_pick

  index do
    selectable_column
    index_column
    column "Cover Image" do |film|
      image_tag film.cover.thumb.url
    end
    column :title
    column :author
    column :description
    column :description_body
    column :year
    column :is_top_pick
    actions
  end


end
