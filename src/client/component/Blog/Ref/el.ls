require!{
  '../../../util/CustomComponent.ls': {CustomComponent}
}


export Ref = new CustomComponent ->
  @r = ->
    @span {}, 'something'
