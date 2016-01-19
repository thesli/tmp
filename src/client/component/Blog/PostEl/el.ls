require!{
  'react': React
  '../../../util/CustomComponent': {CustomComponent}
}

export ContentScrollView = new CustomComponent ->
  @r = ->
    @div {}, @props.children

export PostEl = new CustomComponent ->
  @r = ->
    @div {},
      ContentScrollView~el {}, @props.children
