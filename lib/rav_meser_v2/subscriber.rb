module RavMeserV2
  module Subscriber
    def get_subscribers(list_id, query_params = {})
      send_request(:get, "/lists/#{list_id}/subscribers", query_params)
    end

    def create_subscriber(list_id, query_params = {})
      send_request(:post, "/subscribers", query_params.merge({list_ids: [list_id]}))
    end

    def update_subscriber(subscriber_id, query_params = {})
      send_request(:put, "/subscribers/#{subscriber_id}", query_params)
    end
  end
end