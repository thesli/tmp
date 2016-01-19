require!{
  'react': React
  'react-router': {Router,Route, browserHistory}
  '../Root': {Root}
  '../Widgets/YoutubeWidget/el': {YoutubeWidget}
  '../DemoPages/YTWidgetDemoPage': {YTWidgetDemoPage}
  '../DemoPages/TextScrollViewPage': {TextScrollViewPage}
  '../DemoPages/CaptionRenderer': {CaptionRendererPage}
  '../Blog/PostPage/el': {PostPage}
}

[Route] = [Route].map React.createFactory

export routes =
  Route do
    path: '/'
    component: Root
    Route do
      path: '/post'
      component: PostPage
    Route do
      path: '/demo/widget/youtube'
      component: YTWidgetDemoPage
    Route do
      path: '/dev/tsv'
      component: TextScrollViewPage
    Route do
      path: '/dev/caption'
      component: CaptionRendererPage
    ...
