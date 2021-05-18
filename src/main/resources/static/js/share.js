$('.share-alt').on('click', function(e){
	$(".branch").removeClass("no-animation");
	$('.branch').toggleClass("open");
});

$('.social').on('click', function(e){
	$(".container").removeClass("no-animation");
	$(".container").toggleClass("open");
});

$('.share').on('click', function(e){
	
	$(this).parent().children(".float-circle").removeClass("no-animation");
	// $(".float-circle").removeClass("no-animation");
	$(this).parent().children(".float-circle").toggleClass("open");
	
	// $(".float-circle").toggleClass("open");

});