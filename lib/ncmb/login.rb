module NCMB
  class Login
    include NCMB


    def base_path
      @base_path ||= "/#{@@client.api_version}/login"
    end

    def login(user_id, password)
      @@client.get(path: base_path, params: {userName: user_id, password: password})
    end

  end
end
