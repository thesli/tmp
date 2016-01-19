require!{
  'react': React
  'react-dom': {render}
  'react-router': {Router,Route,browserHistory}
  './component/Routes/RouterEl': {RouterEl}
}

window.addEventListener 'load', ->
  $container = document.querySelector '#container'
  render(RouterEl, $container)  

require!{
  'opentype.js': opentype
}
