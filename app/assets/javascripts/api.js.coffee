$.api =
  controller: null
  action: null

  utils:
    inlineError: (errorMessage) ->
	  "<span class='help-inline'>" + errorMessage + "</span>"
	blockError: (errorMessage) ->
      return "<span class='help-block'>" + errorMessage + "</span>"
    assignErrorsFor: (modelName, modelErrors, form) ->
      for own attribute, errors of modelErrors
        element = form.find("##{modelName}_#{attribute}")
        element.parents('div.control-group').addClass('error')

        for error in errors
          element.after $api.utils.blockError(error)

    toggleSumbit: (event) ->
      return false if event.which == 13 # do nothing if "return" was pressed
      $(this).parents('form').find('input[type="submit"]').prop('disabled', this.value.trim().length == 0)

    resetForm: ->
      $this = $(this)

      $this.find('.error').removeClass('error')
      $this.find('.help-block, .help-inline').remove()