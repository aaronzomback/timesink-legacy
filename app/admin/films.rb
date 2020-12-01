ActiveAdmin.register Film do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
   permit_params :title, :author, :cover, :description, :year, :is_top_pick, :slug, :video, :description_body, :cached_votes_total, :cached_votes_score, :cached_votes_up, :cached_votes_down, :cached_weighted_score, :cached_weighted_total, :cached_weighted_average, :trailer


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

 form do |f|
     f.inputs 'Film info' do
       f.input :title
       f.input :author
       f.input :year
     end
     f.inputs 'Duration, Year' do
       f.input :description
     end
     f.inputs 'Synopsis' do
       f.input :description_body
     end
     f.inputs 'Film media' do
       f.input :cover
       f.input :video
       f.input :trailer
     end
     f.actions
   end



 end
