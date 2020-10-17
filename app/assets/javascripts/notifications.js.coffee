class Notifications
    constructor: ->
        @notifications = $("[data-behavior='notifications']")
        console.log(@notifications.length)
        
        if @notifications.length >0
           $("#1").on "click", @handleClick
           
           setInterval (=>
            @getNewNotifications()
           ),5000



    getNewNotifications: ->    
       $.ajax(
           url: "/notifications.json"
           dataType: "JSON"
           method: "GET"
           success: @handleSuccess
        )

    handleClick: (e) =>
       $.ajax(
           url: "/notifications/mark_as_read"
           dataType: "JSON"
           method: "POST"
           success: ->
              $("[data-behavior= 'unread-count']").text(0)
       )



    handleSuccess: (data) =>
       console.log(data)
       items = $.map data, (notification) ->
          notification.template


       unread_count = 0
       $.each data, (i, notification) ->
          if notification.unread
           unread_count += 1

       console.log(items);
       console.log(unread_count);
       $("[data-behavior='unread-count']").text(unread_count)
       @elementi = $("[data-behavior='notifications-items']")
       @elementi.html(items)


  






jQuery ->
  new Notifications
