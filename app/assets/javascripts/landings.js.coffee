# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'ajax:success', 'a.like-btn', (status,data,xhr)->
  data_id = "like-news-item-#{data.id}"
  # toggle links
  $("a.like-btn[data-id=#{data_id}]").each ->
    $a = $(this)
    href = $a.attr 'href'
    icon = $a.data('icon')
    link_icon_html = $('<i/>', {
      class: "fa fa-"+$a.data('toggle-icon')
      })
    $a.html(link_icon_html)
    
    $a.attr 'href', $a.data('toggle-href')
    $a.data 'toggle-href', href
    
    $a.data 'icon', $a.data('toggle-icon')
    $a.data('toggle-icon', icon)
    
    return

  return