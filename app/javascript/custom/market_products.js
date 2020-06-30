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
});
