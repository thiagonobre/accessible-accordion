do ($ = jQuery) ->

    $ () ->
        _questionNumber = 1;

        $ '.accessibleAccordion > li'
            .each (i, e) ->
                _a = $ '<a/>'
                _li = $ e
                _isAnswer = _li.is '.answer'
                _accessibleText = _li.data('accessibleText') || _li.text()

                if _accessibleText?
                    _answerOrQuestion = if _isAnswer then "Resposta da pergunta #{_questionNumber++}: " else "Pergunta #{_questionNumber}: "
                    _attrs = 
                        href: '#'
                        onclick: 'return false'
                        title: "#{_answerOrQuestion}#{_accessibleText}"
                        class: 'accessibleLink'
                    
                    _a.attr _attrs
                    _a.html '&nbsp;'

                    _li.on 'click', () ->
                        do _li.next('.answer').toggle

                    _a.on 'focus', () ->
                        _li.addClass 'focused'
                        do _li.next('.answer').show

                    _a.on 'blur', () ->
                        _li.removeClass 'focused'

                    _li.prepend _a
            .filter '.answer'
            .hide()