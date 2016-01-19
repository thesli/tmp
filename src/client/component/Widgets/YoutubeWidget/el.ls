require!{
  'react': React
  'exenv': {canUseDOM}
  '../../../util/CustomComponent': {CustomComponent}
  'opentype.js': opentype
  'point-at-length': pts
  '../CaligraphTextView/el': {CaligraphTextView}
  '../SvgAnimatedText/el': {SvgAnimatedText}
}
window?pts = pts
pt = React.PropTypes

window?CaligraphTextViewCache = {}
data = ->
  el = """
      [ {
    "ltime": 15.640283,
    "rtime": 18.449293,
    "s": "Hands, put your empty hands in mine"
    }, {
    "ltime": 20.157988,
    "rtime": 23.201206,
    "s": "And scars, show me all the scars you hide"
    }, {
    "ltime": 24.894664,
    "rtime": 27.457267,
    "s": "And hey, if your wings are broken"
    }, {
    "ltime": 27.903906,
    "rtime": 30.447529,
    "s": "Please take mine so yours can open too"
    }, {
    "ltime": 31.890567,
    "rtime": 33.446771,
    "s": "'Cause I'm gonna stand by you"
    }, {
    "ltime": 34.903051,
    "rtime": 38.448856,
    "s": "Oh, tears make kaleidoscopes in your eyes"
    }, {
    "ltime": 40.407949,
    "rtime": 43.452165,
    "s": "And hurt, I know you're hurting, but so am I"
    }, {
    "ltime": 45.401032,
    "rtime": 47.955653,
    "s": "And love, if your wings are broken"
    }, {
    "ltime": 48.656681,
    "rtime": 50.694497,
    "s": "Borrow mine till yours can open too"
    }, {
    "ltime": 52.128533,
    "rtime": 54.697753,
    "s": "'Cause I'm gonna stand by you"
    }, {
    "ltime": 54.867377,
    "rtime": 56.457798,
    "s": "Even if we're breaking down"
    }, {
    "ltime": 57.632434,
    "rtime": 58.700041,
    "s": "We can find a way to break through"
    }, {
    "ltime": 60.146095,
    "rtime": 61.201481,
    "s": "Even if we can't find heaven"
    }, {
    "ltime": 62.642523,
    "rtime": 63.702126,
    "s": "I'll walk through Hell with you"
    }, {
    "ltime": 64.65659,
    "rtime": 68.943634,
    "s": "Love, you're not alone, 'cause I'm gonna stand by you"
    }, {
    "ltime": 70.154481,
    "rtime": 71.706695,
    "s": "Even if we can't find heaven"
    }, {
    "ltime": 72.886319,
    "rtime": 74.188112,
    "s": "I'm gonna stand by you"
    }, {
    "ltime": 75.405989,
    "rtime": 76.95818,
    "s": "Even if we can't find heaven"
    }, {
    "ltime": 78.39022,
    "rtime": 79.190197,
    "s": "I'll walk through Hell with you"
    }, {
    "ltime": 80.130647,
    "rtime": 84.199514,
    "s": "Love, you're not alone, 'cause I'm gonna stand by you"
    }, {
    "ltime": 85.147969,
    "rtime": 86.703153,
    "s": "Yeah, you're all I never knew I needed"
    }, {
    "ltime": 88.642814,
    "rtime": 92.197848,
    "s": "And the heart, sometimes it's unclear why it's beating"
    }, {
    "ltime": 93.887293,
    "rtime": 96.458149,
    "s": "And love, if your wings are broken"
    }, {
    "ltime": 97.155185,
    "rtime": 99.681576,
    "s": "We can brave through those emotions too"
    }, {
    "ltime": 100.651028,
    "rtime": 102.424434,
    "s": "'Cause I'm gonna stand by you"
    }, {
    "ltime": 104.154104,
    "rtime": 107.687914,
    "s": "Oh, truth, I guess truth is what you believe in"
    }, {
    "ltime": 109.138185,
    "rtime": 112.918402,
    "s": "And faith, I think faith is having a reason"
    }, {
    "ltime": 113.643668,
    "rtime": 116.938304,
    "s": "Nah nah nah, love, if your wings are broken"
    }, {
    "ltime": 117.146744,
    "rtime": 119.939542,
    "s": "Borrow mine till yours can open too"
    }, {
    "ltime": 121.53405,
    "rtime": 123.180202,
    "s": "'Cause I'm gonna stand by you"
    }, {
    "ltime": 123.889256,
    "rtime": 125.204268,
    "s": "Even if we're breaking down"
    }, {
    "ltime": 126.14549,
    "rtime": 127.698701,
    "s": "We can find a way to break through"
    }, {
    "ltime": 128.636136,
    "rtime": 130.693952,
    "s": "Even if we can't find heaven"
    }, {
    "ltime": 131.6454,
    "rtime": 132.938191,
    "s": "I'll walk through Hell with you"
    }, {
    "ltime": 133.638221,
    "rtime": 137.950502,
    "s": "Love, you're not alone, 'cause I'm gonna stand by you"
    }, {
    "ltime": 138.650531,
    "rtime": 140.94675,
    "s": "Even if we can't find heaven"
    }, {
    "ltime": 141.869968,
    "rtime": 143.441183,
    "s": "I'm gonna stand by you"
    }, {
    "ltime": 144.150441,
    "rtime": 145.952826,
    "s": "Even if we can't find heaven"
    }, {
    "ltime": 146.389465,
    "rtime": 148.453472,
    "s": "I'll walk through Hell with you"
    }, {
    "ltime": 148.897117,
    "rtime": 152.938752,
    "s": "Love, you're not alone, 'cause I'm gonna stand by you"
    }, {
    "ltime": 154.900838,
    "rtime": 158.700057,
    "s": "I'll be your eyes till yours can shine"
    }, {
    "ltime": 159.895916,
    "rtime": 163.441948,
    "s": "And I'll be your arms, I'll be your steady satellite"
    }, {
    "ltime": 164.886006,
    "rtime": 166.685398,
    "s": "And when you can't rise"
    }, {
    "ltime": 167.651062,
    "rtime": 171.447288,
    "s": "Well, I'll crawl with you on hands and knees, 'cause I"
    }, {
    "ltime": 172.389734,
    "rtime": 174.168128,
    "s": "(I'm gonna stand by you)"
    }, {
    "ltime": 175.133589,
    "rtime": 176.690791,
    "s": "Even if we're breaking down"
    }, {
    "ltime": 177.370821,
    "rtime": 179.953673,
    "s": "We can find a way to break through (come on)"
    }, {
    "ltime": 180.141887,
    "rtime": 181.668863,
    "s": "Even if we can't find heaven"
    }, {
    "ltime": 182.388121,
    "rtime": 183.953327,
    "s": "I'll walk through Hell with you"
    }, {
    "ltime": 184.890558,
    "rtime": 188.94641,
    "s": "Love, you're not alone, 'cause I'm gonna stand by you"
    }, {
    "ltime": 190.386477,
    "rtime": 191.68827,
    "s": "Even if we can't find heaven"
    }, {
    "ltime": 192.393514,
    "rtime": 194.189913,
    "s": "I'm gonna stand by you"
    }, {
    "ltime": 195.13737,
    "rtime": 196.690558,
    "s": "Even if we can't find heaven"
    }, {
    "ltime": 197.40061,
    "rtime": 199.191998,
    "s": "I'll walk through Hell with you"
    }, {
    "ltime": 199.640858,
    "rtime": 204.696896,
    "s": "Love, you're not alone, 'cause I'm gonna stand by you"
    }, {
    "ltime": 205.144759,
    "rtime": 206.944151,
    "s": "Love, you're not alone"
    }, {
    "ltime": 208.386191,
    "rtime": 210.183813,
    "s": "Oh, I'm gonna stand by you"
    }, {
    "ltime": 215.638749,
    "rtime": 217.684548,
    "s": "Yeah, I'm gonna stand by you"
    }]

  """

