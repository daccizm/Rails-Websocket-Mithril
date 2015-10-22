RailsChat.Api =
  csrfToken: (xhr) ->
    xhr.setRequestHeader("X-CSRF-Token", document.getElementsByName("csrf-token")[0].content)
  apiAsync: (time=10) ->
    deferred = m.deferred()
    setTimeout ->
      deferred.resolve()
    , time
    deferred.promise
