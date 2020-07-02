function hideShowQuantidadesCollumn(shouldBeVisible){
	var table = document.getElementById("marketListTable");
 	var titleRow = table.getElementsByTagName("th");
 	if(shouldBeVisible){
		titleRow[3].classList.remove("hideTableCollumn");
 	}else{
 		titleRow[3].classList.add("hideTableCollumn");
 	}
 	var rows = table.getElementsByTagName("tr");
 	for(i = 1; i < rows.length; i++){
 		if(shouldBeVisible){
			rows[i].getElementsByTagName("td")[3].classList.remove("hideTableCollumn");
	 	}else{
	 		rows[i].getElementsByTagName("td")[3].classList.add("hideTableCollumn");
	 	}
 	}
}

$(document).on('turbolinks:load',function(){
	var isQuantidadesCollumnVisible = false;
	hideShowQuantidadesCollumn(isQuantidadesCollumnVisible);
	
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

	 $('input[name="market_product_is_default_in_list"]').change(function(){
	 	var id = $(this).val();
	 	$.ajax({
	 		url: "/is_default_on_list/" + id,
	 		type: "get",
	 		success: function(data){
	 			location.reload();
	 		}
	 	});
	 });

	 $("#bt_load_default_list").click(function(){
	 	var hasItemsInList = $(this).data('has-items-in-list');
	 	var keepInListItems = false;
	 	if(hasItemsInList){
	 		keepInListItems = confirm("A lista de compras ja tem alguns itens, deseja mante-los?");		
	 	}
	 	$.ajax({
	 		url: "/load_default_list/" + keepInListItems,
	 		type: "get",
	 		success: function(data){
	 			location.reload();
	 		}
	 	});
	 	//ajax call to the endpoint to redo the list
	 });

	 $("#bt_market_simulation").click(function(){
	 	isQuantidadesCollumnVisible = !isQuantidadesCollumnVisible;
	 	hideShowQuantidadesCollumn(isQuantidadesCollumnVisible);
	 	if(isQuantidadesCollumnVisible){
	 		$("#bt_market_simulation").removeClass( "btn-primary" ).addClass( "btn-danger" );
	 		$("#bt_market_simulation").html("Parar simulação");
	 	}else{
	 		$("#bt_market_simulation").removeClass( "btn-danger" ).addClass( "btn-primary" );
	 		$("#bt_market_simulation").html("Simular compra");
	 	}
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
