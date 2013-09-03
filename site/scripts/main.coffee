$ ->
        $("div.footdef").each ->
                id = $("a.footnum", $(this)).
                        attr('id').replace(".", "-")
                options =
                        autoOpen: false
                        width: 600
                        resizable: true
                        title: "Hint" 
                $(this).attr('id', id).dialog(options)
        
        $("a.footref").each ->
                id = $(this).attr('href').replace(".", "-")
                $(this).click ->
                        $(id).dialog("open")
