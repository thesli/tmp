require!{
  'co'
  'redux': {createStore}
  'react-redux': {connect,Provider}
  'redux-persist': {persistStore, autoRehydrate}
}

Provider = Provider |> React.createFactory

store = autoRehydrate()(createStore) (state = {count: 0},action) ->
  o = switch action.type
  | 'PLUS' => count: state.count + 1
  | 'MINUS' => count: state.count - 1
  o || state
persistStore store
