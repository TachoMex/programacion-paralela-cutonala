run
```
$ gem install -l ruby-ant-client-1.0.0.gem
```

on Gemfile:

```
gem 'ruby-ant-client'

```

on source:

Ant::Client::Base implements:
- get
- post
- put
- patch
- delete

```ruby
class AntExample < Ant::Client::Base
  def auth(user, pass)
    post('/api/auth/', user: user, pass: pass)
  end
end

client = AntExample.new(
  format: :json,
  endpoint: 'http://localhost'
)

ap(client.auth('user', 'password'))

```
