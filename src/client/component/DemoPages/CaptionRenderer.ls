require!{
  'react': React
  'opentype.js': opentype
  '../../util/CustomComponent': {CustomComponent}
}
var data
data = []
opentype.load '/asset/Ubuntu-L.ttf', (err,Font) ->
  strs = [1 to 100].map -> Math.random!toString(36)slice(-10)
  opentype.load '/asset/Ubuntu-L.ttf', (err,Font) ->
    lt = 0
    strs.forEach (s) ->
      lineNumberMap = Font.stringToGlyphs(s)
      .map (.path.commands)
      .map (el) -> el.filter((.type == 'M')).length
      t = Font.getPath(s,0,35,35).toPathData!
      |> (/ "M")
      |> (.[1 to -1])
      |> (.map -> "M" + &0)
      out = lineNumberMap.map (n) -> t.splice 0, n
      data.push do
        s: s
        d: out
        lt: lt
        rt: lt += 2

pt = React.PropTypes

export CaptionRenderer = new CustomComponent ->
  @pt = {
    schema: pt.array
  }
  @r = ->
    @div do
      className: 'caption-render'
      'HELLO WORLD'


schema = {
  s: ''
  d: ''
  lt: 1
  rt: 1
}


export CaptionRendererPage = new CustomComponent ->
  @r$Slider = ->
    @input do
      className: 'slider'
      min: 0
      max: 100
      value: 50
      onChange: ~>
      type: 'range'

  @r = ->
    [{},{},{$Slider}] = [@state,@props,@$el!]
    @div do
      className: 'caption-render-page'

      $Slider!
      CaptionRenderer~el {schema: data}, ''
      ...
