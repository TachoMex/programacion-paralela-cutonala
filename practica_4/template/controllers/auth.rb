module Controller
  class Auth
    def initialize(site, user, password)
      @site = site
      @user = user
      @password = password
    end

    def validate
      validate_password
      message = { site: @site, user: @user }.to_json
      log_info('User login', user: @user, site: @site)
      # This token is very unsafe
      { token: "#{message}::#{Digest::SHA256.hexdigest message}" }
    end

    private

    def validate_password
      # TODO: Connect to database and validate
      ex = Ant::Exceptions::AntFail.new(
        'Invalid credentials',
        'INVALID_CREDENTIALS'
      )
      raise(ex) if @password != 'p4$$w0rd'
    end
  end
end
