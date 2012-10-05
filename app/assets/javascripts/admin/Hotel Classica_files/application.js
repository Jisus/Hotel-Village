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










jQuery(function($){
	$(".date").mask("99/99/9999");
	$(".phone").mask("(99) 9999-9999");
	$(".cpf").mask("999.999.999-99");
	$(".cep").mask("99999-999");
	$('.dropdown-toggle').dropdown();

	$.datepicker.setDefaults($.datepicker.regional['pt-BR']);	 
	$('.datetimepicker').datetimepicker({
		dateFormat: 'dd-mm-yy',
		timeText: 'Horas',
		hourText: 'Hora',
		minuteText: 'Minuto',
		secondText: 'Segundo',
		currentText: 'Agora',
		closeText: 'Pronto'
	});
	$('.datepicker').datepicker();
	$('.timepicker').timepicker();


	Cufon.replace('h1') ('h2') ('h3') ('h4') ('h5') ('h6');
	
	jQuery('#slider').cycle({
		timeout: 6000,  // milliseconds between slide transitions (0 to disable auto advance)
		fx:     'fade', // choose your transition type, ex: fade, scrollUp, shuffle, etc...            
		prev:   '#slideprev', // selector for element to use as click trigger for next slide  
		next:   '#slidenext', // selector for element to use as click trigger for previous slide
		pause:   true,	  // true to enable "pause on hover"
		cleartypeNoBg: true, // set to true to disable extra cleartype fixing (leave false to force background color setting on slides)
		pauseOnPagerHover: 0 // true to pause when hovering over pager link
	});
	 
});

function reservaShow(dataEntrada, dataSaida){
	if(dataEntrada == ''){
		alert("Você precisa selecionar uma data de Entrada")
	} else if (dataSaida == ''){
		alert("Você precisa selecionar uma data de Saida")
	} else {
		window.location = "/reservas/show/"+encodeURIComponent(dataEntrada)+"/"+encodeURIComponent(dataSaida);
	}
}

function carregaEndereco(input) {    
	// com jquery ficaria mais ou menos assim:  
	$.getJSON("/system/busca_cep?cep=" + input.value, function (data) {  
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
;
