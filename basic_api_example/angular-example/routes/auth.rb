module TODOList
  module Auth
    def self.registered(app)
      app.post '/api/auth' do
        true
      end
    end
  end
end
