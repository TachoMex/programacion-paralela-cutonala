
run:

```
$ bundle exec rackup -p 9293
```

```
$ pry
pry > require 'ant/client'
pry > client = Ant::Client::Base.new(format: :json, endpoint: 'http://localhost:9293')
pry > token = client.get('/auth?user=test')
pry > client.get("/?token=#{token[:token]}")
```
