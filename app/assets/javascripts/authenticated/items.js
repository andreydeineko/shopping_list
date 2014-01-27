$(document).ready(function() {
    // $('a#items-container').click(function(){
    //     $('#items').slideToggle('fast');
    //     event.preventDefault();
    //     event.stopPropagation();
    // });
    $("#items").tablesorter(); 

    $('a#new-item-container').click(function(event){
        $('#new-item').slideToggle('fast');
        event.preventDefault();
        event.stopPropagation();

    });
});
