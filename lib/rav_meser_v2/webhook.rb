module RavMeserV2
  module Webhook
    def create_webhook(list_id, body_params = {})
      body_params.merge!({list_id: list_id, url: body_params[:url]})
      body_params.merge!(
        {
          name: "schooler webhook - #{Random.hex(4)}", 
          webhooks_send_type_id: 2, 
          events: [1,2,5], 
          merges: {email: "email",phone: "phone",name: "name"}
        }
      )
      send_request(:post, "/webhooks", body_params)
    end

    def delete_webhook(webhook_id, query_params = {})
      send_request(:delete, "/webhooks/#{webhook_id}", query_params)
    end

    def get_webhooks(list_id, query_params = {})
      send_request(:get, "/webhooks", query_params.merge({list_id: list_id}))
    end
  end
end