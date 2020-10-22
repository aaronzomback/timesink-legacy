ActiveAdmin.register Submission do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :title, :year, :description, :film_length, :film_link, :film_pw, :price, :user_id, :status, :created_at


  index do
    selectable_column
    index_column

    column :created_at
    column :title
    column :year
    column :film_length
    column :description
    column :film_link
    column :status
    actions
  end

end
