ActiveAdmin.register User do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :username, :email, :password_digest, :avatar, :location
  index do
    selectable_column
    index_column
    column "Avatar" do |user|
      image_tag user.avatar.thumbnail.url if user.avatar.present?
    end
    column :location
    column :name
    column :username
    column :email
    column :newsletter
    actions
  end


end
