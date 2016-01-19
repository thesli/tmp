require!{
  'react-router'
}

createComponent = (fn) ->
  fn.bind(@).call!
  @
