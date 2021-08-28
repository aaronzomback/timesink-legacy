process.env.NODE_ENV = process.env.NODE_ENV || 'development'

const environment = require('./environment')

module.exports = environment.toWebpackConfig()


import Quill from "quill";
import ImageUploader from "quill.imageUploader.js";

Quill.register("modules/imageUploader", ImageUploader);

const quill = new Quill(editor, {
  // ...
  modules: {
    // ...
    imageUploader: {
      upload: (file) => {
        return new Promise((resolve, reject) => {
          setTimeout(() => {
            resolve(
              "https://upload.wikimedia.org/wikipedia/commons/thumb/6/6a/JavaScript-logo.png/480px-JavaScript-logo.png"
            );
          }, 3500);
        });
      },
    },
  },
});