lyrics = data! |> JSON.parse
do populateCache = ->

  if window?
    opentype.load '/asset/Ubuntu-L.ttf', (err,Font) ->

      lyrics.forEach ({s}) ->
        lineNumberMap = Font.stringToGlyphs(s)
        .map (.path.commands)
        .map (el) -> el.filter((.type == 'M')).length
        t = Font.getPath(s,0,35,35).toPathData!
        |> (/ "M")
        |> (.[1 to -1])
        |> (.map -> "M" + &0)
        out = lineNumberMap.map (n) -> t.splice 0, n
        window.CaligraphTextViewCache[s] = out

    # $svg = document.createElementNS 'http://www.w3.org/2000/svg','svg'
    # $svg.innerHTML = fontSvg
    # document.body.appendChild $svg


export SVGTextView = new CustomComponent ->
  @pt = {
    ltime: pt.number
    rtime: pt.number
    s: pt.string
    ctime: pt.number
    charPos: pt.number
  }
  @r = ->
    @svg {}

export YoutubeWidgetControls = new CustomComponent ->
  @gis = ->
    el = React.Children.only @props.children
    videoId: el.props.videoId
    videoTime: 0
    targetVideoTime: 0
    videoInfo: {}

  @lc = {
    cwm: ->
      el = React.Children.only @props.children
      # @setState (<<< el.props)
    cdm: ->
  }

  @r$toolbar = ->
    @div do
      className: 'YT-control-bar'
      style:
        display: 'flex'
      @input do
        style:
          flex: 1
          type: 'text'
          color: 'black'
        value: @state.videoId
        onChange: ({{value}:target}) ~>
          @setState (<<< videoId: value)
        placeholder: 'videoId'
      @input do
        style:
          flex: 3
        type: 'range'
        min: 0
        max: 100
        value:  @state.videoTime / @state.videoInfo.duration * 100
        onChange: ({{value}:target}) ~>
          @setState (<<< targetVideoTime: value * @state.videoInfo.duration / 100)
        onWheel: ({deltaY})~>
          t =
            | deltaY > 0 => -1
            | deltaY < 0 => +1
          @setState (<<< targetVideoTime: @state.videoTime + t)

          # debugger
      @input do
        style:
          flex: 0.3
          type: 'text'
          color: 'black'
        value: @state.videoTime
      ...

  @r$lyricsView = ->
    # t = lyrics.find ({ltime,rtime,s}) ~> (ltime - 0.5) < @state.videoTime < (rtime)

    t = lyrics
    .filter ({ltime,rtime,s}) ~> (ltime) < @state.videoTime < (rtime)
    .pop!

    # @div {}, t?s
    if t?
      SvgAnimatedText~el do
        str: t.s
        delta: (t.rtime - t.ltime) * 1000

  @r$clonedVideoElement = ->
    YtElement = React.Children.only @props.children
    React.cloneElement YtElement, do
      videoId: @state.videoId
      videoTime: @state.targetVideoTime
      timeChangeHandler: (t) ~> @setState (<<< {videoTime: t})
      readyHandler: (t) ~> @setState (<<< videoInfo: t)

  @r = ->
    {$toolbar,$clonedVideoElement,$lyricsView} = @$el!

    @div do
      style:
        width: '100%'
        height: '200'
      $toolbar!
      $clonedVideoElement!
      $lyricsView!

