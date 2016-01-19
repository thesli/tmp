require!{
  'react': {createFactory}:React
  '../../util/CustomComponent': {CustomComponent}
  '../Widgets/YoutubeWidget/el': {YoutubeWidget, YoutubeWidgetControls}
  '../Widgets/CaligraphTextView/el': {CaligraphTextView}
  'opentype.js': opentype
}

export YTWidgetDemoPage = new CustomComponent ->
  @gis = ->
    {ctime: 0}
  @r = ->
    a = Object.keys(window.CaligraphTextViewCache)[10]
    str = window.CaligraphTextViewCache[a]
    # console.log str

    @div {},
      # @input do
      #   type: 'range'
      #   min: 0
      #   max: 2
      #   value: @state.ctime
      #   onChange: ({{value}:target})~> @setState (<<< ctime: value)
      # CaligraphTextView~el do
      #   ltime: 0
      #   rtime: 2
      #   ctime: @state.ctime |> parseFloat
      #   paths: str
      # ...
        # s: "something cool"

        # charPos: 5
      ['bwB9EMpW8eY'].map (id,i) ->
        YoutubeWidgetControls~el do
          key: i
          YoutubeWidget~el {videoId: id}
