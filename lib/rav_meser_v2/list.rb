module RavMeserV2
  module List
    def get_lists(query_params = {})
      send_request(:get, '/lists', query_params)
    end
  end
end