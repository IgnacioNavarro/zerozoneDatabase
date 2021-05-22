$(document).ready(function(){

function filterRows() {
    var from = $('#oldest').val();
    var to = $('#newest').val();
  
    if (!from && !to) {
      return;
    }
  
    from = from || '1970-01-01';
    to = to || '2999-12-31';
  
    var dateFrom = moment(from);
    var dateTo = moment(to);
  
    $('#tablaSocial tr').each(function(i, tr) {
      var val = $(tr).find("td:nth-child(2)").text();
      var dateVal = moment(val, "DD/MM/YYYY");
      var visible = (dateVal.isBetween(dateFrom, dateTo, null, [])) ? "" : "none";
      $(tr).css('display', visible);
    });
  }
  
  $('#oldest').on("change", filterRows);
  $('#newest').on("change", filterRows);

  function filterRRSS() {
    var from = $('#date').val();
    var to = $('#newest').val();
  
    if (!from && !to) {
      return;
    }
  
    from = from || '1970-01-01';
    to = to || '2999-12-31';
  
    var dateFrom = moment(from);
    var dateTo = moment(to);
  
    $('#tablaSocial tr').each(function(i, tr) {
      var val = $(tr).find("td:nth-child(3)").text();
      var dateVal = moment(val, "DD/MM/YYYY");
      var visible = (dateVal.isBetween(dateFrom, dateTo, null, [])) ? "" : "none";
      $(tr).css('display', visible);
    });
  }
  
  $('#date').on("change", filterRRSS);
  $('#newest').on("change", filterRRSS);
});