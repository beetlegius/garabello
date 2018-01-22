#= require jquery
#= require jquery-ui
#= require moment
#= require moment/locale/es
#= require bootstrap
#= require bootstrap-daterangepicker
#= require select2
#= require datatables
#= require admin/app
#= require admin/dataTables.bootstrap
#= require admin/plugins/icheck
#= require jquery-fileupload
#= require turbolinks
#= require cocoon
#= require admin/sortable
#= require admin/asistencias
#= require admin/autocomplete
#= require rails-ujs
#= require highcharts
#= require chartkick
#= require jquery-knob
#= require autosize

$(document).on 'turbolinks:load', ->

  $("a[href='" + window.location.pathname + "']").not("[data-method='post']").not("[data-method='delete']").parents('li').addClass('active')

  $("a[data-toggle='tab']").on 'shown.bs.tab', (e) ->
    setTimeout ->
      hash = e.target.href.split("#")[1]
      $('#' + hash).find('input,select,textarea').filter(':enabled:visible:first').focus()
    , 100

  tab = window.location.hash
  if (tab)
    link = $("a[href='" + tab + "']")
    if link.length
      resultado = link.tab("show")
    else
      $('.content ul.nav li:first-child a[data-toggle="tab"]').tab("show")
  else if !$('.content ul.nav li.active').length
    $('.content ul.nav li:first-child a[data-toggle="tab"]').tab("show")


  # <%= @programa.new_record? ? :disabled : :active %>

  $("table[role='datatable']").each ->
    $(this).DataTable
      ajax: $(this).data('url')
      serverSide: $(this).data('server-side')
      language:
        url: "//cdn.datatables.net/plug-ins/1.10.15/i18n/Spanish.json"
      createdRow: (row, data, dataIndex) ->
        $(row).attr('data-id', "elements_" + data[0])
      drawCallback: sortSetup

    $(this).css("width", "100%")

  # window['rangy'].initialized = false
  # $.each $("[data-behavior='wysihtml5']"), (i, el) ->
  #   $(el).wysihtml5
  #     locale: 'es-AR'
  #     toolbar:
  #       html: true

  $('input').iCheck
    checkboxClass: 'icheckbox_square-blue'
    radioClass: 'iradio_square-blue'

  # Initialize the jQuery File Upload widget:
  $('#fileupload').fileupload
    progressall: (e, data) ->
      progress = parseInt(data.loaded / data.total * 100, 10)
      $('#progress-all .bar').css('width', progress + '%')

  if $('#fileupload').length
    # Load existing files:
    $.getJSON $('#fileupload').prop('action'), (files) ->
      fu = $('#fileupload').data('blueimpFileupload')
      fu._adjustMaxNumberOfFiles(-files.length)
      template = fu._renderDownload(files).appendTo($('#fileupload .files'))
      # Force reflow:
      fu._reflow = fu._transition && template.length && template[0].offsetWidth
      template.addClass('in')
      $('#loading').remove()

  sortSetup()

  $("[data-behavior='daterangepicker']").daterangepicker()

  $.map $("table.table td"), (elem) ->
    $(elem).addClass('text-muted') if $(elem).text() == '0'

  $('[data-behavior="select2"]').select2()

  $('[data-behavior="cocoon"]').on 'cocoon:before-insert', (e, insertedItem) ->
    $(e.target).find("tr.empty-row").remove()
  $('[data-behavior="cocoon"]').on 'cocoon:after-insert', (e, insertedItem) ->
    $(insertedItem).find('[data-behavior="select2"]').select2()
    autosize $('[data-behavior="autosize"]')

  # $('[data-behavior="autosubmit"]').find("input, select").on 'change', (e) ->
  #   $(this).parents("form").submit()

  $('[rel="popover"]').popover()
  $('[rel="tooltip"]').tooltip()

  $("#table-items").on 'cocoon:after-insert', (e, insertedItem) ->
    autoComplete(e, insertedItem)
    $(insertedItem).find('input:visible:first').focus().select()

  $('[data-behavior="indicator"]').knob
    thickness: 0.25
    width: 150
    height: 150
    readOnly: true
    format: (value) ->
      return value + "%"

  autosize $('[data-behavior="autosize"]')
