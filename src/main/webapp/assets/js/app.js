/**
 * 
 */
var listArray=[];
 var checkboxes=document.querySelectorAll('.form-check-label');

 for(var checkbox of checkboxes)
	 {
		checkbox.addEventListener('click',function(){
		if(this.checked==true)
			{
				listArray.push(this.value);
				console.log(listArray);
				
			}
		else
			{

			console.log("Unchecked Value");
			}
			});

	 }
