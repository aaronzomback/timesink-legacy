
  Quill.register("modules/imageUploader", ImageUploader);

  console.log("script");
  document.addEventListener("DOMContentLoaded", function() {
    const fullToolbarOptions = [
      [{ header: [1, 2, 3, false] }],
      ["bold", "italic"],
      ["clean"],
      ["image"]
    ];

    console.log("Dom loaded");

    var quill = new Quill("#editor", {
      theme: "snow",
      modules: {
        toolbar: {
          container: fullToolbarOptions
        },
        imageUploader: {
          upload: file => {
            return new Promise((resolve, reject) => {
              const formData = new FormData();
              formData.append("image", file);

              fetch(
                "https://api.imgbb.com/1/upload?key=d36eb6591370ae7f9089d85875e56b22",
                {
                  method: "POST",
                  body: formData
                }
              )
                .then(response => response.json())
                .then(result => {
                  console.log(result);
                  resolve(result.data.url);
                })
                .catch(error => {
                  reject("Upload failed");
                  console.error("Error:", error);
                });
            });
          }
        }
      }
    });

    console.log(quill);
  });
