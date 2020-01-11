# $(document).ready ->
$(document).on 'turbolinks:load', ->

  $('.reverse-btc-btn').click ->
    sourceHtml = $("#source_currency").html()
    targetHtml = $("#target_currency").html()
    sourceValue = $("#source_currency").val()
    targetValue = $("#target_currency").val()
    $("#source_currency").html(targetHtml)
    $("#target_currency").html(sourceHtml)
    $("#source_currency").val(targetValue)
    $("#target_currency").val(sourceValue)

  $('form').submit ->
    if $('form').attr('action') == '/convert_btc'
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
        return false;