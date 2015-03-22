$(document).ready ->
  $editButton = $('.edit-button')
  $backButton = $('.back-button')

  $post = $('.post-main')
  $edit = $('.post-edit')

  $text = $('.post_text')

  $text.readmore({
    collapsedHeight: 210
  })

  $editButton.on 'click', (e) ->
    e.preventDefault()
    $(@).offsetParent().find($post).slideToggle()
    $(@).offsetParent().find($edit).slideToggle()

  $backButton.on 'click', (e) ->
    e.preventDefault()
    $(@).offsetParent().find($post).slideToggle()
    $(@).offsetParent().find($edit).slideToggle()
