require!{
  'koa'
  'koa-graphql': graphqlHTTP
  'koa-static': serve
  'koa-mount': mount
  'koa-favicon': favicon
  'path'
  'clear'
}

require!{
  './route/ReactRoute': {ReactRoute}
}

app = koa!
app = let @ = koa!
  @use mount('/asset/', serve("#{__dirname}/../../build/client/bundle" |> path.resolve))
  @use favicon("#{__dirname}/ubuntu.ico")
  @use ReactRoute

  @listen 4000, ->
    console.log 'listening at port 4000'
