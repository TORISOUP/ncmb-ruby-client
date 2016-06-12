module NCMB
  class RoleClient
    include NCMB
    class RoleException < Exception;
    end


    def base_path
      @base_path ||= "/#{@@client.api_version}/roles"
    end

    def get_roles
      result = @@client.get(path: self.base_path, params: {})
      p result
      data_array = result[:results]
      data_array.map { |x|
        Role.new(x[:objectId], x[:roleName])
      }
    end

    def get_role_by(query)
      result = @@client.get(path: self.base_path, params: {'where': query.to_json})
      raise RoleException.new("ロールの取得に失敗しました #{result}") if result.has_key?(:code)
      data_array = result[:results]
      data_array.map { |x|
        Role.new(x[:objectId], x[:roleName])
      }.first
    end

  end
end
