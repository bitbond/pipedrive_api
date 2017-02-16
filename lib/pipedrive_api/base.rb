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
        base_uri "https://#{account_name}.pipedrive.com/#{API_VERSION}/"
        default_params api_token: api_token
      end

      def all(**params)
        # TODO pagination
        response = get "#{resource_path}", query: params
      end

      def find(id)
        response = get "#{resource_path}/#{id}"
      end

      def find_by_name(name, **params)
        response = get "#{resource_path}/find", query: { term: name }.merge(params)
      end

      def create(**params)
        response = post resource_path, body: params.to_json
      end

      def update(id, **params)
        response = put "#{resource_path}/#{id}", body: params.to_json
      end

      def resource_path
        # The resource path should match the camelCased class name with the
        # first letter downcased.  Pipedrive API is sensitive to capitalisation
        klass = name.split('::').last
        klass[0] = klass[0].chr.downcase
        klass.end_with?('y') ? "/#{klass.chop}ies" : "/#{klass}s"
      end

    end

  end
end
