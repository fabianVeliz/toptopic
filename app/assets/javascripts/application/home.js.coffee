$(document).on 'ready', ->

	swiper = new Swiper('.swiper-container', {
		autoplay: 4000,
		loop: true,
		onSlideChangeEnd: ->
			$('.full-gb').stop().fadeOut(1000);
			$('.full-gb').eq(swiper.activeIndex).stop().fadeIn(2000);

			$('.slider-title').stop().hide();
			$('.slider-title').eq(swiper.activeIndex).stop().slideDown(1000);

			});

	$('.full-gb').eq(swiper.activeIndex).stop().fadeIn(4000);
	$('.slider-title').eq(swiper.activeIndex).stop().slideDown(1000);
