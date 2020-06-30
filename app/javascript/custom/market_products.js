$(document).on('turbolinks:load',function(){
	 $('input[name="market_product_is_in_list"]').change(function(){
	 	var id = $(this).val();
	 	$.ajax({
	 		url: "/add_remove_from_market_list/" + id,
	 		type: "get",
	 		success: function(data){
	 			location.reload();
	 		}
	 	});
	 });

	 $("#searchField").keyup(function(){
	 	//thanks to https://www.w3schools.com/howto/howto_js_filter_table.asp
	 	var query = $(this).val();
	 	var table = document.getElementById("productTable");
	 	var rows = table.getElementsByTagName("tr");
	 	for(i = 1; i < rows.length; i++){
	 		var productName = rows[i].getElementsByTagName("td")[0].innerText;
	 		if (productName.toUpperCase().indexOf(query.toUpperCase()) > -1) {
        		rows[i].style.display = "";
      		} else {
        		rows[i].style.display = "none";
      		}
	 	}
	 })
});
