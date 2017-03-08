require 'httparty'

module PipedriveAPI
  HEADERS = { "Content-Type" => "application/json" }
  API_VERSION = "v1"

  class Base
    include HTTParty
    format :json
    headers HEADERS

    class << self

      def auth(api_token:, account_name: "api")
        default_params api_token: api_token
        base_uri "https://#{account_name}.pipedrive.com/#{API_VERSION}/"
      end

      def all(**params)
        # TODO pagination
        response = get "#{resource_path}", query: params
        handle response
      end

      def find(id)
        response = get "#{resource_path}/#{id}"
        handle response
      end

      def find_by_name(name, **params)
        response = get "#{resource_path}/find", query: { term: name }.merge(params)
        handle response
      end

      def create(**params)
        response = post resource_path, body: params.to_json
        handle response
      end

      def update(id, **params)
        response = put "#{resource_path}/#{id}", body: params.to_json
        handle response
      end

      def resource_path
        # The resource path should match the camelCased class name with the
        # first letter downcased.  Pipedrive API is sensitive to capitalisation
        klass = name.split('::').last
        klass[0] = klass[0].chr.downcase
        klass.end_with?('y') ? "/#{klass.chop}ies" : "/#{klass}s"
      end

      def handle response
        case response.code
        when 200
          response['data']
        when 404
          raise HTTParty::Error, response.parsed_response['error']
        when 500..600
          raise HTTParty::Error, response.parsed_response['error']
        else
          raise StandardError, 'Unknown error'
        end
      end

    end

  end
end
