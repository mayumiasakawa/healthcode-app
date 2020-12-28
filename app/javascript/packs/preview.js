window.addEventListener('DOMContentLoaded', function() {

  const registration = document.getElementById( 'registration' );
  if ( registration ) {  
     // 画像が表示されている場合のみ、すでに存在している画像を削除する
     const imageContentId = document.getElementById('image');
     if (imageContentId){
       imageContentId.remove();
     }
      document.getElementById('item-image').addEventListener('change', function(e){
        const ImageList = document.getElementById('image-list');
        const imageContent = document.querySelector('img');

        if (imageContent){
          imageContent.remove();
        }
  
        const createImageHTML = (blob) => {
           // 画像を表示するためのdiv要素を生成
          const imageElement = document.createElement('div');
    
          // 表示する画像を生成
          const blobImage = document.createElement('img');
          blobImage.setAttribute('src', blob);
    
          // 生成したHTMLの要素をブラウザに表示させる
          imageElement.appendChild(blobImage);
          ImageList.appendChild(imageElement);
        };
  
        const file = e.target.files[0];
        const blob = window.URL.createObjectURL(file);
  
        createImageHTML(blob);
      });
  }
});