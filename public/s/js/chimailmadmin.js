$(document).ready(function()
{
    $('#nav').droppy();

    if($('#email_address').length > 0) { 
      $('#email_address').val('bob');
    }
    
    if($('#domain_id').length > 0) {
      $.getJSON(app_prefix+'raw/json/cma-domain-list', function(data) {
          $.each(data, function(i,item){
              $('<option>').appendTo('#domain_id').text(item);
          });
      });
    }
    
});
