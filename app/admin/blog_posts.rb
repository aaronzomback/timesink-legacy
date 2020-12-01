ActiveAdmin.register BlogPost do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :title, :description, :body, :author, :cover, :publish_date, :image_1, :image_2, :image_3, :image_4, :image_5


  index do
   selectable_column
   index_column
   column "Cover Image" do |blog_post|
     image_tag blog_post.cover.thumb.url
   end
   column :title
   column :author
   column :publish_date
   column 'Description' do |blog_post|
      simple_format blog_post.description
     end
   actions
 end


  form do |f|
     f.inputs 'Article info' do
       f.input :title
       f.input :publish_date
       f.input :author
     end
     f.inputs 'Cover Image' do
      f.input :cover
    end
     f.inputs 'Article content' do
       f.input :description, as: :quill_editor, input_html: { data: { options: { modules: { toolbar: [['bold', 'italic', 'underline'], ['link'], ['blockquote', 'code-block'], [{ 'indent': '-1'}, { 'indent': '+1' }],   [{ 'direction': 'rtl' }],  [{ 'align': [] }],   [{ 'size': ['small', false, 'large', 'huge'] }], [{ 'header': [1, 2, 3, 4, 5, 6, false] }], [{ 'list': 'ordered'}, { 'list': 'bullet' }]] }, placeholder: 'Type something...', theme: 'snow' } } }
       f.input :body, as: :quill_editor, input_html: { data: { options: { modules: { toolbar: [['bold', 'italic', 'underline'], ['link'], ['blockquote', 'code-block'], [{ 'indent': '-1'}, { 'indent': '+1' }],   [{ 'direction': 'rtl' }],  [{ 'align': [] }],   [{ 'size': ['small', false, 'large', 'huge'] }], [{ 'header': [1, 2, 3, 4, 5, 6, false] }], [{ 'list': 'ordered'}, { 'list': 'bullet' }]] }, placeholder: 'Type something...', theme: 'snow' } } }
      end
     f.actions
   end

   show do
       attributes_table do
         row :cover do |blog_post|
           image_tag blog_post.cover.thumb.url
         end
         row :title
         row :author
         row :publish_date
         row (:description) { |blog_post| raw(blog_post.description) }
         row (:body) { |blog_post| raw(blog_post.body) }
       end
     end


end
