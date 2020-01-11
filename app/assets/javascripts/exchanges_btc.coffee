# $(document).ready ->
$(document).on 'turbolinks:load', ->

  # console.log window.location.pathname
  if window.location.pathname != "/"
    $('body').addClass('back-cripto')
    $('body').removeClass('back-currency')

  $('.reverse-btc-btn').click ->
    sourceHtml = $("#source_currency").html()
    targetHtml = $("#target_currency").html()
    sourceValue = $("#source_currency").val()
    targetValue = $("#target_currency").val()
    $("#source_currency").html(targetHtml)
    $("#target_currency").html(sourceHtml)
    $("#source_currency").val(targetValue)
    $("#target_currency").val(sourceValue)
    if hasAmount()
      sendBtcForm()

  $('#amount').change ->
    if hasAmount()
      sendBtcForm()

  $('#source_currency').change ->
    if hasAmount()
      sendBtcForm()

  $('#target_currency').change ->
    if hasAmount()
      sendBtcForm()

  $('.btn-exchange-btc').click ->
    if hasAmount()
      sendBtcForm()

hasAmount = ->
  if $("#amount").val() > 0
    return true
  else
    return false

sendBtcForm = ->
  if $('form').attr('action') == '/convert_btc'
    console.log "send btc form"
    $('.loader').addClass('loading')
    $.ajax '/convert_btc',
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