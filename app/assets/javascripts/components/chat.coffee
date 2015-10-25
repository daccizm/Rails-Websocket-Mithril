class RailsChat.Components.Chat
  controller: (data) ->
    vm: RailsChat.ViewModels.Chat.init()
  view: (ctrl) ->
    [
      m.component(new RailsChat.Components.ChatIndex(), {vm: ctrl.vm})
      m.component(new RailsChat.Components.ChatPreview(), {vm: ctrl.vm})
      m.component(new RailsChat.Components.ChatForm(), {vm: ctrl.vm})
    ]

class RailsChat.Components.ChatIndex
  view: (ctrl, args) ->
    m "div",
      m "ul", {style: "padding-left: 0;"}, args.vm.list().map (data)->
        [
          m.component(new RailsChat.Components.ChatShow(), {message: data.message()})
        ]

class RailsChat.Components.ChatShow
  view: (ctrl, args) ->
    m "li", {style: "list-style:none;"},
      m ".balloon-message",
        m "div", m.trust(marked(args.message))

class RailsChat.Components.ChatPreview
  view: (ctrl, args) ->
    m ".balloon-message .preview",
      m "div", m.trust(marked(args.vm.newComment.message() || "Please write here ..."))

class RailsChat.Components.ChatForm
  view: (ctrl, args) ->
    m "div", [
      m "textarea.form-control",
        onkeydown: m.withAttr("value", args.vm.newComment.message)
        onchange: m.withAttr("value", args.vm.newComment.message)
        value: args.vm.newComment.message()
      m "a.btn.btn-lg.btn-empty", {
          href: "javascript:void(0)"
          onclick: ->
            args.vm.newComment.save()
        },
        "コメント"
    ]
