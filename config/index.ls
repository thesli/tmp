require!{
  'prelude-ls': pl
  'path'
  'webpack': {ProvidePlugin,HotModuleReplacementPlugin,{CommonsChunkPlugin}:optimize}:webpack
  'extract-text-webpack-plugin': ExtractTextPlugin
  'write-file-webpack-plugin': WriteFilePlugin
  'path'
}
nodemonConfig = {
  script: "#{__dirname}/../src/server/index.ls"
  files: ["./index.ls"]
}

webpackConfig = {
  entry: {
    app: [
      'regenerator-runtime-only'
      './src/client'
    ]
    vendor: [
      "react", "react-redux", "react-dom", "react-router"
      "redux", "redux-persist", "redux-simple-router"
      "web-animations-js", "opentype.js"
    ]
  }
  output: {
    path: "#{__dirname}/build/client/bundle"
    filename: "[name].js"
  }
  module: {
    loaders: [
      * test: /\.ls$/
        loaders: ['jsx','livescript']
      * test: /\.css$/
        loaders: ['style','css','postcss']
      * test: /\.json/
        loaders: ['json']
      * test: /\.svg/
        loaders: ['svg']
    ]
  }
  resolve: {
    extensions: ['','.js','.ls','.']
  }
  target: 'web'
  # postcss: -> ['postcss-inline-svg','autoprefixer','precss','lost']
  plugins: [
    new CommonsChunkPlugin 'vendor.js'
    new ProvidePlugin do
      'React': 'react'
    new ExtractTextPlugin 'app.css', {+allChunks}
  ]
  devtool: "sourcemap"
  watch: __watch__
}

postcssConfig = do ->
  [
    require('autoprefixer')({browsers: ['last 2 versions']})
    require('postcss-import')({+glob})
    require('postcss-nesting')()
    require('postcss-nested-props')()
    require('postcss-nested')()
    require('postcss-advanced-variables')()
    require('postcss-media-minmax')()
    require('rucksack-css')()
    # require('postcss-bem')()
  ]

nodemonConfig = {
  script: "#{__dirname}/../build/server/index.js"
  watch: [
    "#{__dirname}/../build/server/"
  ]
  execMap:
    js: 'node'
  ext: 'js'
}

export Config = {
  webpack: webpackConfig
  postcss: postcssConfig
  nodemon: nodemonConfig
}
