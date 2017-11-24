#= require jquery
#= require jquery-ui
#= require bootstrap
#= require rails-ujs
#= require datatables
#= require admin/app
#= require admin/dataTables.bootstrap
#= require admin/plugins/icheck
#= require jquery-fileupload
#= require turbolinks
#  require bootstrap-wysihtml5
#  require bootstrap-wysihtml5/locales/es-AR
#= require admin/sortable

$(document).on 'turbolinks:load', ->

  $("a[href='" + window.location.pathname + "']").not("[data-method='post']").not("[data-method='delete']").parents('li').addClass('active')

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
