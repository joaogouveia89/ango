$(document).on('turbolinks:load',function(){
	$("#year_select").on('change', function(){
		var year = $("#year_select").val();
		window.location.href = '/year_average/' + year; 
	});
});
