// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require turbolinks
//= require_tree .
//= require jquery3
//= require popper
//= require bootstrap-sprockets

// $(document).ready(function(){
//   $('#delete').submit(function(x){
//     x.preventDefault();
//     $.ajax({
//       url: '/urls',
//       method: 'POST',
//       data: $(this).serialize(),
//       dataType: 'json',
//       success: function(data){

//         if (data.success){
//          console.log(data);
//           $('#table').append('\
//             <tr>\
//             <td class="center">' + data.message.id + '</td>\
//             <td class="padleft">' + data.message.ori_url + '</td>\
//             <td class="center underline"><a class="green" href="/' + data.message.short_url + '"target="_blank"> http://bitchly.' + data.message.short_url + '</td>\
//             <td class="center">' + data.message.click_count + '</td>\
//             </tr>\
//             ')
//         }
//       }
//     });
//   });



// $(function() {
//     $('[data-validate]').blur(function() {
//         $this = $(this);
//         $.get($this.data('validate'), {
//             user: $this.val()
//         }).success(function() {
//             $this.removeClass('field_with_errors');
//         }).error(function() {
//             $this.addClass('field_with_errors');
//         });
//     });
// });

// $('.delete_order').bind('ajax:success', function() {
//    $(this).closest('tr').fadeOut();
// });

$(document).ready(function(){
    $('.destroy').on('click', function(event){
        console.log(this.parentElement.id)
        let target = $(event.currentTarget)
        $.ajax({
            url: '/orders/' + this.parentElement.id,
            type: 'DELETE',
            headers: {
              'X-Transaction': 'POST Example',
              'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
            },
            success: function(r){
            	target.closest('tr').fadeOut(1000, 
            	    function(){ 
            	        // alert($(this).text());
            	        target.parents('tr:first').remove();                    
            	    });    

            	return false;

            }
        });
    });
});