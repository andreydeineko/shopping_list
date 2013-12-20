
$('#items').hide();
$('a#items-container').click(function(){
    $('#items').slideToggle('fast', function(){
    });
    event.preventDefault();
    event.stopPropagation();
});


$('#new-item').hide();
$('a#new-item-container').click(function(){
    $('#new-item').slideToggle('fast', function(){
    });
    event.preventDefault();
    event.stopPropagation();
});
