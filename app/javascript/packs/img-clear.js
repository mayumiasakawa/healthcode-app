window.addEventListener('load', function(){
  const img = document.getElementById("img")
  const img_clear = document.getElementById("img_clear")
  
  img_clear.addEventListener('click', function(){
    img.value = "";
  });
});
