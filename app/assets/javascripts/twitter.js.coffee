class @Twitter
    eventsBound = false
    @load: ->
        Twitter.loadTwitterSDK()
        Twitter.bindEvents() unless Twitter.eventsBound
    @bindEvents: ->
        if typeof Turbolinks isnt 'undefined' and Turbolinks.supported
            $(document).on('page:load', Twitter.renderTweetButtons)
        Twitter.eventsBound = true
    @renderTweetButtons: ->
        $('.twitter-share-button').each ->
            button = $(this)
            button.attr('data-url', document.location.href) unless button.data('url')?
            button.attr('data-text', document.title) unless button.data('text')?
        twttr.widgets.load()
    @loadTwitterSDK: ->
        $.getScript("//platform.twitter.com/widgets.js")
Twitter.load()