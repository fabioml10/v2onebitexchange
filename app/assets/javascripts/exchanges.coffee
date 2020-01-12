# $(document).ready ->
$(document).on 'turbolinks:load', ->

  if window.location.pathname == "/"
    $('body').addClass('back-currency')
    $('body').removeClass('back-cripto')

  $('.reverse-btn').click ->
    source = $("#source_currency").val()
    target = $("#target_currency").val()
    $("#source_currency").val(target)
    $("#target_currency").val(source)
    if hasAmount()
      sendForm()

  $('#amount').change ->
    if hasAmount()
      sendForm()

  $('#source_currency').change ->
    if hasAmount()
      sendForm()

  $('#target_currency').change ->
    if hasAmount()
      sendForm()

  #TODO: verificar se é necessário para os testes
  $('.btn-exchange').click ->
    if hasAmount()
      sendForm()

hasAmount = ->
  if $("#amount").val() > 0
    return true
  else
    return false

sendForm = ->
  if $('form').attr('action') == '/convert'
    console.log "send form"
    $('.loader').addClass('loading')
    $.ajax '/convert',
        type: 'GET'
        dataType: 'json'
        data: {
                source_currency: $("#source_currency").val(),
                target_currency: $("#target_currency").val(),
                amount: $("#amount").val()
              }
        error: (jqXHR, textStatus, errorThrown) ->
          alert textStatus
        success: (data, text, jqXHR) ->
          $('#result').val(data.value)
          $('.loader').removeClass('loading')
      return false;