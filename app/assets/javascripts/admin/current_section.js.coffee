$(document).on 'ready', ->

  $url = location.pathname.split('/')[2]
  $pagesList = $('ul#js-pages-list li')

  $pagesList.each (index, el) =>
    if $(el).data('page') ==  $url
      $(el).addClass('active')



