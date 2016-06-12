module NCMB
  class Login
    include NCMB


    def base_path
      @base_path ||= "/#{@@client.api_version}"
    end

    def login(user_id, password)
      @@client.get(path: "#{base_path}/login", params: {userName: user_id, password: password})
    end


    def logout
      @@client.get(path: "#{base_path}/logout", params: {})
    end

  end
end
