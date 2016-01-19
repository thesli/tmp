require!{
  'react': {createFactory}:React
  '../../../util/CustomComponent': {CustomComponent}
}

pt = React.PropTypes

$path = document?createElementNS 'http://www.w3.org/2000/svg','path'

export CaligraphTextView = new CustomComponent ->
  @gis = ->
    if document?
      # $svg = document.createElementNS('http://www.w3.org/2000/svg','svg')
      pathsTotalLength: @props.paths.map (path,i) ->
        $path.setAttribute 'd', path
        $path.getTotalLength!
    else
      {}
  @pt = {
    ltime: pt.number
    rtime: pt.number
    paths: pt.any
    # svgPaths: pt.array(pt.string)
    ctime: pt.number
  }

  @lc = {
    cwrp: (prevProps) ->
      console.log prevProps, @props
      console.log 'will receive props'
      @setState do
        (s) ~>
          {
            ...s
            pathsTotalLength: @props.paths.map (path,i) ->
              $path.setAttribute 'd', path
              $path.getTotalLength!
          }
        ~>
          @refs['svg'].querySelector('path').setAttribute('strokeDashoffset',0)
    cwu: (np,ns) ->
    cdm: ->
    cdum: ->
      console.log 'did unmount'

  }

  @r = ->
    {pathsTotalLength} = @state
    # console.log @props.paths
    # console.log @state.pathsTotalLength
    {ltime, rtime, ctime, paths} = @props

    deltaT = rtime - ltime
    numChar = paths.length
    @svg do
      ref: 'svg'
      style:
        fill: 'none'
        stroke: 'white'
        width: '100%'
        transitionDuration: "#{deltaT / 2}s"

      # debugger
      paths?map (d, i) ~>
        tl = pathsTotalLength[i]
        @path do
          key: i
          strokeDasharray: tl
          style:
            # transitionDelay: (deltaT * i / numChar - 0.1) + "s"
            # strokeDashoffset: tl * 0.5
            # strokeDashoffset: tl * ((rtime - ctime) / deltaT)
            strokeDashoffset: tl
          d: d.join ''
      @text do
        x: 10
        y: 50
        @state.percent
      ...
