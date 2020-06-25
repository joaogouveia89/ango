
function handleClick(){

	var entradaDeCaixa = $("#input-entrada-de-caixa").val();
	var emprestimosJoao = $("#input-emprestimos-joao").val();
	var emprestimosAndressa = $("#input-emprestimos-andressa").val();

	if(entradaDeCaixa.length == 0){
		entradaDeCaixa = 0;
	}else{
		entradaDeCaixa = entradaDeCaixa.replace(",", "");
	}

	if(emprestimosJoao.length == 0){
		emprestimosJoao = 0;
	}else{
		emprestimosJoao = emprestimosJoao.replace(",", "");
	}

	if(emprestimosAndressa.length == 0){
		emprestimosAndressa = 0;
	}else{
		emprestimosAndressa = emprestimosAndressa.replace(",", "");
	}

	if(entradaDeCaixa == 0){
		$("#erroralert").visible();
		return;
	}

	$("#results").show();
	$("#bt_calculate").prop('disabled', true);
	$("#input-entrada-de-caixa").prop('disabled', true);
	$("#input-emprestimos-joao").prop('disabled', true);
	$("#input-emprestimos-andressa").prop('disabled', true);

	var fairSplit = Math.floor((entradaDeCaixa / 3) * 100) / 100;
	
	var casaSlice = fairSplit + parseFloat(emprestimosJoao) + parseFloat(emprestimosAndressa);
	casaSlice = Math.floor(casaSlice * 100) / 100;
	var joaoSlice = fairSplit - parseFloat(emprestimosJoao);
	var andressaSlice = fairSplit - parseFloat(emprestimosAndressa);
	$("#casaresult").append("\u20ac " + casaSlice);
	$("#joaoresult").append("\u20ac " + joaoSlice);
	$("#andressaresult").append("\u20ac " + andressaSlice);
}

$(document).on('turbolinks:load',function(){
	Inputmask({"alias": "currency"}).mask(".money-input");
	$("#bt_calculate").click(handleClick);
	$("#results").hide();
});

