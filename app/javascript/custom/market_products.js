function hideShowQuantidadesCollumn(shouldBeVisible){
	var table = document.getElementById("marketListTable");
 	var titleRow = table.getElementsByTagName("th");
 	var rows = table.getElementsByTagName("tr");
 	if(shouldBeVisible){
		titleRow[3].classList.remove("hideTableCollumn");
 	}else{
 		titleRow[3].classList.add("hideTableCollumn");
 	}
 	if(rows.length > 0 && rows[1].getElementsByTagName("td").length > 1){
	 	for(i = 1; i < rows.length; i++){
	 		if(shouldBeVisible){
				rows[i].getElementsByTagName("td")[3].classList.remove("hideTableCollumn");
		 	}else{
		 		rows[i].getElementsByTagName("td")[3].classList.add("hideTableCollumn");
		 	}
	 	}
 	}
}

function configureScreenForSimulation(areButtonsEnabled){
	console.log("passou aqui");
	if(!areButtonsEnabled){
		$("#bt_esvaziar_lista").addClass('disabled');
		$("#bt_load_default_list").addClass('disabled');
		$("#bt_new_product").addClass('disabled');
	}else{
		$("#bt_esvaziar_lista").removeClass('disabled');
		$("#bt_load_default_list").removeClass('disabled');
		$("#bt_new_product").removeClass('disabled');
	}
}

function calculateMarketListSum(){
	var total = 0;
	var table = document.getElementById("marketListTable");
	var rows = table.getElementsByTagName("tr");
	for(i = 1; i < rows.length; i++){
		var productValue = parseFloat(rows[i].getElementsByTagName("td")[2].textContent.replace("€","").trim());
		var selectElement = rows[i].getElementsByTagName("td")[3].getElementsByTagName("select")[0];
		var options = selectElement.getElementsByTagName("option");
		var quantity = 1;
		for(j = 0; j < options.length; j++){
			if(options[j].selected){
				quantity = options[j].value
				break;
			}
		}
		total += productValue * quantity;
	}
	return total;
}

$(document).on('turbolinks:load',function(){
	var isQuantidadesCollumnVisible = false;
	hideShowQuantidadesCollumn(isQuantidadesCollumnVisible);
	$("#total_market_simulation").hide();

	$("select[name='sel_product_quantity']").change(function(){
		var sum = calculateMarketListSum();
		$("#total_market_simulation").html("Total: € " + sum.toFixed(2));
	})
	
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
	 });

	 $("#bt_market_simulation").click(function(){
	 	isQuantidadesCollumnVisible = !isQuantidadesCollumnVisible;
	 	configureScreenForSimulation(!isQuantidadesCollumnVisible);
	 	hideShowQuantidadesCollumn(isQuantidadesCollumnVisible);
	 	if(isQuantidadesCollumnVisible){
	 		var sum = calculateMarketListSum();
	 		$("#bt_market_simulation").removeClass( "btn-primary" ).addClass( "btn-danger" );
	 		$("#bt_market_simulation").html("Parar simulação");
	 		$("#total_market_simulation").html("Total: € " + sum.toFixed(2));
	 		$("#total_market_simulation").show();
	 	}else{
	 		$("#bt_market_simulation").removeClass( "btn-danger" ).addClass( "btn-primary" );
	 		$("#bt_market_simulation").html("Simular compra");
	 		$("#total_market_simulation").html("");
	 		$("#total_market_simulation").hide();
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
