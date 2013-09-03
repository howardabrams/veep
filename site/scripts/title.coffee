$ ->
        $("#chapters li a").button()

        $("button.button").button().click ->
                url = $(this).data("url")

                dialog = $('<div style="display:none" class="loading"></div>').appendTo('body')
                # open the dialog
                dialog.dialog({
                        # add a close listener to prevent adding
                        # multiple divs to the document
                        resizable: true,
                        minWidth: 600,
                        width: "80%",
                        modal: true,
                        close: (event, ui) ->
                            # remove div with all data and events
                            dialog.remove()
                })

                dialog.load( url, (contents) ->
                        title = $(contents).find("h1").text()
                        dialog.dialog("option", {
                                "title", title,
                                "position", "center center"
                        })
                        dialog.removeClass('loading')
                )
                false

        $("#stars").
                width( window.innerWidth ).
                height( window.innerHeight )
        $("#planets").
                width( window.innerWidth ).
                height( window.innerHeight )

        ctx = $('#stars').get(0).getContext('2d')
        ctx.fillStyle = "#ffffff"

        for s in [1 .. 100]
                x = Math.random() * 800
                y = Math.random() * 800
                size = Math.random() * 3
                colorR = Math.random() * 30 + 225
                colorG = Math.random() * 30 + 225
                colorB = Math.random() * 30 + 225

                $("#stars").drawEllipse({
                      fillStyle: "rgb(" + colorR + "," + colorG + "," + colorB +")",
                      x: Math.round(x), y: Math.round(y),
                      width: size, height: size
                })
