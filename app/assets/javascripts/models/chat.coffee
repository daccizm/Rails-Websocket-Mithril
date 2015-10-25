class RailsChat.Models.Chat
  constructor: (data = {}) ->
    @id = m.prop(data.id)
    @message = m.prop(data.message || "")
  save: ->
    m.request
      method: "POST"
      url: "/chats"
      config: RailsChat.Api.csrfToken
      data: @
      unwrapSuccess: (res) =>
        @message("")
  @list: ->
    m.request({method: "GET", url: "/chats", type: RailsChat.Models.Chat})

RailsChat.ViewModels.Chat =
  init: ->
    vm = {}
    vm.newComment = new RailsChat.Models.Chat()
    vm.list = RailsChat.Models.Chat.list().then (list) ->
      list
    vm.ws = new WebSocket("ws://localhost:3001")
    vm.ws.onopen = ->
    vm.ws.onerror = ->
    vm.ws.onmessage = (event) ->
      vm.list().push(new RailsChat.Models.Chat(JSON.parse(event.data)))
      m.endComputation()
    vm
