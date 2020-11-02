ActiveAdmin.register BlogPost do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :title, :description, :body, :author, :cover, :publish_date, :image_1, :image_2, :image_3, :image_4, :image_5


  form do |f|
     f.inputs 'Article' do
       f.input :title
       f.input :publish_date
       f.input :author
       f.input :description, as: :quill_editor, input_html: { data: { options: { modules: { toolbar: [['bold', 'italic', 'underline'], ['link'], ['blockquote', 'code-block'], [{ 'indent': '-1'}, { 'indent': '+1' }],   [{ 'direction': 'rtl' }],  [{ 'align': [] }],   [{ 'size': ['small', false, 'large', 'huge'] }], [{ 'header': [1, 2, 3, 4, 5, 6, false] }], [{ 'list': 'ordered'}, { 'list': 'bullet' }]] }, placeholder: 'Type something...', theme: 'snow' } } }
       f.input :body, as: :quill_editor, input_html: { data: { options: { modules: { toolbar: [['bold', 'italic', 'underline'], ['link'], ['blockquote', 'code-block'], [{ 'indent': '-1'}, { 'indent': '+1' }],   [{ 'direction': 'rtl' }],  [{ 'align': [] }],   [{ 'size': ['small', false, 'large', 'huge'] }], [{ 'header': [1, 2, 3, 4, 5, 6, false] }], [{ 'list': 'ordered'}, { 'list': 'bullet' }]] }, placeholder: 'Type something...', theme: 'snow' } } }
       f.input :cover
     end
     f.actions
   end


end