export YoutubeWidget = new CustomComponent ->
  @dn = 'YoutubeWidget'
  @attachYTPlayer = ->
    {videoId} = @props
    {{ENDED,PLAYING,PAUSED,BUFFERING,CUED}:PlayerState} = YT
    @player = new YT?Player do
      @refs['yt-frame']
      videoId: videoId
      width: '100%'
      events:
        onReady: ~>
          @setState (<<< {+YTVideoReady})
          @props.readyHandler? {...@player.getVideoData!,duration: @player.getDuration!}
        onStateChange: ({target,data})~>
          do tracker = ~>
            t = @player.getCurrentTime!
            @props?timeChangeHandler? t
          switch data
          | ENDED, PAUSED, BUFFERING, CUED =>
            # do tracker
            clearInterval @timeTracker
          | PLAYING =>
            # do tracker
            @timeTracker = setInterval tracker, 300
          | _ =>

  @checkYoutubeApi = ->
    attachListener = ~>
      do checkYTObject = ~>
        if window.YT?Player
          clearInterval @checkYTInterval
          @setState (<<< YTApiReady: true)
      @checkYTInterval = setInterval checkYTObject, 1000
    apiURL = "https://www.youtube.com/iframe_api"
    $script = document.querySelector "script[src='#{apiURL}']"
    unless window.YT?
      $script = document.createElement 'script'
        ..src = apiURL
        ..addEventListener 'load', attachListener
      $script |> document.head.appendChild
    else
      attachListener!

  @pt = {
    videoId: pt.string
    videoTime: pt.number
    readyStateCallback: pt.func
    timeTrackStateCallback: pt.func
  }

  @gis = -> {
    YTApiReady: window?YT?
    YTVideoReady: false
  }

  @lc = {
    cwu: (np,ns) ->
      | ns.YTApiReady != @state.YTApiReady => @attachYTPlayer!
      | np.videoId != @props.videoId and @player? => @player.loadVideoById np.videoId
      | np.videoTime != @props.videoTime and @player? => @player.seekTo np.videoTime

    cwm: ->
      if canUseDOM
        @checkYoutubeApi!
    cdm: ->
      if window?YT?Player
        @attachYTPlayer!

    cwum: ->
      clearInterval @timeTracker
      delete @player
  }

  @r = ->
    {videoId} = @props
    videoId = 'bwB9EMpW8eY'
    @div {},
      @div do
        className: 'YT-Frame'
        ref: 'yt-frame'
      ...
