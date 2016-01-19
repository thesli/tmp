require!{
  'react': React
  'react-tween-state': {Mixin,easingTypes}
  'web-animations-js/web-animations.min.js'
  '../../../util/CustomComponent': {CustomComponent}
}

pt = React.PropTypes
$path = document.createElementNS('http://www.w3.org/2000/svg','path')

# export SvgAnimatedText = new CustomComponent ->
#   @mixins = [Mixin]
#   @pt = {
#     str: pt.string
#     delta: pt.number
#   }
#   @handleNewProps = ->
#     console.log 'handleNewProps'
#     {str,delta} = @props
#     target = CaligraphTextViewCache[str]
#     svgLengths = target.map (el) ->
#       $path.setAttribute 'd', el.join(' ')
#       $path.getTotalLength!
#     items = [0 to target.length].reduce ( (ag,s) -> ag <<< "item#{s}": svgLengths[s] ), {}
#     @setState (<<< {svgLengths,target, ...items}), ~>
#       # @state.target
#       fn = (pos) ~>
#         unit = @props.delta / @state.target.length * 0.75
#         delay: (pos) * unit
#         duration: unit * 5
#
#       [0 to @state.target.length].forEach do
#         (s) ~>
#           @tweenState "item#{s}", do
#             {
#               easing: easingTypes.easeOutExpo
#               endValue: 0
#               ...fn(s)
#             }
#
#             # delay: s * (@props.delta / @state.target.length / 2)
#             # duration: @props.delta / 2
#             # beginValue: @state.svgLengths[s]
#
#         {}
#
#
#   @gis = ->
#     {}
#
#   @lc = {
#     cwm: ->
#       @handleNewProps!
#     cwrp: (np) ->
#       if np.str != @props.str
#         @handleNewProps!
#   }
#
#   @r$textView = ->
#     @svg do
#       style:
#         fill: 'none'
#         stroke: 'white'
#         width: '100%'
#       @state.target.map (ds, i) ~>
#         @path do
#           key: i
#           strokeDasharray: @state.svgLengths[i]
#           style:
#             strokeDashoffset: @getTweeningValue("item#{i}")
#           d: ds.join ''
#       ...
#
#   @r = ->
#     [{},{},{$slider,$textView}] = [@state,@props,@$el!]
#     @div do
#       style:
#         width: '100%'
#       # 'something'
#       $textView!
#       ...

export SvgAnimatedText = new CustomComponent ->
  @mixins = [Mixin]
  @pt = {
    str: pt.string
    delta: pt.number
  }
  @handleNewProps = ->
    # console.log 'handleNewProps'
    # return if @props.str.length == 0
    {str,delta} = @props
    target = CaligraphTextViewCache[str]
    svgLengths = target.map (el) ->
      $path.setAttribute 'd', el.join(' ')
      $path.getTotalLength!
    # items = [0 to target.length].reduce ( (ag,s) -> ag <<< "item#{s}": svgLengths[s] ), {}
    offsetPos = svgLengths
    @setState (<<< {svgLengths,target,offsetPos})
      # @state.target
      # setTimeout ~>
      #   @setState (<<< {offsetPos = [0] * target.length})
      # ,10
      # fn = (pos) ~>
      #   unit = @props.delta / @state.target.length * 0.75
      #   delay: (pos) * unit
      #   duration: unit * 5

      # [0 to @state.target.length].forEach do
      #   (s) ~>
      #     @tweenState "item#{s}", do
      #       {
      #         easing: easingTypes.easeOutExpo
      #         endValue: 0
      #         ...fn(s)
      #       }
      #   {}
  @lc = {
    scu: (nextprops) ->
      # return false if nextprops.str.length == 0
      nextprops.str != @props.str
    cwm: ->
      @handleNewProps!
    cwrp: (np) ->
      if np.str != @props.str
        @handleNewProps!
  }

  @r = ->
    [{svgLengths,target, offsetPos},{str,delta},{}] = [@state,@props,@$el!]

    @div do
      style:
        width: '100%'
      @svg do
        style:
          width: '100%'
          fill: 'none'
          stroke: 'white'
        target?map (d, i) ~>
          @path do
            strokeDasharray: svgLengths[i]
            d: d.join ' '
            style:
              strokeDashoffset: svgLengths[i]
            ref: ~>
              unit = delta / target.length
              delay = unit * i
              duration = (delta - delay)
              &0?animate do
                [{strokeDashoffset: svgLengths[i]}, {strokeDashoffset: 0}]
                {duration: duration * 0.7, delay: delay * 0.7 ,timingFunction: 'linear'}

            key: i

            # style:
              # transitionDuration:
              #   | offsetPos[i] is svgLengths[i] => delta * 0.75
              #   | _ => delta * 0.75
              # strokeDashoffset: 0
