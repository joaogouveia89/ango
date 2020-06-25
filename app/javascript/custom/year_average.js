$(document).on('turbolinks:load',function(){
	$("#year_average_year_select").on('change', function(){
		var year = $("#year_average_year_select").val();
		window.location.href = '/year_average/' + year; 
	});
});
