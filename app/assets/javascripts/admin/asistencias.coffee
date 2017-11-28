$(document).on 'turbolinks:load', ->

  $('[data-behavior="marcar-estado"]').on 'click', (e) ->
    e.preventDefault()
    valor = $(e.target).data('valor')
    $(e.target).parents(".panel").find("[data-behavior='estado']").val(valor).trigger('change')

  $('[data-behavior="estado"]').on 'change', (e) ->
    parent = $(e.target).parents('tr')
    $(parent).removeClass('success warning danger')

    switch $(e.target).val()
      when "presente"          then $(parent).addClass("success")
      when "ausente"           then $(parent).addClass("warning")
      when "ausente_sin_aviso" then $(parent).addClass("danger")

  $('[data-behavior="estado"]').trigger('change')
