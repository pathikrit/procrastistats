CONSUMER_KEY = '11552-470488bc7a267c1c98f7695f'

setup = require('child_process').spawn 'bash', ['oauth.sh', CONSUMER_KEY]
key = {}
setup.stdout.on 'data', (data) -> key = data
setup.on 'close', (code) -> fetch JSON.parse(key).access_token

request = require 'request'
fetch = (accessToken, count = 5000, offset = 0, result = []) ->
  request.post({
    url: 'https://getpocket.com/v3/get'
    form: consumer_key: CONSUMER_KEY, access_token: accessToken, state: 'all', count: count, offset: offset
  }, (e, r, body) ->
    list = JSON.parse(body).list
    result.push list[id] for id of list
    numItems = Object.keys(list).length
    console.log "Fetched #{numItems} items"
    if numItems is count
      fetch accessToken, count, offset + count, result
    else
      (require 'fs').writeFileSync 'pocket.json', JSON.stringify(result, null, 2)
  )
