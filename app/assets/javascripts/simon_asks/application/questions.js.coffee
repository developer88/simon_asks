window.App ||= {}

App.prepareCommentsLinks = (context) ->
  context = ((if context is `undefined` then '' else context+' '))

  $(context + 'a[data-comment-show=toggle]').click (e) ->
    e.preventDefault()
    path = $(this).attr 'href'
    #console.log path
    $(path).toggle()


$ ->
  App.prepareCommentsLinks()