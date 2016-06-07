module NCMB
  class UserClient
    include NCMB

    def base_path
      @base_path ||= "/#{@@client.api_version}/users"
    end

    def get(user_object_id)
      path = "#{base_path}/#{user_object_id}"
      @@client.get(path, {})
    end

  end
end
