$.api.items =
    init: ->
        container = $('div#items')

         elements =
            itemsContainer:   $('div#items')
            newItemToggler:   $('a#new-item-toggler')
            newItemContainer: $('div#new-item')
            newItemForm:      $('form#new-item')

        liveElements =
            plusSignLabel: 'i.new-item-label'
            taskNameInput: 'input#item_name'
            taskForm:      'form.new-item'
            deleteItems:   'a.delete-selected-items'
            editItems:      'a.edit-item-name'


        callbacks =

            toggleNewItemContainer: (event) ->
                event.preventDefault()
                elements.newItemContainer.slideToggle('fast')

            resetItemForm: ->
                $this = $(this)

                $this.find('.error').removeClass('error')
                $this.find('.help-block, .help-inline').remove()


            editItem: (event) ->
                event.stopPropagation()
                event.preventDefault()

                itemId = @id.replace('edit-item-name-', '')
                $("span#item-#{itemId}").editable('toggle')

        # Bindings

        container.on 'keyup', liveElements.itemNameInput, $.api.utils.toggleSubmit
        container.on 'click', liveElements.plusSignLabel, ->
            $(this).parents('div.new-item-container').
                find('form').
                find('input#item_name').focus()

        # Create
        container.on 'ajax:complete', liveElements.itemForm, (event, xhr, status) ->
            response = $.parseJSON(xhr.responseText)

            if ( status == 'success' )
                $this = $(this).trigger('reset')
                $this.parents('div.item-body').find('div.items ul.shopping-list').prepend(response.entry)
            else
                $.api.utils.assignErrorsFor('item', response.errors, $(this))

        container.on 'ajax:beforeSend', liveElements.itemForm, $.api.utils.resetForm

        # Destroy
        container.on 'click', liveElements.deleteItems, (event) ->
            event.preventDefault()
            return false if $(this).parents('form').find('input[type="checkbox"]:checked').length == 0

            $(this).parents('form').submit() if confirm('Are you sure?')

        container.on 'ajax:complete', 'form.bulk-destroy-items', ->
            for input in $(this).find('input[type="checkbox"]:checked')
                $(input).parents('li').remove()
