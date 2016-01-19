require!{
  'react': React
  'react-tween-state': {Mixin}
  '../../util/CustomComponent': {CustomComponent}
  'opentype.js': opentype
}

window.Cache = {}
strs = [
  "This thing is really complicated"
  "test 001"
  "test 002"
  "some random thing"
]
opentype.load '/asset/Ubuntu-L.ttf', (err,Font) ->

  strs.forEach (s) ->
    lineNumberMap = Font.stringToGlyphs(s)
    .map (.path.commands)
    .map (el) -> el.filter((.type == 'M')).length
    t = Font.getPath(s,0,35,35).toPathData!
    |> (/ "M")
    |> (.[1 to -1])
    |> (.map -> "M" + &0)
    out = lineNumberMap.map (n) -> t.splice 0, n
    Cache[s] = out

pt = React.PropTypes
$path = document.createElementNS('http://www.w3.org/2000/svg','path')

export SvgAnimatedText = new CustomComponent ->
  @mixins = [Mixin]
  @pt = {
    str: pt.string
    delta: pt.number
  }
  @handleNewProps = ->
    # console.log 'handleNewProps'
    {str} = @props
    target = Cache[str]
    svgLengths = target.map (el) ->
      $path.setAttribute 'd', el.join(' ')
      $path.getTotalLength!
    items = [0 to target.length].reduce ( (ag,s) -> ag <<< "item#{s}": svgLengths[s] ), {}
    @setState (<<< {svgLengths,target, ...items}), ~>
      # @state.target
      [0 to @state.target.length].forEach do
        (s) ~>
          @tweenState "item#{s}", do
            delay: s * (@props.delta / @state.target.length / 2)
            duration: @props.delta / 2
            # beginValue: @state.svgLengths[s]
            endValue: 0
        {}


  @gis = ->
    {}

  @lc = {
    cwm: ->
      @handleNewProps!
    cwrp: (np) ->
      @handleNewProps!
  }

  @r$textView = ->
    @svg do
      style:
        fill: 'none'
        stroke: 'white'
      @state.target.map (ds, i) ~>
        @path do
          key: i
          strokeDasharray: @state.svgLengths[i]
          style:
            strokeDashoffset: @getTweeningValue("item#{i}")
          d: ds.join ''
      ...

  @r = ->
    [{},{},{$slider,$textView}] = [@state,@props,@$el!]
    @div do
      style:
        width: '100%'
      # 'something'
      $textView!
      ...




log = -> console.log &0;&0
export TextScrollViewPage = new CustomComponent ->
  @mixins = [Mixin]
  @gis = ->
    str = 'test 001'
    # console.log Cache["test 001"]
    target = Cache[str]
    items = [0 to target.length].reduce ( (ag,s) -> ag <<< "item#{s}": 0 ), {}
    $path = document.createElementNS('http://www.w3.org/2000/svg','path')
    svgLengths = target.map (el) ->
      $path.setAttribute 'd', el.join(' ')
      $path.getTotalLength!

    {target,...items,svgLengths}
  @lc = {
    cdu: ->
      # console.log @state
    cwm: ->

    cdm: ->
      setInterval ~>
        @forceUpdate!
      ,3000
      # [0 to @state.target.length].forEach do
      #   (s) ~>
      #     @tweenState "item#{s}", do
      #       delay: s * (3000 / @state.target.length / 2)
      #       duration: 3000
      #       beginValue: @state.svgLengths[s]
      #       endValue: 0
      #   {}
  }

  @r$slider = ->
    @input do
      type: 'range'
      step: '0.5'
      min: 0
      max: 100
      style:
        width: '100%'
      value: @state.timer
      onChange: ({{value}:target}) ~>
        @setState (<<< timer: value)

  @r$textView = ->
    @svg do
      style:
        fill: 'none'
        stroke: 'white'
      @state.target.map (ds, i) ~>
        @path do
          key: i
          strokeDasharray: @state.svgLengths[i]
          style:
            strokeDashoffset: @getTweeningValue("item#{i}")
          d: ds.join ''
      ...

  @r = ->
    [{},{},{$slider,$textView}] = [@state,@props,@$el!]
    @div do
      style:
        width: '100%'
      SvgAnimatedText~el do
        str: strs[Math.random! * 4 |> Math.floor]
        delta: 3000
      SvgAnimatedText~el do
        str: strs[Math.random! * 4 |> Math.floor]
        delta: 3000
      ...
