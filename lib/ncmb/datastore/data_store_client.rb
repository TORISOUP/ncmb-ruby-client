module NCMB
  class DataStoreClient

    include NCMB

    private def base_path
      @base_path ||= "/#{@@client.api_version}/classes/#{@class_name}"
    end

    def initialize(class_name, session_token = nil)
      @class_name = class_name
      @session_token = session_token
    end

    def save(data_hash, acl_hash = nil)
      if !acl_hash.nil?
        data_hash['acl'] = acl_hash
      end
      @@client.post(path: "#{base_path}", params: data_hash, session_token: @session_token)
    end

    def find(query)
      @@client.get(path: "#{base_path}", params: {where: query}, session_token: @session_token)
    end

  end
end
