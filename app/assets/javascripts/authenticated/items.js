$(document).ready(function() {

    // $('#items th.header').on('mouseover', function(event) {
    //     $(this).('th.header').animate({'margin-top': '-10px'}, 350);
    //     event.preventDefault();
    //     event.stopPropagation();
    // });

    // $("tr[data-link]").click(function() {
    //     window.location = this.dataset.link
    // });

    $("#items").tablesorter({widthFixed: true, widgets: ['zebra']}) 
    .tablesorterPager({container: $("#pager")}); 

    $('a#new-item-container').click(function(event){
        $('#new-item').fadeToggle();
        event.preventDefault();
        event.stopPropagation();
    });

//  abbr[title] was "required", but we need it to be "Required"
    function capitaliseFirstLetter(string){
        return string.charAt(0).toUpperCase() + string.slice(1);
    }

    $('.simple_form .required abbr').attr('title', capitaliseFirstLetter($('.simple_form .required abbr').attr('title')));

    $('.simple_form .required abbr').hover(
        function(){
        $(this).append($("<span>This field shouldn't be blank</span>"));
    }, function() {
        $(this).find("span:last").remove();
    });
});
