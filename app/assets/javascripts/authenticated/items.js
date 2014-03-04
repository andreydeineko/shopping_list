$(document).ready(function() {

    $("#items")
        .tablesorter({widthFixed: true, widgets: ['zebra', 'saveSort', 'savePagerSize']}) 
        .tablesorterPager({container: $("#pager"), savePages: true }); 

//  function to save table's sorted state 
    $('button').click(function(event){
        $('#items')
            .trigger('saveSortReset') // clear saved sort
            .trigger('sortReset');    // reset current table sort
        return true;
    });


    $('a#new-item-container').click(function(event){
        $('#new-item').fadeToggle();
        event.preventDefault();
        event.stopPropagation();
    });

//  abbr[title] was "required", but we need it to be "Required"

    // function capitaliseFirstLetter(string)
    //     {
    //     return string.charAt(0).toUpperCase() + string.slice(1);
    //     }
    // $('.simple_form .required abbr').attr('title', capitaliseFirstLetter($('.simple_form .required abbr').attr('title')));

    // $('.simple_form .required abbr').hover(
    //     function(){
    //         $(this).append($("<span>This field shouldn't be blank</span>"));
    // },  function() {
    //         $(this).find("span:last").remove();
    // });


    $('a.new-comment-container').click(function(event){
        $(this).next('.comment-reply').slideToggle();
        event.preventDefault();
        event.stopPropagation();
    });

    $('.best_in_place').best_in_place(); // in place editing

});
