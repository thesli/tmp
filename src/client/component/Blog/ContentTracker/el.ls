require!{
  'react': {Children,cloneElement,createFactory,PropTypes: pt}:React
  '../../../util/CustomComponent': {CustomComponent}
}

export ContentTracker = new CustomComponent ->
  @dn = 'ContentTracker'
  @pt = {
    schemas: pt.object
    updateCurrentSection: pt.func
  }
  @r$Tracker = ->
    @ul do
      className: 'tracks'
      Object.keys(@props.schemas).map (k,i) ~>
        @li do
          key: i
          onClick: @props.updateCurrentSection.bind(null, k)
          k
  @r = ->
    [{},{},{$Tracker}] = [@state,@props,@$el!]
    @div do
      className: 'ContentTracker'
      @pre do
        className: 'json'
      $Tracker!
