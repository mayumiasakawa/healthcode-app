window.addEventListener('load', function(){
  const height = document.getElementById("height");
  const weight = document.getElementById("weight");
  if (height != null && weight != null){
    (height && weight).addEventListener('input',function(){
      const bmi = weight.value / ((height.value*0.01)*(height.value*0.01));
      const roundBMI = Math.round(bmi);
      var addBMIForm = document.getElementById("bmi-form");
    
      addBMIForm.value = roundBMI;
    })
  }
});