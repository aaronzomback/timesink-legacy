require('activeadmin_quill_editor')



<script src="/dist/quill.js"></script>
<script src="/dist/quill.imageUploader.min.js"></script>

Quill.register("modules/ImageUploader", ImageUploader);

var quill = new Quill(editor, {
  // ...
  modules: {
    // ...
    imageUploader: {
      upload: file => {
        return new Promise((resolve, reject) => {
          setTimeout(() => {
            resolve(
              "https://upload.wikimedia.org/wikipedia/commons/thumb/6/6a/JavaScript-logo.png/480px-JavaScript-logo.png"
            );
          }, 3500);
        });
      }
    }
  }
});
