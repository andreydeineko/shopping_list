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

      container.on 'keyup', liveElements.itemNameInput, $.api.utils.toggleSubmit
      container.on 'click', liveElements.plusSignLabel, ->
        $(this).parents('div.new-item-container').find('form').find('input#item_name').focus()

        # Create
      container.on 'ajax:complete', liveElements.itemForm, (event, xhr, status) ->
        response = $.parseJSON(xhr.responseText)

        if ( status == 'success' )
          $this = $(this).trigger('reset')
          $this.parents('div.item-body').find('div.items ul.shopping-list').prepend(response.entry)
        else
          $.api.utils.assignErrorsFor('item', response.errors, $(this))

      container.on 'ajax:beforeSend', liveElements.itemForm, $.api.utils.resetForm

