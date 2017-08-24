$(document).ready(function(){	
	$("input:radio[name='customer_type']").change(function(){  

	            if(this.value == 'new' && this.checked){
	              $("#customer_form").show();
	            }else{
	              $("#customer_form").hide();
	            }

	    });
});