$(document).ready(function(){
    $('#user_cpf').mask('000.000.000-00',{placeholder: "___.___.___-__"});
    $('#user_cnpj').mask('00.000.000/0000-00',{placeholder: "___.___.___/____-__"});
    $("#user_name").mask('Z',{
        translation: {
          'Z': { pattern: /[a-zA-Z ]/, recursive: true}
        },
        maxlength: "20"
      });
    $("#user_rg").mask('#')
    $(".btn-confirm-form").click(function(){
        $("#usuario_username_fisica, #usuario_username_juridica").unmask();
    });
    $('#usuario_cep').mask('00000-000', {placeholder: "_____-___"});
    $('#user_period').mask('00');
    $('.valor-field').maskMoney({showSymbol:true, symbol:"R$", decimal:",", thousands:"."});


});


function mascara(o,f){
    v_obj=o
    v_fun=f
    setTimeout("execmascara()",1)
}
function execmascara(){
    v_obj.value=v_fun(v_obj.value)
}
function mtel(v){
    v=v.replace(/\D/g,"");             //Remove tudo o que não é dígito
    v=v.replace(/^(\d{2})(\d)/g,"($1) $2"); //Coloca parênteses em volta dos dois primeiros dígitos
    v=v.replace(/(\d)(\d{4})$/,"$1-$2");    //Coloca hífen entre o quarto e o quinto dígitos
    return v;
}
function id( el ){
	return document.getElementById( el );
}
window.onload = function(){
	id('user_telephone').onkeyup = function(){
		mascara( this, mtel );
	}
}