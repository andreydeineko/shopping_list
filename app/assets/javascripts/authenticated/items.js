$(document).ready(function() {

    // $('#items th.header').on('mouseover', function(event) {
    //     $(this).('th.header').animate({'margin-top': '-10px'}, 350);
    //     event.preventDefault();
    //     event.stopPropagation();
    // });

    // $("tr[data-link]").click(function() {
    //     window.location = this.dataset.link
    // });

    $("#items").tablesorter(); 

    $('a#new-item-container').click(function(event){
        $('#new-item').fadeToggle();
        event.preventDefault();
        event.stopPropagation();
    });

});
