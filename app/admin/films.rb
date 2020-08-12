ActiveAdmin.register Film do


  permit_params :title, :description, :video, :thumbnail, :CoverImage

    form do |f|
      f.inputs do
        f.input :title
        f.input :description
        f.input :video, as: :file
        f.input :thumbnail, as: :file
        f.input :CoverImage, as: :file
      end

      f.actions
      end

end
