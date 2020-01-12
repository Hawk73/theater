$(document).ready(() ->
  $('[data-behaviour~=daterangepicker]').daterangepicker({
    locale: {
      format: 'YYYY.MM.DD',
      separator: ','
    }
  })
)
