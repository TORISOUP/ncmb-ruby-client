module NCMB
  class Role
    class RoleException < Exception;
    end

    include NCMB

    private def base_path
      @base_path ||= "/#{@@client.api_version}/roles"
    end

    private def users_path
      @user_path ||= "/#{@@client.api_version}/users"
    end

    def initialize(object_id, role_name)
      @object_id = object_id
      @role_name = role_name
    end

    def add_user(user_object_id, session_token = nil)
      update_user_role(true, user_object_id, session_token)
    end

    def remove_user(user_object_id, session_token = nil)
      update_user_role(false, user_object_id, session_token)
    end


    private
    def update_user_role(is_add, user_object_id, session_token)
      opt = is_add ? "AddRelation" : "RemoveRelation"
      data={
          belongUser: {
              __op: opt,
              objects: [
                  {
                      __type: "Pointer",
                      className: "user",
                      objectId: user_object_id
                  }
              ]
          }
      }
      result = @@client.put(path: "#{base_path}/#{@object_id}", params: data, session_token: session_token)
      return true if result.has_key?(:updateDate)
      raise RoleException.new("roleの更新に失敗しました roleName=#{@role_name} user_id=#{object_id} is_add=#{is_add} error_message=#{result}")

    end

  end
end
