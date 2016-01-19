require!{
  'react': React
  # 'react': {{h1,head,body,html,script}:DOM}:React
  '../util/CustomComponent': {CustomComponent}
  'react-router': {Link}
}

Link = Link |> React.createFactory

export Root = new CustomComponent ->
  @dn = 'ROOT'

  @r = ->
    @div do
      className: 'Root'
      @h5 {}, 'title here'.toUpperCase!
      @nav do
        className: 'nav'
        Link {to: '/'}, 'Home'
        Link {to: '/demo/widget/youtube'}, 'Youtube'
        Link {to: '/dev/tsv'}, 'TSV'
        Link {to: '/dev/caption'}, 'Caption'
        Link {to: '/post'}, 'Post'
        ...
      @div {},
        @props.children
        ...
