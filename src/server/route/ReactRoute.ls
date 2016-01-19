require!{
  'react': {createFactory}: React
  'react-router': {Route,Router,RoutingContext}: ReactRouter
  'react-dom/server': {renderToString}
  'react-transmit': Transmit
  'path'
  'require-nocache': noCache
}

[RoutingContext] = [RoutingContext].map createFactory
__prod__ = false
export ReactRoute = ->*
  if __prod__
    {routes} = require '../../client/component/Routes/index'
    Object.keys(require.cache)
    .filter -> /client\/component/.test &0
    .forEach -> delete require.cache[&0]
    ReactRouter.match {routes,location: @path}, (err,redire,props) ~>
      try
        reactPage = renderToString RoutingContext(props)
      catch e
        console.log e
      finally
        if not reactPage? then reactPage = ""
        @body = """
          <html>
            <head>
              <title>Isomorphic App</title>
              <meta name='viewport' content='width=device-width,initial-scale=1'/>
              <meta charset='utf-8'/>
              <link rel="stylesheet" href="/asset/style.css" />
              <script src='/asset/vendor.js'></script>
              <script src='/asset/app.js'></script>
            </head>
            <body>
              <div id='container'>#{reactPage}</div>
            </body>
          </html>
        """

  @body = """
    <html>
      <head>
        <title>Isomorphic App</title>
        <meta name='viewport' content='width=device-width,initial-scale=1'/>
        <meta charset='utf-8'/>
        <link rel="stylesheet" href="/asset/style.css" />
        <script src='/asset/vendor.js'></script>
        <script src='/asset/app.js'></script>
      </head>
      <body>
        <div id='container'></div>
      </body>
    </html>
  """
