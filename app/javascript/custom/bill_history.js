function onPeriodSelect(){
	var year = $("#bill_history_year_select").val();
	var month = $("#bill_history_month_select").val();
	window.location.href = '/get_bill_history/' + month + "/"+ year; 
}

$(document).on('turbolinks:load',function(){
	$("#bill_history_year_select").on('change', onPeriodSelect);
	$("#bill_history_month_select").on('change', onPeriodSelect);
});
