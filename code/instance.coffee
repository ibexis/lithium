# Instance interface.

exports.Instance = class Instance
  # Create a server ready to run. Somewhere on the internet.
  # Servers are created in the "stopped" state.
  @create: ->

  # Destroy a previously created server.
  @destroy: (instance) ->

  # List instances in the cloud
  @list: ->

  # Start the server. Immediately go into the 'starting' state,
  # and if everything goes okay, then sometime later it will be
  # in the 'running' state.
  start: ->

  # Stop the server. Immediately go into the 'stopping' state,
  # and if everything goes okay, then sometime later it will be
  # in the 'stopped' state.
  stop: ->

  # Return the state of the server.  Will be one of:
  # 'stopped', 'running', 'starting', 'stopping', and probably
  # others.
  state: ->
