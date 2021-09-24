module RavMeserV2
  class Connection
    include HTTParty
    debug_output $stdout

    include List
    include Subscriber
    include Webhook
    include Tag

    RAV_MESER_ENDPOINT = 'https://graph.responder.live/v2/'

    attr_accessor :access_token, :endpoint

    def initialize(client_key, client_secret, user_secret, endpoint = nil)
      @endpoint = endpoint || RAV_MESER_ENDPOINT
      params = { 
                 grant_type: "client_credentials",
                 scope: "*",
                 client_id: client_key,
                 client_secret: client_secret,
                 user_token: user_secret
               }
      response = send_request(:post, '/oauth/token',  params)
      @access_token = response[:token]
    end

    private

    def send_request(type, url, params = {})
      request_params = { 
        headers: { 'Authorization' => "Bearer #{access_token}", 'Content-Type' => 'application/json'},
        base_uri: endpoint,
        :debug_output => $stdout
      }

      case type
        when :get
          url += "?#{URI.encode_www_form(params)}" unless params.empty?
        else
          request_params.merge!({ body: params.to_json })
        end
  
      response = self.class.send(type, url, request_params)
      begin
        response = JSON.parse(response.body, symbolize_names: true)
      rescue StandardError => e
        if ENV['RAV_MESER_DEBUG']
          pp "Response was: ", response, response.body
        end
        raise e, response.body
      end
      response
    end
  end
end