module RavMeserV2
  module PersonalField
    def get_personal_fields
      send_request(:get, "/personal-fields")
    end

    def create_personal_field(list_id, query_params = {})
      send_request(:post, "/personal-fields", query_params.merge({list_ids: [list_id]}))
    end

    def update_personal_field(field_id, query_params = {})
      send_request(:put, "/personal-fields/#{field_id}", query_params)
    end
  end
end