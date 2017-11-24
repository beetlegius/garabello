@sortSetup = ->

  # Helper para que no colapsen las filas de la tabla al arrastrarlas.
  fixHelper = (e, ui) ->
    ui.children().each ->
      $(this).width $(this).width()
    return ui

  updateSortable = (e, ui) ->
    Rails.ajax
      url: $(e.target).data("reorder")
      type: "PATCH"
      data: $(e.target).sortable('serialize', attribute: 'data-id')

  sortable = $("table.sortable tbody").sortable
    dropOnEmpty: false
    handle: '.handle'
    helper: fixHelper
    opacity: 0.4
    scroll: true
    update: updateSortable
  sortable.disableSelection()
