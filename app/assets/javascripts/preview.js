// function previewFile() {
//   var preview = document.querySelector('img');
//   var file    = document.querySelector('input[type=file]').files[0];
//   var reader  = new FileReader();

//   reader.addEventListener("load", function () {
//     preview.src = reader.result;
//   }, false);

//   if (file) {
//     reader.readAsDataURL(file);

//   $("#")
//   }
// }

function imgPreView(event){
  var file = event.target.files[0];
  var reader = new FileReader();
  var preview = document.getElementById("preview");
  var previewImage = document.getElementById("previewImage");

  if(previewImage != null)
    preview.removeChild(previewImage);

  reader.onload = function(event) {
     var img = document.createElement("img");
     img.setAttribute("src", reader.result);
     img.setAttribute("id", "previewImage");
     preview.appendChild(img);

  };

  reader.readAsDataURL(file);
}

<input type="file" onChange="imgPreView(event)">
<div id="preview">
</div>

