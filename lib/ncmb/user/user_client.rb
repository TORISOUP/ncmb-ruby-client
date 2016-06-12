module NCMB
  class UserClient
    include NCMB

    def initialize(session_token)
      @session_token = session_token
    end

    def base_path
      @base_path ||= "/#{@@client.api_version}/users"
    end

    def get(user_object_id)
      path = "#{base_path}/#{user_object_id}"
      p @@client.get(path: path, params: {}, session_token: @session_token)
    end

  end
end
