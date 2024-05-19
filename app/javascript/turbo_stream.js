document.addEventListener('turbo:before-fetch-response', (event) => {
  var json = JSON.parse(
    event.detail.fetchResponse.header('X-Flash-Messages')
  )
  // メッセージを表示する
  for(const key in json){
    alert(key + ':' + decodeURI(json[key]))
  }
  
  // turbo frameから リダイレクトを望まれていたらリダイレクトする
  if(event.detail.fetchResponse.header('X-Turbo-Connect') && typeof (event.detail.fetchResponse) !== 'undefined') {
    var response = event.detail.fetchResponse.response
    if (response.redirected) {
      event.preventDefault()
      Turbo.visit(response.url, {action: 'replace'})
    }
  }
})
