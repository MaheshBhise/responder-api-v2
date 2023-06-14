module RavMeserV2
  module PersonalField
    def get_personal_fields(list_id = nil)
      if list_id
        send_request(:get, "/lists/#{list_id}/personal-fields")
      else  
        send_request(:get, "/personal-fields")
      end
    end

    def create_personal_field(list_id, query_params = {})
      send_request(:post, "/personal-fields", query_params.merge({list_id: list_id}))
    end

    def update_personal_field(field_id, query_params = {})
      send_request(:put, "/personal-fields/#{field_id}", query_params)
    end
  end
end