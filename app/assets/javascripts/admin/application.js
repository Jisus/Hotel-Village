// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require jquery-ui-timepicker-addon
//= require i18n/jquery.ui.datepicker-pt-BR
//= require jquery.maskedinput-1.3.min
//= require twitter/bootstrap
//= require_tree .

var consumo_id = 0;

accounting.settings = {
	currency: {
		symbol : "R$ ",   // default currency symbol is '$'
		format: "%s%v", // controls output: %s = symbol, %v = value/number (can be object: see below)
		decimal : ",",  // decimal point separator
		thousand: ".",  // thousands separator
		precision : 2   // decimal places
	},
	number: {
		precision : 0,  // default precision on numbers is 0
		thousand: ".",
		decimal : ","
	}
}

jQuery(function($){
	
	$(".date").mask("99/99/9999");
	$(".phone").mask("(99) 9999-9999");
	$(".cpf").mask("999.999.999-99");
	$(".cep").mask("99999-999");
	$('.dropdown-toggle').dropdown();

	$.datepicker.setDefaults($.datepicker.regional['pt-BR']);	 
	$('.datetimepicker').datetimepicker({
		timeText: 'Horas',
		hourText: 'Hora',
		minuteText: 'Minuto',
		secondText: 'Segundo',
		currentText: 'Agora',
		closeText: 'Pronto'
	});
	$('.datepicker').datepicker();
	$('.timepicker').timepicker();

	$('#addProduto').on('hidden', function () {
		$('#quantidade',this).val('');
	})
});

function carregaEndereco(input) {    
	// com jquery ficaria mais ou menos assim:  
	$.getJSON("/system/busca_cep?cep = " + input.value, function (data) {  
		$('.rua').val(data[0]+' '+data[1]);
		$('.bairro').val(data[2]);
		$('.cidade').val(data[3]);
		$('.estado').val(data[4]);
		$('.pais').val('Brasil');
		$('.numero').focus();
	}).error(function(data){
		console.log(data);
	});
}  

function removeProduto(el){
	$(el).parent().parent().fadeOut('slow', function(){
		$(el).parent().parent().remove();
		calcula();
	});
}

function addProduto(){
	consumo_id++;
	
	qnt = $('#quantidade','#addProduto').val();
	produto = $('#produtos_add','#addProduto').val();
	
	$.getJSON('/admin/produtos/'+produto).success(function(data){
		tbody = '\
		<tr>\
		<td>\
		'+qnt+'\
		<input type="hidden" id="consumo_'+consumo_id+'_qnt" name="consumo['+consumo_id+'][qnt]" class="qnt" value="'+qnt+'" />	\
		</td>\
		<td>\
		'+data.desc+'\
		<input type="hidden" id="consumo_'+consumo_id+'_desc" name="consumo['+consumo_id+'][desc]" class="desc" value="'+data.desc+'" />		\
		</td>\
		<td>\
		'+data.valor_real+'\
		<input type="hidden" id="consumo_'+consumo_id+'_valor" name="consumo['+consumo_id+'][valor]" class="valor" value="'+data.valor_decimal+'" />		\
		</td>\
		<td id="'+consumo_id+'" class="total">\
		\
		</td>\
		</tr>\
		';
	
		$('tbody').append(tbody);
		$('.new').fadeIn('slow');
	
		calcula();
		
		$('#addProduto').modal('hide');
	})
}

Number.prototype.formatMoney = function(c, d, t){
	var n = this, c = isNaN(c = Math.abs(c)) ? 2 : c, d = d == undefined ? "," : d, t = t == undefined ? "." : t, s = n < 0 ? "-" : "", i = parseInt(n = Math.abs(+n || 0).toFixed(c)) + "", j = (j = i.length) > 3 ? j % 3 : 0;
	return s + (j ? i.substr(0, j) + t : "") + i.substr(j).replace(/(\d{3})(?=\d)/g, "$1" + t) + (c ? d + Math.abs(n - i).toFixed(c).slice(2) : "");
};
 
function calcula(){
	var total = 0;
	$('.consumo tbody tr').each(function(){
		var total_this = parseFloat($('.qnt',this).val()) * parseFloat($('.valor',this).val());
		$('.total',this).html(accounting.formatMoney(total_this)+'<button class="btn btn-mini btn-danger" name="button" onclick="removeProduto(this)" style="float:right" type="button">Remover</button>');
		total = total + total_this;
	});
	$('#consumo_total').html(accounting.formatMoney(total));
}