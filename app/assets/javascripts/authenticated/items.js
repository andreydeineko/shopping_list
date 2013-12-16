var callbacks, elements;

elements = {
    itemsContainer: $('#a-items-container'),
    newItemToggler: $('div#new-item')
};

callbacks = {
    toggleItemsContainer: function(event) {
        event.preventDefault();
        return elements.itemsContainer.slideToggle('fast');
    },

    toggleNewItemToggler: function(event) {
        event.preventDefault();
        return elements.newItemToggler.slideToggle('fast');
    }
};
