require!{
  'react': {Children,cloneElement,createFactory}:React
  '../../../util/CustomComponent': {CustomComponent}
}
range = document.createRange!
getTextNodeLength = (elNode) ->
  textNode = elNode.childNodes?[0]  
  range.selectNodeContents(textNode)
  range.getClientRects()[0]['width']
export Sec = new CustomComponent ->
  @gis = ->
    fold: false

  @r$SectionTitle = (titleChild) ->
    # cloneElement titleChild , {style: color: 'blue'}
    # console.log @refs?['titlechild']?childNodes?[0]

    @div do
      className: 'blog-section'
      style:
        flexDirection: 'row'
        position: 'relative'
        textAlign: 'center'
        width: '100%'
        letterSpacing: '2px'
        # background: 'rgba(255,255,255,0.1)'
        WebkitUserSelect: 'none'
      onDoubleClick: ~>
        return if (new Date! - @lastDblClick) < 2000
        @lastDblClick = new Date!
        @setState (s) ~>
          # console.log
          s <<< fold: not @state.fold
          s
      cloneElement titleChild, {ref: 'titlechild'}
      @div do
        style:
          display: 'block'
          width: if @state.fold then getTextNodeLength(@refs['titlechild']) * 1.2 else '100%'
          borderBottom: if @state.fold then 'solid 5px rgba(255,255,255,0.1)' else 'solid 5px rgba(255,255,255,0.5)'
          boxSizing: 'border-box'

          transition: '2s all'
          margin: 'auto'
          bottom: 0
        ''
      ...

  @r = ->
    [{fold},{},{$SectionTitle}] = [@state,@props,@$el!]
    children = Children.toArray @props.children
    {titleChild,msgChild} = children.reduce do
      (ag, s) ->
        switch s.type in ['h1','h2','h3','h4','h5','h6']
        | true => ag.titleChild = s
        | false => ag.msgChild.push s
        ag
      {titleChild: null, msgChild: []}

    @section do
      className: 'section'
      style:
        position: 'relative'
      $SectionTitle titleChild

      @div do
        refs: 'content'
        style:
          paddingLeft: 30
          paddingRight: 30
          overflow: 'hidden'
          opacity: if fold then 0 else 1
          maxHeight: if fold then 0 else @refs['content']?clientHeight || 999
          transition: '2s all'
        msgChild
      ...
