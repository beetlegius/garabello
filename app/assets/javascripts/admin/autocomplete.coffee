@autoComplete = (e, parent) ->
  $('[data-behavior="autocomplete"]', parent).each (i, elem) ->
    $(elem).select2
      # placeholder: 'Buscá un NUM...'
      minimumInputLength: 1
      ajax:
        dataType: 'json'
        delay: 250
        cache: true
      escapeMarkup: (markup) ->
        return markup
      templateResult: (result) ->
        return result.element || result.text
      templateSelection: (result, a,b,c) ->
        return result.text || 'Buscá un NUM...'

    $(elem).on 'select2:select', (e) ->
      $(e.target).parents('td').next().find('input, select, textarea').filter(':enabled:visible:first').focus().select()

    $(elem).next('.select2').find('.select2-selection').on 'focus', (e) ->
      $(e.target).closest('.select2').prev('select').select2('open')


$(document).on 'turbolinks:load', @autoComplete
