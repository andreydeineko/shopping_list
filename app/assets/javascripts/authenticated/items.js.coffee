$.api.authenticatedItems =
  init: ->

    elements =
      itemsContainer:   $('div#items')
      newItemToggler:   $('a#new-item-toggler')
      newItemContainer: $('div#new-item')
      newItemForm:      $('form#new-item')

    liveElements =
      editItem:      'a.edit-item-name'
      destroyItem:   'a.destroy-item'
      plusSignLabel: 'i.new-item-label'
      itemNameInput: 'input#item_name'
      itemForm:      'form.new-item'


    callbacks =

      toggleNewItemContainer: (event) ->
        event.preventDefault()
        elements.newItemContainer.slideToggle('fast')

      createItem: (event, xhr, status) ->
        response = $.parseJSON(xhr.responseText)

        if ( status == 'success' )
          elements.itemsContainer.prepend(response.entry)
          elements.newItemContainer.slideToggle 'fast'
          $(this).trigger('reset')
        else
          $.api.utils.assignErrorsFor('item', response.errors, $(this))

      resetItemForm: ->
        $this = $(this)

        $this.find('.error').removeClass('error')
        $this.find('.help-block, .help-inline').remove()

    liveCallbacks =

      destroyItem: ->
        $(this).parents('div.item').remove()

      editItem: (event) ->
        event.stopPropagation()
        event.preventDefault()

        itemId = @id.replace('edit-item-name-', '')
        $("span#item-#{itemId}").editable('toggle')



       # Bindings

    elements.newItemToggler.bind 'click', callbacks.toggleNewItemContainer
    elements.newItemForm.
      bind('ajax:complete',   callbacks.createItem).
      bind('ajax:beforeSend', callbacks.resetItemForm)

        # Validations
    elements.newItemForm.
      find('input#item_name').bind 'keyup', $.api.utils.toggleSubmit

       # Live bindings

        # Destroy
    elements.itemsContainer.on 'ajax:beforeSend', liveElements.destroyItem, -> $(this).addClass('disabled')
    elements.itemsContainer.on 'ajax:complete', liveElements.destroyItem, liveCallbacks.destroyItem

        # Edit
    elements.itemsContainer.on 'click', liveElements.editItem, liveCallbacks.editItem
    elements.on 'mouseover', 'li.item-item', ->
      $(this).find('div.item-options').show()
    elements.on 'mouseout', 'li.item-item', ->
      $(this).find('div.item-options').hide()


