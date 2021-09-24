module RavMeserV2
  module Tag
    def get_tags(query_params = {})
      send_request(:get, "/tag", query_params)
    end

    def create_subscriber_tag(query_params = {})
      send_request(:post, "/tags/subscribers", query_params)
    end

    def get_subscriber_tags(query_params = {})
      send_request(:get, "/tags/subscribers", query_params)
    end
  end
end