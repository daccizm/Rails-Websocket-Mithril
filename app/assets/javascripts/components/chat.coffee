class RailsChat.Components.Chat
  controller: (data) ->
    vm: RailsChat.ViewModels.Chat.init()
  view: (ctrl) ->
    [
      m.component(new RailsChat.Components.ChatIndex(), {vm: ctrl.vm})
      m.component(new RailsChat.Components.ChatShow(), {message: ctrl.vm.newComment.message() || "Please write here ..."})
      m.component(new RailsChat.Components.ChatForm(), {vm: ctrl.vm})
    ]

class RailsChat.Components.ChatIndex
  view: (ctrl, args) ->
    m "div",
      m "ul", args.vm.list().map (data)->
        [
          m.component(new RailsChat.Components.ChatShow(), {message: data.message()})
        ]

class RailsChat.Components.ChatShow
  view: (ctrl, args) ->
    m "li", {style: "list-style:none;"},
      m ".balloon-message",
        m "div", m.trust(marked(args.message))

class RailsChat.Components.ChatForm
  view: (ctrl, args) ->
    m "div", [
      m "textarea",
        onkeydown: m.withAttr("value", args.vm.newComment.message)
        value: args.vm.newComment.message()
      m "a", {
          href: "javascript:void(0)"
          onclick: ->
            args.vm.newComment.save()
        },
        "コメント"
    ]
