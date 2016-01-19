require!{
  'react': React
}

export CustomComponent = ->
  &0.bind(@)!

  # alias for the common methods
  do unalias = ~>
    baseMap = {
      'r': 'render'
      'pt': 'propTypes'
      'gis': 'getInitialState'
      'dn': 'displayName'
    }
    lcAlias = 'lc'
    lcMap = {
      'cwm': 'componentWillMount'
      'cdm': 'componentDidMount'
      'cwu': 'componentWillUpdate'
      'cdu': 'componentDidUpdate'
      'scu': 'shouldComponentUpdate'
      'cwrp': 'componentWillReceiveProps'
      'cwum': 'componentWillUnmount'
    }
    Object.keys(baseMap).forEach (k) ~>
      @[baseMap[k]] = delete @[k] if @[k]?
    if @[lcAlias]?
      Object.keys(lcMap).forEach (k) ~>
        @[lcMap[k]] = delete @[lcAlias][k] if @[lcAlias][k]?

  # provide @div/@h1.. DOM support for elements
  @ <<< React.DOM

  @$el = ->
    Object.keys(@)
    .filter (.[0 to 1].join('') == 'r$')
    .reduce do
      (ag,s) ~>
        ag <<< {"#{s[1 to -1] * ''}": @[s]}
      {}

  o = @ |> React.createClass
  # o::$el = ~>
  #   Object.keys(o::)
  #   .filter (.[0 to 1].join('') == 'r$')
  #   .reduce do
  #     (ag,s) ~>
  #       ag <<< {"#{s[1 to -1] * ''}": o::[s]}
  #     {}
  # console.log o::

  # apply middlewares and shortform for React.createFactory
  middleware = @middleware || -> &0
  o.el = -> (o |> middleware |> React.createFactory) ...
  o
