module RavMeserV2
  module Subscriber
    def get_subscribers(list_id, query_params = {})
      send_request(:get, "/lists/#{list_id}/subscribers", query_params)
    end

    def create_subscriber(list_id, body_params = {})
      send_request(:post, "/subscribers", body_params.merge({list_ids: [list_id]}))
    end

    def update_subscriber(subscriber_id, query_params = {})
      send_request(:put, "/subscribers/#{subscriber_id}", query_params)
    end

    def search_subscribers(list_id, search_key, offset = 0, limit = 1)
      search_params = {
        listId: list_id,
        searchKey: search_key,
        offset: offset,
        size: limit
      }
      send_request(:post, "/subscribers/search", {}, search_params)
    end
  end
end