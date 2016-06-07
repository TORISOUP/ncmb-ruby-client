module NCMB
  class RoleClient
    include NCMB

    def base_path
      @base_path ||= "/#{@@client.api_version}/roles"
    end

    def get
      p @@client.get(self.base_path, {})
    end
  end
end
