require!{
  'react': {Children,cloneElement,createFactory}:React
  '../../../util/CustomComponent': {CustomComponent}
  '../PostEl/el.ls': {PostEl}
  '../Sec/el.ls': {Sec}
  'react-lorem-component': Lorem
}

export PostPage = new CustomComponent ->
  @r = ->
    ``(
      <div>
        <PostEl>
          <Sec>
            <h3>item 1</h3>
            <Lorem />
            <Sec level="1">
              <h4>something</h4>
              <Lorem />
            </Sec>
          </Sec>
          <Sec>
            <h3>item 2</h3>
            <Lorem />
          </Sec>
        </PostEl>
      </div>
    )``
