// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$(document).on('page:load', function(){
	$("#tabla1 tr:odd").css("background-color","#fbc1ff"); //Color de las filas pares
	$("#tabla1 tr:even").css("background-color","#6effd1");//Color de las filas impares
	$(".th").css({"font-weight":"bold","background-color":"white"});//Color y letra negrita de la primera fila (Titulos
	$("#tabla2 tr:odd").css("background-color","#99f5ff");
	$("#tabla2 tr:even").css("background-color","#ffd884");
	$("#tabla3 tr:odd").css("background-color","#c2c2c2");
	$("#tabla3 tr:even").css("background-color","#ff6b5a");
	$("#tabla4 tr:odd").css("background-color","#ff6b5a");
	$("#tabla4 tr:even").css("background-color","#fcb1ff");

	
	$('.marg').mouseover(function(){  //Función para cuando el puntero entra en alguna de las fotos pequeñas
		$('#texto').fadeOut(0);		//Sacamos el texto y la foto que hubiera
		$('.maxi').fadeOut(0);
		$('.maxi').attr("src",$(this).attr("src")); // Cambiamos el atributo src de la imagen grande y le ponemos el de la imagen pequeña que ha generado el evento
		$('#texto').attr("textContent",$(this).attr("title")); //Realizamos la misma operación con el texto
		$('#texto').fadeIn(200);  // Los hacemos aparecer
		$('.maxi').fadeIn(200);
	});
	
	$('.marg').mouseenter( function() {
		$('.marg').css("border","none");		
		$(this).css("border","2px solid blue");
	});


	var img_arr= $('#thumb img'); // Guardamos los objetos imagen del html
	var a_list=$('#thumb a'); //Guardamos los objetos anchor del html que contienen imágenes para poner añadirlas más fácilmente
	var indice,i,img_comp,j,lim_der,lim_izq; // Variables que se usaran más tarde
	if (img_arr.length<=4) { // En el caso de que hubiera menos de 5 imágenes
		$('#f_d').hide(); // Ocultamos las flechas, ya que no se necesitaran
		$('#f_i').hide();
		$('.fondo_slider').css({"padding-left":"10px","width":"550px","margin-left":"215px"}); //modificamos el tamaño del slidebar para ajustarlo un poco más
	} else {  // Si tiene 5 o más imágenes insertamos las condiciones iniciales;
		$('#thumb a').detach(); //Quitamos todos los elementos del div con id thumb
		$('#f_i').css("display","none"); // Ocultamos la flecha de la izquierda puesto que la foto mostrada sera la primera y no se puede ir para atrás
		$('#slidebar').css("padding-left","40px"); //añadimos un paddin para evitar que las imágenes se muevan cuando se quita la flecha
		for (i=0;i<4;i++) { //Añadimos los primeros cuatro elementos del array de anchors
			$(a_list[i]).appendTo('#thumb')
		}
		$("#imagen1 img").css("border","2px solid blue");
	}
		
	$('#f_d').click(function(){ //Función click de la flecha derecha
		img_comp=$('#thumb img:visible').first();// Buscamos el primer elemento visible, que va a ser el que va a desaparecer
		indice=img_arr.index(img_comp);// Hacemos una búsqueda para encontrar el indice que ocupa en la matriz de imágenes que va a coincidir con el de la matriz de anchor
		if (indice==(img_arr.length-5)) { // Si el primer visible esta en el indice 4 antes del final es la última vez que se debe pulsar la flecha derecha puesto que se mostraran las 4 últimas imágenes
			lim_der=true; // variable para el control de visibilidad de la flecha derecha
		}
		if($('#slidebar').not('#f_i:visible')) { //Comprobamos si la flecha izquierda está visible y si no está la colocamos visible
			$('#slidebar').css("padding-left","0px");
			$('#f_i').show();
			lim_izq=false;	// Actualizamos la variable de control de visibilidad de la flecha izquierda
		}
		$('#thumb a').detach(); //Eliminamos los elementos actuales del slidebar 
		for (j=indice;j<(indice+4);j++) { //y añadimos los 4 siguientes al elemento que era el primero visible cuando hicimos la búsqueda
			$(a_list[j+1]).appendTo('#thumb');
		}
		if(lim_der==true) { //En caso de que se haya llegado a el límite de la derecha se oculta la flecha
			$('#f_d').hide();
			$('#slidebar').css("padding-right","20px");
		}	
	});
	
	$('#f_i').click(function(){ //Función click de la flecha izquierda, su comportamiento es análogo al de la función anterior.
		img_comp=$('#thumb img:visible').last();
		indice=img_arr.index(img_comp);
		if (indice==4) {
			lim_izq=true;
		}
		if($('#slidebar').not('#f_d:visible')) {
			$('#slidebar').css("padding-right","0px");
			$('#f_d').show();
			lim_der=false;	
		}
		$('#thumb a').detach();
		for (j=(indice-4);j<(indice);j++) {
			$(a_list[j]).appendTo('#thumb');
		}
		if(lim_izq==true) {
			$('#f_i').hide();
			$('#slidebar').css("padding-left","40px");
		}	
	});
	

	
});
