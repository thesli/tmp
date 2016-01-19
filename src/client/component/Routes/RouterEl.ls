require!{
  './index': {routes}
  'react-router': {Router,Route, browserHistory}
  'history': {createHistory}
}

Router = Router |>  React.createFactory

export history = createHistory!
export RouterEl = Router({history}, routes)
