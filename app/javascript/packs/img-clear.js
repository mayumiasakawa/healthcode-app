window.addEventListener('load', function(){

  const img = document.getElementById("img")
  const img_clear = document.getElementById("img_clear")
  const imageContent = document.getElementById('image-list');

  img_clear.addEventListener('click', function(){
    img.value = "";
    imageContent.remove();
  });

});
