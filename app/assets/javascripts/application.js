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
//= require jquery.maskedinput-1.3.min
//= require twitter/bootstrap
//= require_tree .

jQuery(function($){
   $(".date").mask("99/99/9999");
   $(".phone").mask("(99) 9999-9999");
   $(".cpf").mask("999.999.999-99");
   $(".cep").mask("99999-999");
});

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